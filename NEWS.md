# dparser 1.3.2

## Known issues / API caveats (audited, no behavior change)

A May 2026 audit of the public C API and the surrounding scanner /
table-handling code identified a number of items that are theoretical
in current use but worth flagging for future work or for downstream
consumers that exercise unusual code paths:

- `int d_get_number_of_children(D_ParseNode*)` returns `int` for an
  underlying `uint` field (`pn->children.n`).  Trees with more than
  `INT_MAX` siblings would wrap negative; not reachable in practice
  given memory limits.  A future `d_get_number_of_children_u`
  returning `unsigned int` would address it cleanly.
- `D_ParseNode *d_get_child(D_ParseNode*, int child)` takes a signed
  index but is bounds-checked (`child < 0 || (uint)child >= n`), so
  the signedness is cosmetic.
- `new_D_Parser(struct D_ParserTables*, int sizeof_ParseNode_User)`
  takes a signed size.  The negative-input crash is fixed in this
  release; promoting to `unsigned int` is an ABI change deferred for
  a separate API expansion (analogous to the
  `udparse`/`dparse` pair).
- `read_binary_tables_*` does not bounds-check the `int` count fields
  in `BinaryTablesHead` (`n_relocs`, `n_strings`, `tables_size`,
  `strings_size`) before allocation or iteration.  In normal use the
  binary-tables file is produced by `mkdparser` itself, so the input
  is trusted; if a consumer ever ingests third-party `.bin` tables,
  these fields must be validated first.
- `util.c:stack_push_internal`, `util.c:escape_string_internal`, and
  `write_tables.c:make_room_in_buf` all double-and-multiply size
  variables (`int n`, `strlen(s)+1`, `buf->len * 2 + 1`) without
  overflow checks.  Each requires near-`INT_MAX` / near-`SIZE_MAX`
  inputs to misbehave, which is unreachable on any real machine.
- `rdparse.c:rc_dup_str` and `util.c:dup_str` compute
  `int l = e - s;` (`ptrdiff_t -> int`).  Strings >2 GiB only;
  matches the same theoretical limit as `buf_read`.
- `dparser.c:R_RegisterCCallable("dparser","d_ws_after  ", ...)` and
  `"d_ws_before "` carry trailing spaces in the registered name.
  The matching `dparser.h` consumer strings have the same trailing
  spaces, so dispatch works by exact-match — but the names should
  be normalized in `build/refresh.R` next time that generator is
  touched.
- `d_get_child(NULL, ...)` and `d_get_number_of_children(NULL)`
  dereference NULL.  This is consistent with the rest of the C
  dparser API ("caller passes valid nodes"); not a contract bug.
- The `dparse(D_Parser*, char*, int)` legacy ABI now hardens negative
  `buf_len` to `NULL` (added in this same release).  The behaviour
  for negative inputs was previously undefined pointer arithmetic, so
  the type signature is preserved but the runtime semantics are
  strictly safer.

- Add `udparse(D_Parser*, char *buf, unsigned int buf_len)` as a
  memory-safe alternative to `dparse(D_Parser*, char *buf, int buf_len)`.
  Existing callers of `dparse` still compile and link unchanged; the
  ABI of `dparse` is preserved.  Internally, `dparse` now rejects
  negative `buf_len` (returns `NULL`) and forwards positive values to
  `udparse`, which holds the actual parser implementation.

  Previously, callers had to cast `strlen(buf)` to `int`, which
  silently truncated to a wrong (often negative) value when the input
  exceeded `INT_MAX` bytes; that negative length then propagated into
  `p->end = buf + buf_len`, making the parser read random memory before
  the buffer.

  New code should call `udparse(p, buf, (unsigned int)strlen(buf))` to
  avoid the cast and safely accept inputs up to `UINT_MAX` bytes.  Both
  functions are exported and registered via `R_RegisterCCallable` and
  re-declared in the consumer headers (`src/dparse.h`, `src/dparser.h`,
  `src/dparser2.h`, `src/dparserPtr.h`).

# dparser 1.3.1-13

- Changed `Makevars` header order, strict options so that `dparser`
  will compile on older versions of R (#19, #20, #22)

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
