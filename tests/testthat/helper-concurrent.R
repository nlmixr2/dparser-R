# Compiles `grammar` (lines of a .g file) together with concurrent_parser.c
# into a throwaway shared library and loads it.  Returns the DLLInfo; the
# caller unloads it and removes attr(, "wd") when done.
build_concurrent_parser <- function(grammar) {
  wd <- tempfile("dparser-concurrent")
  dir.create(wd)
  if (!file.copy(testthat::test_path("concurrent_parser.c"), wd)) stop("could not copy concurrent_parser.c")
  writeLines(grammar, file.path(wd, "concurrent.g"))
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
  if (!file.exists(so)) stop(paste(c("could not build the test parser:", out), collapse = "\n"))
  dll <- dyn.load(so)
  attr(dll, "wd") <- wd
  dll
}

unload_concurrent_parser <- function(dll) {
  wd <- attr(dll, "wd")
  dyn.unload(file.path(wd, paste0("concurrent_parser", .Platform$dynlib.ext)))
  unlink(wd, recursive = TRUE)
}
