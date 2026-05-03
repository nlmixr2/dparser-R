/*
 * Reproducer: d_pass(p, pn, -1) reads p->t->passes[-1] (out-of-bounds).
 *
 * BEFORE FIX (src/parse.c:1853):
 *   if (pass_number >= (int)p->t->npasses) d_fail(...);
 *   pp = &p->t->passes[pass_number];
 *
 * AFTER FIX:
 *   if (pass_number < 0 || pass_number >= (int)p->t->npasses) d_fail(...);
 *
 * Build (run from package root, after src/dparser.so has been built):
 *   gcc -g -O0 -o tests/audit-reproducers/d-pass-repro \
 *       tests/audit-reproducers/d-pass-negative-pass-number.c \
 *       -ldl -Wl,-rpath,/usr/lib/R/lib -L/usr/lib/R/lib -lR
 *
 * Run under gdb to capture the SIGSEGV / OOB read:
 *   gdb -batch -ex run -ex bt ./tests/audit-reproducers/d-pass-repro
 *
 * Expected behaviour:
 *   - BEFORE FIX: SIGSEGV inside d_pass when reading pp->kind (the negative
 *     subscript points one slot before passes[], which lands on an unmapped
 *     guard page that we mmap-allocate below).
 *   - AFTER FIX: d_pass calls d_fail("bad pass number: -1") which routes
 *     through Rf_error -> longjmp.  Without an active R context the process
 *     terminates via Rf_error's fallback, but it does *not* SIGSEGV.
 *
 * Notes:
 *   - We use new_D_Parser to allocate a real Parser struct (and avoid having
 *     to mirror the internal layout in this file).  After construction we
 *     overwrite p->t with our own tables that have a 1-element passes[] on
 *     a fresh page, with the previous page protected PROT_NONE.
 *   - apn (the parse node) can be NULL: D_ParseNode_to_PNode(NULL) returns
 *     NULL via the D_PN macro, and the OOB read happens before any pn use.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <dlfcn.h>

typedef struct D_Pass {
  char *name;
  unsigned int name_len;
  unsigned int kind;
  unsigned int index;
} D_Pass;

typedef struct D_ParserTables {
  unsigned int nstates;
  void *state;
  unsigned short *goto_table;
  unsigned int whitespace_state;
  unsigned int nsymbols;
  void *symbols;
  void *default_white_space;
  unsigned int npasses;
  D_Pass *passes;
  unsigned int save_parse_tree;
} D_ParserTables;

int main(void) {
  void *handle = dlopen("./src/dparser.so", RTLD_LAZY);
  if (!handle) { fprintf(stderr, "dlopen: %s\n", dlerror()); return 2; }

  void *(*new_D_Parser)(D_ParserTables *, int) = dlsym(handle, "new_D_Parser");
  void  (*d_pass)(void *, void *, int)         = dlsym(handle, "d_pass");
  void  (*free_D_Parser)(void *)               = dlsym(handle, "free_D_Parser");
  if (!new_D_Parser || !d_pass) {
    fprintf(stderr, "dlsym: %s\n", dlerror());
    return 2;
  }

  long page = sysconf(_SC_PAGESIZE);
  void *region = mmap(NULL, 2 * page, PROT_READ | PROT_WRITE,
                      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
  if (region == MAP_FAILED) { perror("mmap"); return 2; }
  if (mprotect(region, page, PROT_NONE) != 0) { perror("mprotect"); return 2; }

  D_Pass *passes = (D_Pass *)((char *)region + page);
  memset(passes, 0, sizeof(D_Pass));
  passes[0].name = "fake";

  D_ParserTables tables;
  memset(&tables, 0, sizeof(tables));
  tables.npasses = 1;
  tables.passes = passes;

  void *p = new_D_Parser(&tables, 0);
  if (!p) { fprintf(stderr, "new_D_Parser returned NULL\n"); return 2; }

  fprintf(stderr, "About to call d_pass(p, NULL, -1) — expect SIGSEGV before the fix.\n");
  d_pass(p, NULL, -1);
  fprintf(stderr, "Returned from d_pass without crash — fix is in place.\n");

  if (free_D_Parser) free_D_Parser(p);
  munmap(region, 2 * page);
  dlclose(handle);
  return 0;
}
