## Downstream smoke test for nlmixr2/dparser-R#33.
##
## rxode2's C common-subexpression pass (rxCse) calls dparse() once per
## statement from inside an OpenMP region.  With dparser 1.3.1-13 that crashed
## in reduce_one() on R-hub's clang-asan/clang-ubsan containers (seen first in
## babelmixr2's checks).  .github/workflows/rhub.yaml runs this after R CMD
## check, with this checkout's dparser and rxode2 from GitHub installed, so the
## crash shows up here instead of downstream.  Modeled on rxode2's
## "the C pass is independent of the thread count" test.
library(rxode2)
cat("dparser", format(packageVersion("dparser")),
    "rxode2", format(packageVersion("rxode2")), "\n")

.m <- paste(c(
  "a <- exp(p1 + p2)",
  "b <- exp(p1 + p2) + exp(p3 + p4)",
  "d/dt(x) <- -exp(p1 + p2)*x + exp(p3 + p4)*a",
  "d/dt(y) <- exp(p3 + p4)*x - exp(p1 + p2)*y",
  "cp <- x/a + y/b"
), collapse = "\n")
.v <- c("p1", "p2", "p3")
.env <- rxS(.m)
.txt <- paste(c(.m, rxode2:::.rxJacobian(.env), rxode2:::.rxSens(.env, .v),
                rxode2:::.rxSens(.env, .v, .v)), collapse = "\n")
.norm <- rxNorm(.txt)
cat("statements:", length(strsplit(.norm, "\n", fixed = TRUE)[[1]]), "\n")

.res <- vapply(rep(c(1L, 2L, 4L, 8L), 5L), function(n) {
  setRxThreads(n)
  .o <- rxode2:::.rxOptExprC(.norm)
  if (is.na(.o)) NA_character_ else .o
}, character(1))
if (anyNA(.res)) stop("rxode2's C CSE pass declined the model")
if (length(unique(.res)) != 1L) stop("rxode2's C CSE pass depends on the thread count")
cat("rxode2 parallel CSE: OK\n")
