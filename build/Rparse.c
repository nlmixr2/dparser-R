/* Rparse.c --- Parse an arbitrary grammar in R.
 * 
 * Filename: Rparse.c
 * Description: Template for parsing an arbitrary grammar in R.
 * Author: Matthew L. Fidler
 * Maintainer: Matthew L. Fidler
 * Created: Mon Dec  5 14:37:45 2016 (-0600)
 * 
 * This is licensed under BSD 3-Clause License
 */

/* Code: */

#include <R.h>
#include <Rdefines.h>
#include <dparser.h>

<%=pasertables%>;

SEXP dparse_<%=gram%>_digest(){
  // return the digest of the grammar that was used.
  // Probably too much PROTECTion here.  I don't think that this allocates anything.
  SEXP ret = PROTECT(allocVector(STRSXP,1));
  SET_STRING_ELT(ret,0,mkChar("<%=digest%>"));
  UNPROTECT(1);
  return ret;
}
  
SEXP dparse_<%=gram%>(SEXP sexp_fileName,
                      SEXP sexp_start_state,
                      SEXP sexp_save_parse_tree,
                      SEXP sexp_partial_parses,
                      SEXP sexp_compare_stacks,
                      SEXP sexp_commit_actions_interval,
                      SEXP sexp_fixup,
                      SEXP sexp_fixup_ebnf,
                      SEXP sexp_nogreedy,
                      SEXP sexp_noheight,
                      SEXP sexp_use_filename,
		      SEXP sexp_sizeof_parse_node,
                      SEXP sexp_verbose,
                      SEXP fn,
                      SEXP env){
  dparse_sexp(sexp_fileName,
	      sexp_start_state,
	      sexp_save_parse_tree,
	      sexp_partial_parses,
	      sexp_compare_stacks,
	      sexp_commit_actions_interval,
	      sexp_fixup,
	      sexp_fixup_ebnf,
	      sexp_nogreedy,
	      sexp_noheight,
	      sexp_use_filename,
	      sexp_sizeof_parse_node,
	      sexp_verbose,
	      fn,
	      env,
	      parser_tables_<%=gram%>);
  return R_NilValue;
}
/* Rparse.c ends here */
