/*
  Copyright 2002-2004 John Plevyak, All Rights Reserved

  Modified to work in R for testing by Matthew L. Fidler (2016)
*/

#include <R.h>
#include <Rinternals.h>
#include <R_ext/Rdynload.h>
#include <Rmath.h>
#include <dparser.h>

#define SIZEOF_MY_PARSE_NODE    100     /* permit test cases up to this size */

char * r_dup_str(const char *s, const char *e);

extern D_ParserTables parser_tables_gram;

int save_parse_tree = 1;
int partial_parses = 0;
int fixup = 1;
int fixup_ebnf = 0;
int compare_stacks = 1;
int commit_actions_interval = 100;
int start_state = 0;
int dont_use_greediness_for_disambiguation = 0;
int dont_use_height_for_disambiguation = 0;

char *ops = "+";
void *ops_cache = NULL; 
int ops_scan(char *ops, void *ops_cache, d_loc_t *loc,
             unsigned char *op_assoc, int *op_priority) 
{
  if (loc->s[0] == '+') {
    loc->s++;
    *op_assoc = ASSOC_BINARY_LEFT;
    *op_priority = 9500;
    return 1;
  }
  return 0;
}

SEXP sample_parser(SEXP sexp_fileName,
                   SEXP sexp_start_state,
                   SEXP sexp_save_parse_tree,
                   SEXP sexp_partial_parses,
                   SEXP sexp_compare_stacks,
                   SEXP sexp_commit_actions_interval,
                   SEXP sexp_fixup,
                   SEXP sexp_fixup_ebnf,
                   SEXP sexp_nogreedy,
                   SEXP sexp_noheight,
                   SEXP sexp_use_filename){
  char *buf = NULL;
  D_Parser *p = NULL;
  D_ParseNode *pn = NULL;
  p = new_D_Parser(&parser_tables_gram, SIZEOF_MY_PARSE_NODE);
  p->save_parse_tree = INTEGER(sexp_save_parse_tree)[0];
  p->ambiguity_fn = ambiguity_count_fn;
  p->partial_parses = INTEGER(sexp_partial_parses)[0];
  p->dont_fixup_internal_productions = !(INTEGER(sexp_fixup)[0]);
  p->fixup_EBNF_productions = INTEGER(sexp_fixup_ebnf)[0];
  p->dont_compare_stacks = !(INTEGER(sexp_compare_stacks)[0]);
  p->commit_actions_interval = INTEGER(sexp_commit_actions_interval)[0];
  p->start_state = INTEGER(sexp_start_state)[0];
  p->dont_use_greediness_for_disambiguation = INTEGER(sexp_nogreedy)[0];
  p->dont_use_height_for_disambiguation = INTEGER(sexp_noheight)[0];
  set_d_file_name((char*)CHAR(STRING_ELT(sexp_fileName,0)));
  buf = sbuf_read(CHAR(STRING_ELT(sexp_fileName,0)));
  set_d_verbose_level(1);
  set_d_use_file_name(INTEGER(sexp_use_filename)[0]);
  pn = dparse(p, buf, strlen(buf));
  free(buf);
  if (!pn) {
    if (get_d_use_file_name())
      Rprintf("fatal error, '%s' line %d\n", CHAR(STRING_ELT(sexp_fileName,0)), p->loc.line);
    else
      Rprintf("fatal error, '' line %d\n", p->loc.line);
  }
  set_d_verbose_level(0);
  set_d_use_file_name(0);
  if (pn){
    free_D_ParseTreeBelow(p,pn);
    free_D_ParseNode(p,pn);
  }
  pn=0;
  if (p != NULL){
    free_D_Parser(p);
  }
  p = NULL;
  return R_NilValue;
  //exit(0);
}

