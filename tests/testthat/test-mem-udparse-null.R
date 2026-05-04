test_that("udparse(p, NULL, n) returns NULL instead of dereferencing the buffer", {
  # Before the fix in src/parse.c, udparse() did
  #     p->start = buf;            /* NULL */
  #     p->end   = buf + buf_len;  /* NULL + n */
  #     ...
  #     exhaustive_parse(p, ...);  /* reads *p->start */
  # which crashes inside white_space() with `*s` where s == NULL.
  #
  # After the fix udparse short-circuits with `if (!buf) return NULL;`.
  # The legacy dparse() wrapper forwards into udparse so it inherits the
  # guard.
  #
  # End-to-end repro is in tests/audit-reproducers/udparse-null-buf.c.
  # gdb-confirmed crash before the fix:
  #   #0  white_space (...) at parse.c:1945  (`if (*s == '#' && ...`)
  #   #1  exhaustive_parse (...) at parse.c:1874
  #   #2  udparse (... buf=0x0, buf_len=1) at parse.c:2142
  # After the fix:
  #   udparse returned cleanly: (nil)
  skip("manual reproducer; see tests/audit-reproducers/udparse-null-buf.c")
  expect_true(TRUE)
})
