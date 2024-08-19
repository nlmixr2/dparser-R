#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include "gramgram.h"
#include "d.h"
#include "mkdparse.h"
#include "dparse.h"
#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>
#include <R_ext/Rdynload.h>
#include <Rmath.h>

extern int d_use_file_name;
extern char *d_file_name;
extern int d_use_r_headers;
extern int d_rdebug_grammar_level;
extern int d_verbose_level;

// Taken from dparser and changed to use R_alloc
char * r_dup_str(const char *s, const char *e) {
  int l = e ? e-s : strlen(s);
  char *ss = (char*)R_alloc(l+1,sizeof(char));
  memcpy(ss, s, l);
  ss[l] = 0;
  return ss;
}


extern D_ParserTables parser_tables_dparser_gram;

static int scanner_block_size;

SEXP cDparser(SEXP fileName,
              SEXP sexp_output_file,
              SEXP set_op_priority_from_rule ,
              SEXP right_recursive_BNF ,
              SEXP states_for_whitespace ,
              SEXP states_for_all_nterms ,
              SEXP tokenizer ,
              SEXP longest_match ,
              SEXP sexp_grammar_ident ,
              SEXP scanner_blocks ,
              SEXP write_line_directives ,
              SEXP rdebug,
              SEXP verbose,
              SEXP sexp_write_extension,
              SEXP write_header,
              SEXP token_type,
              SEXP use_r_header){
  char *grammar_pathname, *grammar_ident, *write_extension, *output_file;
  Grammar *g;
  d_rdebug_grammar_level = INTEGER(rdebug)[0];
  d_verbose_level        = INTEGER(verbose)[0];
  grammar_pathname = r_dup_str(CHAR(STRING_ELT(fileName,0)),0);
  grammar_ident    = r_dup_str(CHAR(STRING_ELT(sexp_grammar_ident,0)),0);
  write_extension  = r_dup_str(CHAR(STRING_ELT(sexp_write_extension,0)),0);
  output_file      = r_dup_str(CHAR(STRING_ELT(sexp_output_file,0)),0);
  g = new_D_Grammar(grammar_pathname);
  /* grammar construction options */
  g->set_op_priority_from_rule = INTEGER(set_op_priority_from_rule)[0];
  g->right_recursive_BNF = INTEGER(right_recursive_BNF)[0];
  g->states_for_whitespace = INTEGER(states_for_whitespace)[0];
  g->states_for_all_nterms = INTEGER(states_for_all_nterms)[0];
  g->tokenizer = INTEGER(tokenizer)[0];
  g->longest_match = INTEGER(longest_match)[0];
  /* grammar writing options */
  strcpy(g->grammar_ident, grammar_ident);
  g->scanner_blocks = INTEGER(scanner_blocks)[0];
  g->scanner_block_size = scanner_block_size;
  g->write_line_directives = INTEGER(write_line_directives)[0];
  g->write_header = INTEGER(write_header)[0];
  g->token_type = INTEGER(token_type)[0];
  strcpy(g->write_extension, write_extension);
  g->write_pathname = output_file;

  d_use_r_headers = INTEGER(use_r_header)[0];
  /* don't print anything to stdout, when the grammar is printed there */
  if (d_rdebug_grammar_level > 0)
    d_verbose_level = 0;

  mkdparse(g, grammar_pathname);

  if (d_rdebug_grammar_level == 0) {
    if (write_c_tables(g) < 0)
      d_fail("unable to write C tables '%s'", grammar_pathname);
  } else {
    print_rdebug_grammar(g, grammar_pathname);
  }
  free_D_Grammar(g);
  g = 0;
  d_use_r_headers = 0;
  d_rdebug_grammar_level = 0;
  d_verbose_level = 0;
  return R_NilValue;
}
