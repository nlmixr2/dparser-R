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
