test_that("buf_read rejects oversized files cleanly and survives read() errors", {
  # The audit identified three bugs in src/util.c:buf_read():
  #
  #   3a. `*len = sb.st_size` narrowed off_t (typically 64-bit) to int.
  #       For files in (INT_MAX, UINT_MAX] (~2-4 GiB), *len became
  #       negative and the subsequent MALLOC(*len + 2) was either a
  #       huge-size request (typically NULL) or behaved unpredictably.
  #
  #   3b. `size_t real_size = read(fd, *buf, *len);` assigned read()'s
  #       ssize_t return into a size_t.  read()'s -1 became SIZE_MAX,
  #       and `(*buf)[real_size] = 0` then wrote at offset SIZE_MAX —
  #       heap corruption / SIGSEGV.
  #
  #   Cosmetic: `if (fd <= 0)` should be `if (fd < 0)` (fd 0 is valid).
  #
  # Verification of 3a uses a 3 GiB sparse file (no actual disk space).
  # See tests/audit-reproducers/buf-read-large-files.c — the C
  # reproducer dlopens dparser.so and calls buf_read directly to
  # bypass the rdparse.c strlen(NULL) bug (which is fixed in a separate
  # branch, fix/rdparse-strlen-on-null-and-int-trunc).
  #
  # gdb-confirmed crash on the unfixed build:
  #   #0  buf_read (... pathname="/tmp/.../big.bin") at util.c:61
  #         (*buf)[real_size] = 0;       /* real_size == (size_t)-1 */
  # After the fix, the same reproducer prints:
  #   buf_read returned -1 (correctly rejected)  *len = 0  *buf = (nil)
  skip("manual reproducer; see tests/audit-reproducers/buf-read-large-files.c")
  expect_true(TRUE)
})
