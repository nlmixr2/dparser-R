## Regex -> NFA construction in src/lex.c build_regex_nfa() (#42,
## upstream jplevyak/dparser 6d494a3).

regex_parser <- function(lines) {
  g <- tempfile(fileext = ".g")
  on.exit(unlink(g))
  writeLines(lines, g)
  dparse(g)
}

## TRUE when the whole input parses as the start symbol, FALSE on a
## syntax error.
regex_parses <- function(f, x) {
  tryCatch(
    {
      utils::capture.output(f(x, function(name, value, pos, depth) NULL))
      TRUE
    },
    error = function(e) FALSE
  )
}

test_that("a bracket range ending at \\xff builds and matches (#42)", {
  skip_on_cran()
  skip_on_os("solaris")
  g <- tempfile(fileext = ".g")
  out <- tempfile()
  dir.create(out)
  on.exit(unlink(c(g, out), recursive = TRUE))
  writeLines(c("s : id+;", "id : \"[\\x80-\\xff]+\";"), g)
  ## used to loop forever: the uint8 range counter wrapped from 255 to 0
  expect_error(mkdparse(g, out), NA)

  f <- regex_parser(c("s : t ;", "t : \"[\\x80-\\xff]+\" ;"))
  expect_true(regex_parses(f, "\xc3\xa9\xff\x80"))
  expect_false(regex_parses(f, "abc"))
  expect_false(regex_parses(f, "\x7f"))
})
