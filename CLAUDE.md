# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when
working with code in this repository.

## Overview

**dparser** is an R port of John Plevyak's DParser, a scannerless GLR
parser / parser generator (Tomita algorithm). It is mostly C (the
vendored DParser sources in `src/`) with a thin R layer in `R/`.

It is used in two ways:

- **From C (the main use)**: downstream packages (e.g. rxode2) put
  `LinkingTo: dparser` in DESCRIPTION,
  `#include <dparser.h>` (not `<dparse.h>`), and call DParser entry
  points that dparser exports with `R_RegisterCCallable()`. Breaking an
  exported C entry point or its signature breaks those packages.
- **From R**: `mkdparse()` (port of `make_dparser`) turns a `.g`
  grammar into C parser tables; `dparse()` compiles a grammar on the fly
  into a temporary DLL and parses a file with an R callback. This path
  is mainly for grammar testing.

Imports: `digest`, `methods`. Depends: R (>= 3.3). License: BSD_3_clause.

## Build and Development Commands

```sh
# Install
R CMD INSTALL .

# Document (roxygen2; NAMESPACE and man/ are generated)
Rscript -e "devtools::document()"

# Full test suite (most test files skip_on_cran(), so set NOT_CRAN)
find src -name "*.so" -o -name "*.o" | xargs rm -f 2>/dev/null; NOT_CRAN=true Rscript -e "devtools::test()"

# Single test file (filter = file name without "test-" and ".R")
NOT_CRAN=true Rscript -e "devtools::test(filter='concurrent-dparse')"

# R CMD check
Rscript -e "devtools::check()"
```

There are no vignettes. `Readme.Rmd` renders `Readme.md`.

## Architecture

### R layer (`R/`)

- `R/dparser.R` -- package doc, `.onLoad()` (sets options
  `dpaser.rm.named.parser.dll`, `dpaser.rm.unnamed.parser.dll`,
  `dparser.echo.compile`; note the historical `dpaser` spelling, keep
  it), and the exported functions:
  - `mkdparse()` -- grammar file -> C tables via `.Call(cDparser, ...)`
    (17 arguments).
  - `dparse()` -- writes C from the `dpRparse()` template, builds it
    with `R CMD SHLIB` in `tempdir()`, `dyn.load()`s it, caches by the
    grammar's `digest` md5, and returns a parser function
    (`dparserFunction` S4 class).
  - `dpIncludeDir()`, `dpGetFile()`, `dpDefaultSkip()`, `dpReload()`,
    `gc.dparser()` (unloads/removes generated DLLs), `.dparsePtr()`.
  - `refresh()` (internal) sources `build/refresh.R`.
- `R/Rparse.R` (`dpRparse()`) and `R/version.R` (`dpVersion()`) are
  written by `build/refresh.R`; `R/Rparse.R` embeds `build/Rparse.c` as
  a string. `dpVersion()` is currently stale relative to DESCRIPTION.

### C layer (`src/`)

- Vendored DParser sources: `parse.c`, `scan.c`, `lr.c`, `lex.c`,
  `gram.c`, `grammar.g.c`, `write_tables.c`, `read_binary.c`,
  `dsymtab.c`, `util.c`, `mkdparse.c`, `version.c` and their headers
  (`d.h`, `dparse.h`, `gram.h`, ...). They were imported from upstream
  by `build/refresh.R` (asserts rewritten to `error()`, `printf` ->
  `Rprintf`, C++ guards added) and have since been patched in place
  (see NEWS.md: `buf_read()`, `d_pass()`, `udparse()`, reentrant
  `reduce_one()`/`build_paths()`, typed hash callbacks).
- `src/dparser.c` -- `dparserPtr()` (returns the function pointer
  table) and `R_init_dparser()`: the `.Call` registration table
  (`_dparserPtr`, `cDparser`, with hardcoded arities) plus the long list
  of `R_RegisterCCallable("dparser", ...)` exports.
- `src/rdparse.c` -- `dparse_sexp()` (parses a file and walks the tree,
  calling the R callback `fn` / `skip_fn`) and `__freeP()`.
- `src/mkdparser.c` -- `cDparser()`, the `mkdparse()` backend.
- `src/dparser.h` -- the public header downstream packages include;
  declares the callables resolved via `R_GetCCallable()`.
- `src/dparserPtr.h` -- typedef'd function-pointer interface for the
  `.dparsePtr()` route.
- `src/install.libs.R` -- copies the shared library and also installs
  every `src/*.h` into the package `include/` directory (this is what
  `dpIncludeDir()` points to and what `LinkingTo` uses).
- `src/Makevars` -- `PKG_CFLAGS = -DUSE_FREELISTS -DTRACK_PNODES`.

### Adding or changing an exported C function

Keep these in sync: the implementation, its declaration in
`src/dparser.h` (and `src/dparserPtr.h` if it is part of the pointer
table), the `R_RegisterCCallable()` line in `R_init_dparser()`, and a
NEWS.md entry. Never change an existing exported signature (e.g.
`buf_read()` keeps its `int *len` ABI) -- downstream packages compiled
against the old header would break.

### Thread safety

`dparse()`/`udparse()` may be called from several threads, one
`D_Parser` per thread (rxode2 does this). Do not introduce
process-wide static or global mutable state in the parse path. The
`dparser.h` entry points must be resolved on the main thread; error
reporting and R callbacks call the R API, so they are main-thread only.

### `build/` (excluded from the tarball)

- `build/refresh.R` -- clones upstream DParser into `src/dparser/` and
  regenerates the vendored sources, `src/dparser.h`, `src/dparser.c`,
  `R/version.R`, `R/Rparse.R`, and copies upstream `.g` tests into
  `tests/testthat/`.
- **Do not run `refresh()` / `build/refresh.R` casually**: it overwrites
  the in-place fixes in the vendored C files and the hand-maintained
  `src/dparser.c` (e.g. `dparserPtr()`). Port fixes by hand instead.
- `build/Rparse.c` -- template for the C file `dparse()` compiles.

## Tests (`tests/testthat/`)

- `test-dparser.R` -- for every `*.test.g` grammar: `mkdparse()` it,
  compile with `sample_parser.c` via `R CMD SHLIB`, parse each
  `*.test.g.N` input and compare against `*.test.g.N.check`. Optional
  `*.flags` files set `mkdparse()` options. Whole file is
  `skip_on_cran()` and skipped on Solaris/macOS.
- `test-concurrent-dparse.R` + `helper-concurrent.R` +
  `concurrent_parser.c` -- builds a pthread test parser and checks
  concurrent parses against a serial run (rxode2#1427, #33).
  `skip_on_cran()` and `skip_on_os("windows")`.
- `test-arbitrary.R`, `test-envir.R`, `test-unlink.R` -- R-level
  `dparse()` behavior using `tran.g`, `ansic.test.g`, etc.
- `test-mem-*.R` -- regression notes for memory-safety fixes; they
  `skip()` and point to standalone C reproducers in
  `tests/audit-reproducers/` (excluded from the build).
- Several large `.g` test grammars are listed in `.Rbuildignore` to keep
  the tarball small; a new big fixture may need the same treatment.
- `tests/testthat.R` sets `R_TESTS=""` before `test_check()`.

## CI (`.github/workflows/`)

- `R-CMD-check.yaml` -- macOS, Windows, Ubuntu (devel, release,
  oldrel-1) on push/PR.
- `test-coverage.yaml` -- covr -> codecov.
- `pkgdown.yaml` -- site at https://nlmixr2.github.io/dparser-R/.
- `rhub.yaml` -- manual `rhub::rhub_check()` (e.g. `clang-asan`,
  `clang-ubsan`) with `NOT_CRAN=true` so the concurrency tests run;
  keep that dparser-specific change when updating the file.

## Code Style

- R: follow the existing style in `R/dparser.R`; roxygen comments use
  `##'`. Do not hand-edit `NAMESPACE` or `man/`; run
  `devtools::document()`. Shared roxygen text is in `man-roxygen/`.
- C: use `Rprintf`/`Rf_error`/`Rf_warning`, never `printf`,
  `exit()`, or `assert()` (CRAN). Bound-check user-supplied indices and
  sizes; recent fixes were all missing-bound / NULL / overflow bugs.
- ASCII only in new or edited text (R, C, roxygen, NEWS.md, this file):
  use `--`, `->`, straight quotes. CRAN requirement. (Older NEWS.md
  entries still contain some Unicode; do not add more.)
- NEWS.md: one `# dparser <version>` heading per version, bullets
  describing the fix and user-visible effect.

## Release / CRAN Cautions

- dparser sits under rxode2 and the rest of the nlmixr2 ecosystem;
  check reverse dependencies before release (`revdep/` is ignored).
- Release files: `cran-comments.md`, `CRAN-SUBMISSION` (both
  build-ignored). Bump `Version:` in DESCRIPTION.
- Keep tests that compile code or spawn threads behind `skip_on_cran()`.
- Do not commit compiled objects (`*.o`, `*.so`, `*.dll`) or the
  `src/dparser/` upstream clone.


## CRAN tests: never assert on timing

- Never put a wall-clock timing expectation in a test that can run on CRAN:
  no `expect_lt()`/`expect_true()` on `Sys.time()` differences,
  `system.time()`, `proc.time()`, `bench`/`microbenchmark` results, or any
  other elapsed-time threshold. CRAN check machines are shared and heavily
  loaded, so elapsed time there is random and a timing assertion fails at
  random. Example: nlmixr2plot `test-model-diagram.R` asserted a
  `modelGraph()` call took < 30 s; on CRAN it took 48.4 s and failed.
- Test the result, not the speed. If a speed regression guard is really
  needed, put it only in a test that starts with `skip_on_cran()` (or the
  package's own CRAN skip helper), and never in examples or vignettes.
- Tests that take more than a few seconds should also skip on CRAN.
