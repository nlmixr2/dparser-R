# Regression tests for nlmixr2/dparser-R#39 (upstream jplevyak/dparser#31):
# get_unshared_priorities() broke ties between equal-height subtrees by
# comparing PNode heap addresses, so ambiguous unary/binary priority parses
# could pick a different tree from one parse (or R session) to the next.

.priority_tree <- function(f, text, keep) {
  acc <- character(0)
  f(text, function(name, value, pos, depth) {
    if (name %in% keep) {
      acc <<- c(acc, sprintf("%s%s", strrep(" ", depth), value))
    }
  })
  acc
}

.priority_trees <- function(grammar, text, keep, n = 25, ...) {
  f <- dparse(testthat::test_path(grammar), children_first = FALSE, ...)
  unique(lapply(seq_len(n), function(i) .priority_tree(f, text, keep)))
}

# Parse `text` with `grammar` in a fresh R session and return the tree, so
# heap layout (and ASLR) differs between the compared parses.
.priority_tree_fresh <- function(grammar, text, keep) {
  out <- tempfile(fileext = ".rds")
  script <- tempfile(fileext = ".R")
  on.exit(unlink(c(out, script)))
  .d <- function(x) paste(deparse(x), collapse = "")
  writeLines(
    c(
      sprintf(".libPaths(%s)", .d(.libPaths())),
      "suppressMessages(library(dparser))",
      sprintf(
        "f <- dparse(%s, children_first = FALSE)",
        .d(normalizePath(testthat::test_path(grammar)))
      ),
      "acc <- character(0)",
      sprintf("txt <- %s", .d(text)),
      "f(txt, function(name, value, pos, depth) {",
      sprintf("  if (name %%in%% %s) {", .d(keep)),
      "    acc <<- c(acc, sprintf(\"%s%s\", strrep(\" \", depth), value))",
      "  }",
      "})",
      sprintf("saveRDS(acc, %s)", .d(out))
    ),
    script
  )
  rscript <- file.path(R.home("bin"), "Rscript")
  status <- suppressWarnings(
    system2(
      rscript,
      c("--vanilla", shQuote(script)),
      stdout = FALSE,
      stderr = FALSE
    )
  )
  if (status != 0 || !file.exists(out)) {
    return(NULL)
  }
  readRDS(out)
}

ite_text <- "proc P = true -> tau.true -> (tau.P) <> P;"

test_that("unary-priority if-then-else parses deterministically", {
  skip_on_os("solaris")
  trees <- .priority_trees("priority-ite.g", ite_text, "ProcExpr")
  expect_length(trees, 1L)
  # Expected: true -> (tau . (true -> (tau.P) <> P)); this matches the
  # upstream jplevyak/dparser mcrl2_syntax test baseline.
  expect_equal(
    trees[[1]][1:3],
    c(
      " true -> tau.true -> (tau.P) <> P",
      " true ->",
      " tau.true -> (tau.P) <> P"
    )
  )
})

rx_text <- "y = a ? -b^2 : c ? !d : -e*f + g ? h : -(i) ^ 2;"

# Only the default disambiguation settings are checked: with both
# greediness and height disabled these inputs end in an unresolved ambiguity,
# which the R binding settles with ambiguity_count_fn() (first candidate).
test_that("rxode2-style ternary/unary expression is deterministic", {
  skip_on_os("solaris")
  trees <- .priority_trees("priority-rx.g", rx_text, "expr")
  expect_length(trees, 1L)
})

test_that("priority parses agree across fresh R sessions", {
  skip_on_cran()
  skip_on_os("solaris")
  ref <- .priority_trees("priority-ite.g", ite_text, "ProcExpr", n = 1)[[1]]
  ref_rx <- .priority_trees("priority-rx.g", rx_text, "expr", n = 1)[[1]]
  for (i in 1:3) {
    fresh <- .priority_tree_fresh("priority-ite.g", ite_text, "ProcExpr")
    if (is.null(fresh)) {
      skip("could not run a fresh R session")
    }
    expect_equal(fresh, ref)
    expect_equal(
      .priority_tree_fresh("priority-rx.g", rx_text, "expr"),
      ref_rx
    )
  }
})
