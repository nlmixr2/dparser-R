test_that("new_D_Parser rejects negative sizeof_ParseNode_User cleanly", {
  # Before the fix, new_D_Parser stored a negative `sizeof_ParseNode_User`
  # verbatim into p->user.sizeof_user_parse_node.  Subsequently, in
  # make_PNode (src/parse.c:935-942), the per-PNode allocation size
  #
  #   uint l = sizeof(PNode) - sizeof(d_voidp) + p->user.sizeof_user_parse_node;
  #
  # underflows on negative addends, producing a small allocation that the
  # rest of make_PNode then writes past — heap corruption.
  #
  # valgrind on the unfixed build (calling dparse(..., parse_size=-1)
  # followed by parsing a small input) reports:
  #   Invalid write of size 8
  #     at make_PNode (parse.c:965)
  #     by add_PNode (parse.c:1048)
  #     by exhaustive_parse / reduce_one / shift_all
  #   ERROR SUMMARY: 281 errors from 12 contexts
  #
  # After the fix, new_D_Parser raises Rf_error("new_D_Parser:
  # sizeof_ParseNode_User must be non-negative (got %d)") before any
  # parser state is allocated.  valgrind reports 0 errors.

  f <- dparse(system.file("tran.g", package = "dparser"), parse_size = -1L)
  expect_error(
    f({b = 1; d/dt(X) = a*X},
      function(name, value, pos, depth) {}),
    regexp = "must be non-negative"
  )
})
