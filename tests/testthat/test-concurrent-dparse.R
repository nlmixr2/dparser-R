test_that("dparse() is safe to run from several threads at once (rxode2#1427)", {
  skip_on_cran()
  skip_on_os("windows")
  # long right-hand sides make each reduction grow the shared first path
  dll <- build_concurrent_parser(c(
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
  ))
  on.exit(unload_concurrent_parser(dll), add = TRUE)
  txt <- paste(sprintf("a%d = f(b + c * %d, g(x, y, z), (d + e) * h);", 1:200, 1:200),
               collapse = "\n")
  expect_equal(.Call(dll$concurrent_dparse, txt, 1L, 5L), 0L)
  expect_equal(.Call(dll$concurrent_dparse, txt, 4L, 50L), 0L)
})

test_that("one-statement parses spread over threads match a serial run (#33)", {
  # The way rxode2's C common-subexpression pass calls dparse(), where #33
  # crashed in reduce_one() under clang ASan/UBSan: a worker pool takes model
  # statements off a shared queue and parses each with its own new D_Parser.
  # Every statement's parse tree must come out the same as on one thread.
  skip_on_cran()
  skip_on_os("windows")
  dll <- build_concurrent_parser(c(
    "statement: lhs '<-' expr | lhs '=' expr;",
    "lhs: 'd/dt' '(' identifier ')' | identifier;",
    "expr: expr '+' expr $left 1",
    "  | expr '-' expr $left 1",
    "  | expr '*' expr $left 2",
    "  | expr '/' expr $left 2",
    "  | expr '^' expr $right 4",
    "  | '-' expr $unary_right 3",
    "  | identifier '(' expr (',' expr)* ')'",
    "  | '(' expr ')'",
    "  | identifier",
    "  | number;",
    "identifier: \"[a-zA-Z_][a-zA-Z0-9_.]*\";",
    "number: \"[0-9]+(\\.[0-9]+)?\";"
  ))
  on.exit(unload_concurrent_parser(dll), add = TRUE)
  # Jacobian / sensitivity-sized statements, like rxode2's sensitivity models
  set.seed(33)
  ops <- c(" + ", " - ", "*", "/", "^")
  fns <- c("exp", "log", "sqrt", "pow")
  gen <- function(depth) {
    if (depth <= 0L || runif(1) < 0.15) {
      return(if (runif(1) < 0.7) sample(c("p1", "p2", "p3", "p4", "x", "y", "cp"), 1)
             else format(round(runif(1, 0, 10), 2)))
    }
    switch(sample(4L, 1),
           paste0(gen(depth - 1L), sample(ops, 1), gen(depth - 1L)),
           paste0(sample(fns, 1), "(", gen(depth - 1L), ", ", gen(depth - 1L), ")"),
           paste0("(", gen(depth - 1L), ")"),
           paste0("-", gen(depth - 1L)))
  }
  lhs <- c(sprintf("rx__sens_x_BY_p%d", 1:150), sprintf("d/dt(s%d)", 1:150))
  stmts <- paste(lhs, "<-", vapply(lhs, function(l) gen(7L), ""))
  serial <- .Call(dll$concurrent_dparse_stmts, stmts, 1L)
  expect_false(anyNA(serial))
  for (nthr in rep(c(2L, 4L, 8L), 5L)) {
    expect_identical(.Call(dll$concurrent_dparse_stmts, stmts, nthr), serial)
  }
})
