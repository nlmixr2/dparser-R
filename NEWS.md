# dparser 1.3.1-12

- Changed language access to not use `SET_TYPEOF` (as required by CRAN)

- Changed compilation to use strict headers, as requested by CRAN.

- Changed interface so that functional changes will not cause
  segmentation faults when other libraries are not recompiled against
  this library (removed binary linkage).  However changes to the
  dparser parsing C structures will likely cause a segmentation fault.
  Since the structures have not changed very much over time, but CRAN
  requests small changes to the functions frequently, this will
  probably be sufficient for most cases.


# dparser 1.3.1-11

- Changed `gram.c` to handle NULL strings without printing them (as requested by CRAN)

- Changed `util.c` to avoid security warnings for error/warnings in R (as requested by CRAN)

- Parsing errors during `dparser()` evaluation now give the line number for the error.

# dparser 1.3.1-10

* added `dparser2.h` that declares functions instead of defines them.

# dparser 1.3.1-9

* Initialized version string to zero length string to fix valgrind issues

* Change flags to suppress false positive memory leaks (might be lost errors)

# dparser 1.3.1-8

* Removed all `sprintf` as indicated by some new Mac M1 checks for `rxode2`.

# dparser 1.3.1-7

* Fixed one remaining strict typing issue, as requested by CRAN.

# dparser 1.3.1-6

* Updated dparser header to have strict typing, as requested by CRAN.

# dparser 1.3.1-4

* Updated dparser to explicitly include R headers in the generated
  grammars (when requested), which should fix the fedora problem

# dparser 1.3.1-3

* Updated R dparser to use `system()` instead of `do.call("system",...)`
* Changed default compile to show the `stderr` and `stdout`

# dparser 1.3.1-2

* Updated R dparser to use the more recent version of dparser

* Applied custom changes to fix un-sanitized behavior

* Added a `NEWS.md` file to track changes to the package.
