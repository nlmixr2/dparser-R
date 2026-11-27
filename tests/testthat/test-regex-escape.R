## Quoted strings inside regex productions (`::=`) are folded into a single
## regular expression; `|` and `/` must be escaped so they match literally
## (#43, upstream jplevyak/dparser@51a4d04).

.regexEscapeParse <- function(grammar, input) {
  g <- tempfile(fileext = ".g")
  on.exit(unlink(g))
  writeLines(grammar, g)
  p <- dparse(g)
  vals <- character(0)
  ok <- tryCatch(
    {
      p(input, function(name, value, pos, depth) {
        vals <<- c(vals, sprintf("%s=%s", name, trimws(value)))
      })
      TRUE
    },
    error = function(e) FALSE
  )
  list(ok = ok, vals = vals)
}

test_that("'|' in a regex production string is literal (#43)", {
  skip_on_cran()
  skip_on_os("solaris")
  g <- "S: bars*; bars ::= '||'+;"
  r <- .regexEscapeParse(g, "||||")
  expect_true(r$ok)
  expect_true("bars=||||" %in% r$vals)
  r <- .regexEscapeParse(g, "|| ||")
  expect_true(r$ok)
  expect_equal(sum(r$vals == "bars=||"), 2L)
  expect_false(.regexEscapeParse(g, "|")$ok)

  g <- "S: x; x ::= 'a|b';"
  r <- .regexEscapeParse(g, "a|b")
  expect_true(r$ok)
  expect_true("x=a|b" %in% r$vals)
  expect_false(.regexEscapeParse(g, "a")$ok)
  expect_false(.regexEscapeParse(g, "b")$ok)
})

test_that("'/' in a regex production string is literal (#43)", {
  skip_on_cran()
  skip_on_os("solaris")
  g <- "S: slashes*; slashes ::= '/'+;"
  r <- .regexEscapeParse(g, "/")
  expect_true(r$ok)
  expect_true("slashes=/" %in% r$vals)
  r <- .regexEscapeParse(g, "/ /")
  expect_true(r$ok)
  expect_equal(sum(r$vals == "slashes=/"), 2L)
})
