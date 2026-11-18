## scan_buffer() must record a token's end line/column after consuming its
## last character for every scanner table size (#44, upstream a1f64e7).
## A grammar with a few keywords gets 8-bit scanner tables; one with
## hundreds of keywords needs 16-bit tables.  Both must report the same
## syntax error position.
test_that("token locations agree for 8-bit and 16-bit scanner tables", {
  skip_on_cran()
  skip_on_os("solaris")

  mkGrammar <- function(n) {
    file <- tempfile(fileext = ".g")
    kws <- paste0("'kw", seq_len(n), "'")
    writeLines(
      c(
        "prog: stmt*;",
        "stmt: kw ';' | cmt;",
        "cmt: \"#[^\\n]*\\n\";",
        paste0("kw: ", paste(kws, collapse = " | "), ";")
      ),
      file
    )
    file
  }

  ## error on the token after 'kw3', on the same line
  inCol <- tempfile(fileext = ".txt")
  writeLines(c("kw1;", "kw2;", "  kw3 kw1;"), inCol)
  ## error after a token that ends in a newline
  inLine <- tempfile(fileext = ".txt")
  writeLines(c("kw1;", "#c", "kw2 kw3;"), inLine)
  on.exit(unlink(c(inCol, inLine)))

  errPos <- function(f, input) {
    msg <- tryCatch(
      {
        utils::capture.output(eval(bquote(f(.(input), function(...) NULL))))
        "no error"
      },
      error = function(e) conditionMessage(e)
    )
    sub("^.*(line [0-9]+ column [0-9]+).*$", "\\1", msg)
  }

  for (n in c(3, 400)) {
    f <- dparse(mkGrammar(n))
    expect_equal(
      errPos(f, inCol),
      "line 3 column 6",
      info = paste(n, "keywords")
    )
    expect_equal(
      errPos(f, inLine),
      "line 3 column 4",
      info = paste(n, "keywords")
    )
  }
})
