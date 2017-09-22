## Test environments
* local Windows install, R 3.3.3
* ubuntu 12.04 (on travis-ci), R 3.3.3 and R 3.2.4, R devel
* Mac OS X 10.11.6 (El Capitan) (on travis-ci), R 3.2.4 
* Appveyor  Windows install (64 bit 32 bit release, old release and stable)
* R winbuilder (release, development, and oldrel)

## Previous comments


This passes checking ok now, but pls make the Description more complete:
write out GLR, add a reference for Tomita algorithm, ideally using a
DOI: write

   Authors (year) <DOI:.....>

(with no space after 'DOI:').

Finally, the title mentions a 'Dparser' package (should be in single
quotes), so pls explain that in the Description too, ideally giving a
URL for it written as <http....>, e.g.

  the 'Dparser' package ........ (see <http...> for more information)


Updated, as requested

## Older comments

You mis-use file LICENSE: for BSD_3_clause this should only be the
completed template, see
<https://www.r-project.org/Licenses/BSD_3_clause>.

FIXED

Re compilation warnings, with GCC 6 I get

* checking whether package dparser can be installed ... [10s/10s] WARNING
Found the following significant warnings:
  read_binary.c:44:12: warning: pointer of type void * used in arithmetic [-Wpointer-arith]
  read_binary.c:50:34: warning: pointer of type void * used in arithmetic [-Wpointer-arith]

FIXED

Otoh, I get

* checking tests ... [5s/5s] ERROR
  Running testthat.R
Running the tests in tests/testthat.R failed.
Last 13 lines of output:
  x[1]: "g10.test.g.1:1: syntax error after 'c'"
  y[1]: "5 states 3 scans 3 shifts 1 reductions 0 compares 0 ambiguities"

  x[2]: "fatal error, 'g10.test.g.1' line 1"
  y[2]: "( a  b  c )"


  testthat results ================================================================
  OK: 590 SKIPPED: 0 FAILED: 1
  1. Failure: g10.test.g: g10.test.g.1 (@test-dparser.R#96)

  Error: testthat unit tests failed
  In addition: Warning message:
  In body(fun) : argument is not a function
  Execution halted
  
FIXED


* checking foreign function calls ... NOTE
…

Registration problem:
   symbol 'sym' in the local frame:
    .Call(sym, PACKAGE = pkg)
See chapter 'System and foreign language interfaces' in the 'Writing R
Extensions' manual.

NOTE
Registration problem:
  symbol 'sym' in the local frame:
   .Call(sym, PACKAGE = pkg)
   
FIXED
function within a blockquote.

* checking foreign function calls 

No foreign function calls.

* This is a new release.

## Reverse dependencies

This is a new release, so there are no reverse dependencies.

* All maintainers were notified of the CRAN submission.
