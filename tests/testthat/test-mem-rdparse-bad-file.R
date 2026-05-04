test_that("dparse_<gram> raises a clean error for a missing input file", {
  # Before the fix in src/rdparse.c:dparse_sexp, a non-existent file path
  # caused sbuf_read() to return NULL, after which strlen(__buf) was a
  # NULL deref:
  #
  #   __buf = sbuf_read(d_file_name);          // NULL on file failure
  #   __pn  = dparse(__curP, __buf, strlen(__buf));   // SIGSEGV in strlen
  #
  # gdb on the unfixed build:
  #   #0  __strlen_avx2 () at strlen-avx2.S:76
  #   #1  dparse_sexp (...) at rdparse.c:161
  #   #2  dparse_<gram> (...) at <generated>
  #
  # After the fix, dparse_sexp uses buf_read() to get an explicit length,
  # checks for NULL/failure, and forwards the buffer + length to udparse()
  # (which avoids the size_t->int cast that strlen() would have introduced
  # for files >= 2 GiB).  Failure path now raises:
  #   Error: could not read grammar input file: '<path>'
  #
  # The dparse() R wrapper goes through dpGetFile() which always either
  # uses an existing user file or writes a tempfile, so the bug is not
  # reachable through normal dparse() use — but TOCTOU (file deleted
  # between check and .Call) and any direct .Call from a downstream
  # consumer still triggered it.  Test bypasses dpGetFile by looking up
  # the registered native symbol directly via getNativeSymbolInfo (the
  # closure-body extraction the earlier draft used breaks under covr,
  # which rewrites the body for line-coverage tracking).

  suppressMessages(suppressWarnings({
    f <- dparse(system.file("tran.g", package = "dparser"), children_first=FALSE)
  }))
  gram <- gsub("([^A-Za-z0-9]|[-])", "_", basename(f@env$grammar))
  pkg <- sprintf("%s_%s", gram, .Platform$r_arch)
  sym <- getNativeSymbolInfo(sprintf("dparse_%s", gram), PACKAGE = pkg)
  expect_error(
    .Call(sym,
          "/dparser-r-audit-nonexistent-XYZ-12345-ABCDE",
          0L, 1L, 0L, 1L, 100L, 0L, 0L, 0L, 0L, 1L, 1024L, 0L, 0L,
          function(name, value, pos, depth) {},
          function(name, value, pos, depth) FALSE,
          globalenv()),
    regexp = "could not read grammar input file"
  )
})

test_that("dparse_<gram> still parses a real file after the fix", {
  # Regression check: the buf_read + udparse switch in rdparse.c must not
  # break the normal happy path that all other tests already exercise.
  expect_no_error({
    suppressMessages(suppressWarnings({
      f <- dparse(system.file("tran.g", package = "dparser"), children_first=FALSE)
    }))
    out <- f({d/dt(X) = a*X},
             function(name, value, pos, depth) {})
  })
})
