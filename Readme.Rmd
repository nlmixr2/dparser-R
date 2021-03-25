[![R-CMD-check](https://github.com/nlmixrdevelopment/dparser-R/workflows/R-CMD-check/badge.svg)](https://github.com/nlmixrdevelopment/dparser-R/actions)
[![Codecov test coverage](https://codecov.io/gh/nlmixrdevelopment/dparser-R/branch/master/graph/badge.svg)](https://codecov.io/gh/nlmixrdevelopment/dparser-R?branch=master)
[![CRAN version](http://www.r-pkg.org/badges/version/dparser)](https://cran.r-project.org/package=dparser)
[![CRAN checks](https://cranchecks.info/badges/summary/dparser)](https://cran.r-project.org/web/checks/check_results_dparser.html)

The R version of dparser is meant to be used as a package library
where you link the C parser to an arbitrary grammer parsed in R.  This
is what is used in `RxODE()`

### Differences between the R dparser port and the C-version of dparser

There are a few differences between the R dparser port and the standard dparser:
- The R version uses R memory managment instead of C's memory managment i.e. `malloc`
- The R version is never called from the command line, so all command line interface is removed `arg.c`
- The R version doesn't exit from the command (killing R), but errors out in R.
- All outputs are using R's output interface instead of printing to `stdout`, or `stderr`.
- Some convience functions are added to translate (and maybe parse) grammers within R.
- There is currently some fixes for un-sanitized behaviors that are not in the upstream dparser
- Currently there isn't an interface to use binary grammars
