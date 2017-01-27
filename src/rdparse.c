#include "gramgram.h"
#include "d.h"
#include "mkdparse.h"
#include "dparse.h"
#include <R.h>
#include <Rinternals.h>
#include <R_ext/Rdynload.h>
#include <Rmath.h>

extern int d_use_file_name;
extern char *d_file_name;
extern int d_use_r_headers;
extern int d_rdebug_grammar_level;
extern int d_verbose_level;

char * rc_dup_str(const char *s, const char *e) {
  int l = e ? e-s : strlen(s);
  char *ss = Calloc(l+1,char);
  memcpy(ss, s, l);
  ss[l] = 0;
  return ss;
}

void callparsefn(char *name, char *value, int pos, int depth, SEXP fn, SEXP env){
  /*
     Need to construct a call to
     fn(name = name, value = value, pos = pos, depth = depth)
  */
  SEXP s, t;
  t = s = PROTECT(allocList(5));
  SET_TYPEOF(s, LANGSXP);
  SETCAR(t, fn); t = CDR(t);
  // name = name
  SETCAR(t, mkString(name)); 
  SET_TAG(t, install("name")); t = CDR(t);
  // value = value
  SETCAR(t, mkString(value));
  SET_TAG(t, install("value")); t = CDR(t);
  // pos = pos
  SETCAR(t, ScalarInteger(pos));  
  SET_TAG(t, install("pos")); t = CDR(t);
  // depth=depth
  SETCAR(t, ScalarInteger(depth));
  SET_TAG(t, install("depth")); t = CDR(t);
  eval(s, env);
  UNPROTECT(1);
}

int callskipchildrenfn(char *name, char *value, int pos, int depth, SEXP skip_fn, SEXP env){
  /*
    Need to construct a call to
    skip_fn(name = name, value = value, pos = pos, depth = depth)
  */
  SEXP s, t;
  int ret;
  t = s = PROTECT(allocList(5));
  SET_TYPEOF(s, LANGSXP);
  SETCAR(t, skip_fn); t = CDR(t);
  // name = name
  SETCAR(t, mkString(name)); 
  SET_TAG(t, install("name")); t = CDR(t);
  // value = value
  SETCAR(t, mkString(value));
  SET_TAG(t, install("value")); t = CDR(t);
  // pos = pos
  SETCAR(t, ScalarInteger(pos));  
  SET_TAG(t, install("pos")); t = CDR(t);
  // depth=depth
  SETCAR(t, ScalarInteger(depth));
  SET_TAG(t, install("depth")); t = CDR(t);
  ret=INTEGER(eval(s, env))[0];
  UNPROTECT(1);
  return ret;
}

void parsetree(D_ParserTables pt, D_ParseNode *pn, int depth, SEXP fn, SEXP skip_fn, SEXP env,
	       int children_first){
  char *name = (char*)pt.symbols[pn->symbol].name;
  int nch = d_get_number_of_children(pn), i, skipchild;
  char *value = (char*)rc_dup_str(pn->start_loc.s, pn->end);
  if (nch == 0){
    callparsefn(name, value, -1, depth, fn, env);
  } else {
    callparsefn(name, value, -2, depth, fn, env);
  }
  if (nch != 0){
    for (i = 0; i < nch; i++) {
      D_ParseNode *xpn = d_get_child(pn,i);
      char *v = (char*)rc_dup_str(xpn->start_loc.s, xpn->end);
      skipchild = callskipchildrenfn(name, v, i, depth, skip_fn, env);
      if (children_first && !skipchild){
	parsetree(pt, xpn, depth+1, fn, skip_fn, env, children_first);
      }
      if (!skipchild){
	callparsefn(name, v, i, depth, fn, env);
      }
      if (!children_first && !skipchild){
        parsetree(pt, xpn, depth+1, fn, skip_fn, env, children_first);
      }
      Free(v);
    }
  }
  Free(value);
}

SEXP dparse_sexp(SEXP sexp_fileName,
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
		 SEXP sexp_children_first,
		 SEXP fn,
		 SEXP skip_fn,
		 SEXP env,
		 D_ParserTables pt){
  char *buf = NULL;
  D_Parser *p;
  D_ParseNode *pn = NULL;
  int children_first;
  p = new_D_Parser(&pt, INTEGER(sexp_sizeof_parse_node)[0]);
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
  d_file_name = (char*)CHAR(STRING_ELT(sexp_fileName,0));
  buf = sbuf_read(d_file_name);
  d_verbose_level = INTEGER(sexp_verbose)[0];
  d_use_file_name = INTEGER(sexp_use_filename)[0];
  children_first = INTEGER(sexp_children_first)[0];
  pn = dparse(p, buf, strlen(buf));
  d_verbose_level = 0;
  if (pn && !p->syntax_errors) {
    parsetree(pt, pn, 0, fn, skip_fn, env, children_first);
  } else {
    if (!p->syntax_errors){
      if (d_use_file_name){
        d_use_file_name = 0;    
        error("fatal error, '%s' line %d", CHAR(STRING_ELT(sexp_fileName,0)), p->loc.line);
      }
      else{
	error("fatal error, '' line %d", p->loc.line);
      }
    } else {
      if (d_use_file_name){
        d_use_file_name = 0;
        error("syntax errors in '%s'.",CHAR(STRING_ELT(sexp_fileName,0)));
      }
      else{
        error("syntax errors.");
      }
    }
  }
  return R_NilValue;
}
