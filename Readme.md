
<!-- badges: start -->

[![R-CMD-check](https://github.com/nlmixr2/dparser-R/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/nlmixr2/dparser-R/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/nlmixr2/dparser-R/branch/main/graph/badge.svg)](https://app.codecov.io/gh/nlmixr2/dparser-R?branch=main)
[![CRAN
version](http://www.r-pkg.org/badges/version/dparser)](https://cran.r-project.org/package=dparser)
[![cran
checks](https://badges.cranchecks.info/summary/dparser.svg)](https://cran.r-project.org/web/checks/check_results_dparser.html)
![r-universe](https://nlmixr2.r-universe.dev/badges/dparser)
<!-- badges: end -->

The R version of dparser is meant to be used as a package library where
you link the C parser to an arbitrary grammer parsed in R. This is what
is used in `rxode2()`

### Differences between the R dparser port and the C-version of dparser

There are a few differences between the R dparser port and the standard
dparser:

- The R version uses R memory managment instead of C’s memory managment
  i.e. `malloc`

- The R version is never called from the command line, so all command
  line interface is removed `arg.c`

- The R version doesn’t exit from the command (killing R), but errors
  out in R.

- All outputs are using R’s output interface instead of printing to
  `stdout`, or `stderr`.

- Some convience functions are added to translate (and maybe parse)
  grammers within R.

- There is currently some fixes for un-sanitized behaviors that are not
  in the upstream dparser

- Currently there isn’t an interface to use binary grammars
