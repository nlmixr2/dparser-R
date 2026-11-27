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

test_that("a loop in one alternative does not reach its siblings (#42)", {
  skip_on_cran()
  skip_on_os("solaris")
  ## "a*|b" used to accept "ab": the a* loop went back to the shared start
  ## state, from which the "b" alternative was reachable
  f <- regex_parser(c("s : t ;", "t : \"a*|b\" ;"))
  expect_true(regex_parses(f, "aaa"))
  expect_true(regex_parses(f, "b"))
  expect_false(regex_parses(f, "ab"))
  expect_false(regex_parses(f, "aab"))
  expect_false(regex_parses(f, "ba"))

  f <- regex_parser(c("s : t ;", "t : \"(ab|cd)*\" ;"))
  expect_true(regex_parses(f, "abcdab"))
  expect_true(regex_parses(f, "cdcd"))
  expect_false(regex_parses(f, "abad"))
  expect_false(regex_parses(f, "acd"))

  f <- regex_parser(c("s : t ;", "t : \"x(a+|b)y\" ;"))
  expect_true(regex_parses(f, "xaaay"))
  expect_true(regex_parses(f, "xby"))
  expect_false(regex_parses(f, "xaby"))
  expect_false(regex_parses(f, "xaaby"))
})

test_that("ignore_case folds bracket classes before negation (#42)", {
  skip_on_cran()
  skip_on_os("solaris")
  ## "[^a]"/i used to accept "A": the class was negated without folding
  f <- regex_parser(c("s : t ;", "t : \"[^a]\"/i ;"))
  expect_true(regex_parses(f, "b"))
  expect_false(regex_parses(f, "a"))
  expect_false(regex_parses(f, "A"))

  f <- regex_parser(c("s : t ;", "t : \"[a-c]+\"/i ;"))
  expect_true(regex_parses(f, "aBc"))
  expect_true(regex_parses(f, "CBA"))
  expect_false(regex_parses(f, "abd"))

  ## without /i the class stays case sensitive
  f <- regex_parser(c("s : t ;", "t : \"[^a]\" ;"))
  expect_true(regex_parses(f, "A"))
  expect_false(regex_parses(f, "a"))
})
