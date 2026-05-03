test_that("d_pass rejects negative pass_number cleanly (no OOB read)", {
  # d_pass is registered as a C-callable for downstream consumers (rxode2
  # etc.) and is not reachable from any R-side code in this package, so
  # a true end-to-end regression test would require either (a) a tiny C
  # .Call wrapper added to the package solely for testing, or (b) an
  # external reproducer that links against src/dparser.so directly.
  #
  # We chose (b): see tests/audit-reproducers/d-pass-negative-pass-number.c
  # for a self-contained C program that calls
  #   d_pass(new_D_Parser(&tables, 0), NULL, -1)
  # with passes[] mmap-allocated on a fresh page (and the previous page
  # protected PROT_NONE so passes[-1] is a guaranteed segfault).
  #
  # gdb-confirmed crash location BEFORE the fix:
  #   #0  d_pass (... pass_number=-1) at parse.c:1855
  #         (`if (pp->kind & D_PASS_MANUAL)` — pp = &passes[-1])
  # AFTER the fix:
  #   d_pass returns through d_fail("bad pass number: -1") -> Rf_error.
  skip("manual reproducer; see tests/audit-reproducers/d-pass-negative-pass-number.c")
  expect_true(TRUE)
})
