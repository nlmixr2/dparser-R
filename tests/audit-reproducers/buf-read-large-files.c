/*
 * Reproducer for src/util.c:buf_read() bugs (Branch 3):
 *
 *   3a. `*len = sb.st_size` narrowed off_t (typically 64-bit) to int.
 *       Files in (INT_MAX, UINT_MAX] silently produced negative *len, then
 *       `MALLOC(*len + 2)` was a near-SIZE_MAX request (often refused on
 *       Linux without overcommit) and `read(fd, *buf, *len)` had undefined
 *       behaviour for negative size.
 *
 *   3b. `size_t real_size = read(fd, *buf, *len)` stored read()'s ssize_t
 *       return into a size_t.  On read() failure, -1 became SIZE_MAX, then
 *       `(*buf)[real_size] = 0` wrote at offset SIZE_MAX — heap corruption
 *       or SIGSEGV.
 *
 *   Cosmetic: `if (fd <= 0) return -1` should be `if (fd < 0)`.
 *       fd 0 is a legitimate descriptor (stdin slot, returned by open()
 *       when stdin has been closed).  Unlikely to bite anyone, but wrong.
 *
 * BEFORE FIX: 3GB sparse file -> negative *len -> bogus state.
 * AFTER FIX: buf_read returns -1 cleanly; *buf = NULL; *len = 0.
 *
 * Build (run from package root, after src/dparser.so has been built):
 *   gcc -g -O0 -o tests/audit-reproducers/buf-read-large-repro \
 *       tests/audit-reproducers/buf-read-large-files.c \
 *       -ldl -Wl,-rpath,/usr/lib/R/lib -L/usr/lib/R/lib -lR
 *
 * Run:
 *   ./tests/audit-reproducers/buf-read-large-repro
 *
 * Expected output AFTER fix:
 *   Created 3 GiB sparse file at /tmp/dparser-audit-buf-read-XXXXXX
 *   buf_read returned -1 (correctly rejected)  *len = 0  *buf = (nil)
 *
 * BEFORE the fix, *len would be sb.st_size cast to int (a small or
 * negative value depending on how the truncation lands), and the
 * subsequent allocation/read/index sequence would either crash or silently
 * succeed with garbage.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <dlfcn.h>

int main(void) {
  void *h = dlopen("./src/dparser.so", RTLD_LAZY);
  if (!h) { fprintf(stderr, "dlopen: %s\n", dlerror()); return 2; }
  int (*buf_read_fn)(const char *, char **, int *) = dlsym(h, "buf_read");
  if (!buf_read_fn) { fprintf(stderr, "dlsym: %s\n", dlerror()); return 2; }

  char path[] = "/tmp/dparser-audit-buf-read-XXXXXX";
  int fd = mkstemp(path);
  if (fd < 0) { perror("mkstemp"); return 2; }
  /* Sparse 3 GiB file via ftruncate — no actual disk space used. */
  off_t target = (off_t)3 * 1024 * 1024 * 1024;
  if (ftruncate(fd, target) != 0) { perror("ftruncate"); close(fd); unlink(path); return 2; }
  close(fd);
  fprintf(stderr, "Created %.1f GiB sparse file at %s\n",
          (double)target / (1024.0 * 1024.0 * 1024.0), path);

  char *buf = (char *)0xDEADBEEF;
  int len = 0xDEAD;
  int rc = buf_read_fn(path, &buf, &len);
  fprintf(stderr,
          "buf_read returned %d %s  *len = %d  *buf = %p\n",
          rc,
          (rc < 0 ? "(correctly rejected)" : "(WRONG: should have rejected)"),
          len, (void *)buf);

  unlink(path);
  if (buf && rc >= 0) free(buf);
  dlclose(h);
  return rc < 0 ? 0 : 1;
}
