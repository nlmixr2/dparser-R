# Changelog

## dparser 1.3.2

- Add `udparse(D_Parser*, char *buf, unsigned int buf_len)` as a
  memory-safe alternative to
  `dparse(D_Parser*, char *buf, int buf_len)`. Existing callers of
  `dparse` still compile and link unchanged; the ABI of `dparse` is
  preserved. Internally, `dparse` now rejects negative `buf_len`
  (returns `NULL`) and forwards positive values to `udparse`, which
  holds the actual parser implementation.

  Previously, callers had to cast `strlen(buf)` to `int`, which silently
  truncated to a wrong (often negative) value when the input exceeded
  `INT_MAX` bytes; that negative length then propagated into
  `p->end = buf + buf_len`, making the parser read random memory before
  the buffer.

  New code should call `udparse(p, buf, (unsigned int)strlen(buf))` to
  avoid the cast and safely accept inputs up to `UINT_MAX` bytes. Both
  functions are exported and registered via `R_RegisterCCallable` and
  re-declared in the consumer headers (`src/dparse.h`, `src/dparser.h`,
  `src/dparser2.h`, `src/dparserPtr.h`).

## dparser 1.3.1-13

CRAN release: 2024-10-22

- Changed `Makevars` header order, strict options so that `dparser` will
  compile on older versions of R
  ([\#19](https://github.com/nlmixr2/dparser-R/issues/19),
  [\#20](https://github.com/nlmixr2/dparser-R/issues/20),
  [\#22](https://github.com/nlmixr2/dparser-R/issues/22))

## dparser 1.3.1-12

CRAN release: 2024-09-17

- Changed language access to not use `SET_TYPEOF` (as required by CRAN)

- Changed compilation to use strict headers, as requested by CRAN.

- Changed interface so that functional changes will not cause
  segmentation faults when other libraries are not recompiled against
  this library (removed binary linkage). However changes to the dparser
  parsing C structures will likely cause a segmentation fault. Since the
  structures have not changed very much over time, but CRAN requests
  small changes to the functions frequently, this will probably be
  sufficient for most cases.

## dparser 1.3.1-11

CRAN release: 2023-12-07

- Changed `gram.c` to handle NULL strings without printing them (as
  requested by CRAN)

- Changed `util.c` to avoid security warnings for error/warnings in R
  (as requested by CRAN)

- Parsing errors during
  [`dparser()`](https://nlmixr2.github.io/dparser-R/reference/dparser-package.md)
  evaluation now give the line number for the error.

## dparser 1.3.1-10

CRAN release: 2023-03-16

- added `dparser2.h` that declares functions instead of defines them.

## dparser 1.3.1-9

CRAN release: 2022-11-10

- Initialized version string to zero length string to fix valgrind
  issues

- Change flags to suppress false positive memory leaks (might be lost
  errors)

## dparser 1.3.1-8

CRAN release: 2022-10-29

- Removed all `sprintf` as indicated by some new Mac M1 checks for
  `rxode2`.

## dparser 1.3.1-7

CRAN release: 2022-10-09

- Fixed one remaining strict typing issue, as requested by CRAN.

## dparser 1.3.1-6

CRAN release: 2022-10-05

- Updated dparser header to have strict typing, as requested by CRAN.

## dparser 1.3.1-4

CRAN release: 2021-04-07

- Updated dparser to explicitly include R headers in the generated
  grammars (when requested), which should fix the fedora problem

## dparser 1.3.1-3

CRAN release: 2021-04-06

- Updated R dparser to use
  [`system()`](https://rdrr.io/r/base/system.html) instead of
  `do.call("system",...)`
- Changed default compile to show the `stderr` and `stdout`

## dparser 1.3.1-2

CRAN release: 2021-04-03

- Updated R dparser to use the more recent version of dparser

- Applied custom changes to fix un-sanitized behavior

- Added a `NEWS.md` file to track changes to the package.
