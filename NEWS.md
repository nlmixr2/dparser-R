# dparser 1.3.1-10

- added `dparser2.h` that declares functions instead of defines them.

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
