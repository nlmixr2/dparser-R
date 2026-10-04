/*
  Runs dparse() from several threads at once, one parser per thread, the way
  rxode2's rxOptExpr() does (nlmixr2/rxode2#1427).
*/
#include <R.h>
#include <Rinternals.h>
#include <pthread.h>
#include <string.h>
#include <dparser.h>

#define MAX_THREADS 64

extern D_ParserTables parser_tables_gram;

typedef struct { const char *txt; int reps; int bad; } cpJob;

static int cpParseOnce(const char *txt) {
  D_Parser *p = new_D_Parser(&parser_tables_gram, 100);
  D_ParseNode *pn;
  int ok;
  if (p == NULL) return 0;
  p->save_parse_tree = 1;
  p->error_recovery = 0;
  pn = dparse(p, (char *) txt, (int) strlen(txt));
  ok = pn != NULL && p->syntax_errors == 0;
  if (pn != NULL) free_D_ParseNode(p, pn);
  free_D_Parser(p);
  return ok;
}

static void *cpWorker(void *arg) {
  cpJob *j = (cpJob *) arg;
  int i;
  for (i = 0; i < j->reps; i++) {
    if (!cpParseOnce(j->txt)) j->bad++;
  }
  return NULL;
}

SEXP concurrent_dparse(SEXP txtS, SEXP nthrS, SEXP repsS) {
  const char *txt = CHAR(STRING_ELT(txtS, 0));
  int nthr = INTEGER(nthrS)[0], reps = INTEGER(repsS)[0], t, bad = 0;
  pthread_t th[MAX_THREADS];
  cpJob jobs[MAX_THREADS];
  if (nthr < 1 || nthr > MAX_THREADS) Rf_error("nthr must be in 1..%d", MAX_THREADS);
  /* serial parse first: also resolves dparser.h's R_GetCCallable() pointers on
     the main thread, which worker threads must not do */
  if (!cpParseOnce(txt)) Rf_error("serial parse failed");
  for (t = 0; t < nthr; t++) {
    jobs[t].txt = txt; jobs[t].reps = reps; jobs[t].bad = 0;
    if (pthread_create(&th[t], NULL, cpWorker, &jobs[t]) != 0) Rf_error("pthread_create failed");
  }
  for (t = 0; t < nthr; t++) {
    pthread_join(th[t], NULL);
    bad += jobs[t].bad;
  }
  return Rf_ScalarInteger(bad);
}
