test_that("dparse() is safe to run from several threads at once (rxode2#1427)", {
  skip_on_cran()
  skip_on_os("windows")
  wd <- tempfile("dparser-concurrent")
  dir.create(wd)
  on.exit(unlink(wd, recursive = TRUE), add = TRUE)
  file.copy(test_path("concurrent_parser.c"), wd)
  # long right-hand sides make each reduction grow the shared first path
  writeLines(c(
    "statements: statement*;",
    "statement: identifier '=' expr ';';",
    "expr: expr '+' expr $left 1",
    "  | expr '*' expr $left 2",
    "  | identifier '(' expr ',' expr ',' expr ')'",
    "  | '(' expr ')'",
    "  | identifier",
    "  | number;",
    "identifier: \"[a-zA-Z_][a-zA-Z0-9_]*\";",
    "number: \"[0-9]+\";"
  ), file.path(wd, "concurrent.g"))
  mkdparse(file.path(wd, "concurrent.g"), wd, use_r_header = TRUE, verbose = FALSE)
  writeLines(c(
    sprintf("PKG_CPPFLAGS=-I\"%s\"", dpIncludeDir()),
    "PKG_CFLAGS=-pthread",
    "PKG_LIBS=-pthread"
  ), file.path(wd, "Makevars"))
  so <- file.path(wd, paste0("concurrent_parser", .Platform$dynlib.ext))
  owd <- setwd(wd)
  out <- system2(file.path(R.home("bin"), "R"),
                 c("CMD", "SHLIB", "-o", basename(so), "concurrent_parser.c",
                   "concurrent.g.d_parser.c"),
                 stdout = TRUE, stderr = TRUE)
  setwd(owd)
  if (!file.exists(so)) skip(paste(c("could not build the test parser:", out), collapse = "\n"))
  dll <- dyn.load(so)
  on.exit(dyn.unload(so), add = TRUE)
  txt <- paste(sprintf("a%d = f(b + c * %d, g(x, y, z), (d + e) * h);", 1:200, 1:200),
               collapse = "\n")
  expect_equal(.Call(dll$concurrent_dparse, txt, 1L, 5L), 0L)
  expect_equal(.Call(dll$concurrent_dparse, txt, 4L, 50L), 0L)
})
