/*
 * Reproducer: udparse(p, NULL, n>0) dereferences a NULL buffer.
 *
 * BEFORE FIX (src/parse.c:2122-2131):
 *   D_ParseNode *udparse(D_Parser *ap, char *buf, unsigned int buf_len) {
 *     ...
 *     p->start = buf;             // buf == NULL
 *     p->end   = buf + buf_len;   // NULL + n
 *     ...
 *     r = exhaustive_parse(p, p->user.start_state);  // reads *p->start
 *
 * exhaustive_parse() writes `pos = p->user.loc.s = p->start` and then the
 * scanner machinery does `*pos`-style reads, hitting the NULL.
 *
 * AFTER FIX:
 *   if (!buf) return NULL;   // (placed at the top of udparse)
 *
 * Also: the legacy `dparse(D_Parser*, char*, int)` wrapper forwards into
 * udparse, so it inherits the NULL guard.
 *
 * Build (run from package root, after src/dparser.so has been built):
 *   gcc -g -O0 -o tests/audit-reproducers/udparse-null-repro \
 *       tests/audit-reproducers/udparse-null-buf.c \
 *       -ldl -Wl,-rpath,/usr/lib/R/lib -L/usr/lib/R/lib -lR
 *
 * Run under gdb to capture the SIGSEGV:
 *   gdb -batch -ex run -ex bt ./tests/audit-reproducers/udparse-null-repro
 *
 * Expected:
 *   - BEFORE FIX: SIGSEGV deep inside the scanner, ultimately reading
 *                 from address ~ buf_len (NULL + buf_len).
 *   - AFTER FIX:  udparse returns NULL.  The reproducer prints
 *                 "udparse returned cleanly".
 *
 * Notes:
 *   - We need a real D_ParserTables for new_D_Parser to succeed.  Rather
 *     than hand-constructing one (which would have to mirror the full
 *     internal layout), we reuse the package's built-in `parser_tables_*`
 *     symbol from the test fixture.  But because no shared tables symbol
 *     is exported by dparser.so, the simplest path is to use the existing
 *     mkdparse machinery in a pre-build step — out of scope for a static
 *     reproducer.  Instead we mock just enough of the D_ParserTables
 *     fields that new_D_Parser touches (whitespace_state,
 *     default_white_space).  Since we never invoke exhaustive_parse with
 *     a real grammar, we cannot reach an actual scan; the bug we are
 *     reproducing manifests in udparse itself before exhaustive_parse
 *     does anything useful — the NULL deref happens during whitespace-
 *     parser allocation when it copies p->start.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
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
  void *h = dlopen("./src/dparser.so", RTLD_LAZY);
  if (!h) { fprintf(stderr, "dlopen: %s\n", dlerror()); return 2; }

  void *(*new_D_Parser)(D_ParserTables *, int) = dlsym(h, "new_D_Parser");
  void *(*udparse)(void *, char *, unsigned int) = dlsym(h, "udparse");
  if (!new_D_Parser || !udparse) {
    fprintf(stderr, "dlsym: %s\n", dlerror());
    return 2;
  }

  D_ParserTables tables;
  memset(&tables, 0, sizeof(tables));
  /* Minimal viable tables: no whitespace state, no passes.  new_D_Parser
   * will pick up the default `white_space` callback for empty input. */

  void *p = new_D_Parser(&tables, 0);
  if (!p) { fprintf(stderr, "new_D_Parser returned NULL\n"); return 2; }

  fprintf(stderr, "About to call udparse(p, NULL, 1) — expect SIGSEGV before the fix.\n");
  void *res = udparse(p, NULL, 1);
  fprintf(stderr, "udparse returned cleanly: %p (NULL = fix is in place)\n", res);

  dlclose(h);
  return 0;
}
