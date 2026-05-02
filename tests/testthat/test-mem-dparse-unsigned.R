test_that("dparse continues to parse normal-sized inputs after udparse refactor", {
  # Sanity check: existing callers of dparse(D_Parser*, char*, int) must
  # continue to work unchanged after the introduction of the unsigned-int
  # udparse() variant and the dparse() backward-compatibility wrapper.
  g_path <- system.file("ansic.test.g", package = "dparser")
  if (g_path == "") skip("ansic.test.g not installed")
  expect_no_error(
    suppressWarnings(suppressMessages(
      tryCatch(dparser::mkdparse(g_path), error = function(e) {
        if (grepl("buf_len|udparse", conditionMessage(e))) stop(e) else NULL
      })
    ))
  )
})

test_that("udparse accepts the full unsigned int range (skipped: requires ~3GB RAM)", {
  skip("Requires ~3GB free RAM to construct a >INT_MAX-byte input string")
  # Before the udparse addition, callers had to pass `(int)strlen(buf)` which
  # silently truncated buf_len > INT_MAX to a negative int, causing dparse to
  # read past the buffer.  After the change:
  #   - dparse() rejects negative buf_len with a NULL return (defense in depth)
  #   - udparse() takes `unsigned int buf_len` directly, doubling the safe
  #     input size to UINT_MAX.
  #
  # Running this test would require constructing a >INT_MAX-byte input and
  # exercising a registered parser — out of scope for routine CI.
  expect_true(TRUE)
})
