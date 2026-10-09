/*
  Runs dparse() from several threads at once, one parser per thread, the way
  rxode2's rxOptExpr() does (nlmixr2/rxode2#1427).

  concurrent_dparse_stmts() is the pattern of rxode2's C common-subexpression
  pass, where #33 crashed: a worker pool takes statements off a shared queue
  and parses each one with a new D_Parser, without any rxode2 code.
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
    if (pthread_create(&th[t], NULL, cpWorker, &jobs[t]) != 0) {
      int u;
      /* jobs[] lives on this stack, which Rf_error() unwinds */
      for (u = 0; u < t; u++) pthread_join(th[u], NULL);
      Rf_error("pthread_create failed");
    }
  }
  for (t = 0; t < nthr; t++) {
    pthread_join(th[t], NULL);
    bad += jobs[t].bad;
  }
  return Rf_ScalarInteger(bad);
}

/* order-sensitive fingerprint of a parse tree: symbols, spans and shape */
static unsigned int cpTreeHash(D_ParseNode *pn, const char *buf) {
  unsigned int h = 2166136261u;
  int i, n = d_get_number_of_children(pn);
  h = (h ^ (unsigned int) pn->symbol) * 16777619u;
  h = (h ^ (unsigned int) (pn->start_loc.s - buf)) * 16777619u;
  h = (h ^ (unsigned int) (pn->end - buf)) * 16777619u;
  h = (h ^ (unsigned int) n) * 16777619u;
  for (i = 0; i < n; i++) h = (h ^ cpTreeHash(d_get_child(pn, i), buf)) * 16777619u;
  return h;
}

/* NA_INTEGER for a failed parse, else the tree hash (kept off NA) */
static int cpParseHash(const char *txt) {
  D_Parser *p = new_D_Parser(&parser_tables_gram, 100);
  D_ParseNode *pn;
  int ret = NA_INTEGER;
  if (p == NULL) return ret;
  p->save_parse_tree = 1;
  p->error_recovery = 0;
  pn = dparse(p, (char *) txt, (int) strlen(txt));
  if (pn != NULL && p->syntax_errors == 0) {
    ret = (int) (cpTreeHash(pn, txt) & 0x7fffffffu);
  }
  if (pn != NULL) free_D_ParseNode(p, pn);
  free_D_Parser(p);
  return ret;
}

typedef struct {
  const char **stmts; int *out; int n; int next; pthread_mutex_t lock;
} cpQueue;

static void *cpStmtWorker(void *arg) {
  cpQueue *q = (cpQueue *) arg;
  for (;;) {
    int i;
    pthread_mutex_lock(&q->lock);
    i = q->next++;
    pthread_mutex_unlock(&q->lock);
    if (i >= q->n) break;
    q->out[i] = cpParseHash(q->stmts[i]);
  }
  return NULL;
}

SEXP concurrent_dparse_stmts(SEXP stmtsS, SEXP nthrS) {
  int n = Rf_length(stmtsS), nthr = INTEGER(nthrS)[0], i, t;
  pthread_t th[MAX_THREADS];
  cpQueue q;
  SEXP ans;
  if (nthr < 1 || nthr > MAX_THREADS) Rf_error("nthr must be in 1..%d", MAX_THREADS);
  if (n < 1) Rf_error("need at least one statement");
  ans = PROTECT(Rf_allocVector(INTSXP, n));
  q.stmts = (const char **) R_alloc(n, sizeof(const char *));
  for (i = 0; i < n; i++) q.stmts[i] = CHAR(STRING_ELT(stmtsS, i));
  q.out = INTEGER(ans);
  q.n = n;
  /* first statement on the main thread resolves dparser.h's R_GetCCallable()
     pointers (including the tree walkers), which workers must not do */
  q.out[0] = cpParseHash(q.stmts[0]);
  if (nthr == 1) {
    /* the serial reference stays on the main thread, where a syntax error
       may safely reach the R API */
    for (i = 1; i < n; i++) q.out[i] = cpParseHash(q.stmts[i]);
    UNPROTECT(1);
    return ans;
  }
  q.next = 1;
  pthread_mutex_init(&q.lock, NULL);
  for (t = 0; t < nthr; t++) {
    if (pthread_create(&th[t], NULL, cpStmtWorker, &q) != 0) {
      int u;
      /* q lives on this stack, which Rf_error() unwinds */
      for (u = 0; u < t; u++) pthread_join(th[u], NULL);
      pthread_mutex_destroy(&q.lock);
      Rf_error("pthread_create failed");
    }
  }
  for (t = 0; t < nthr; t++) pthread_join(th[t], NULL);
  pthread_mutex_destroy(&q.lock);
  UNPROTECT(1);
  return ans;
}
