# mkdparse dparser grammer c

Make a dparser c file based on a grammer

## Usage

``` r
mkdparse(
  file,
  outputFile,
  set_op_priority_from_rule = FALSE,
  right_recursive_BNF = FALSE,
  states_for_whitespace = TRUE,
  states_for_all_nterms = FALSE,
  tokenizer = FALSE,
  token_type = c("#define", "enum"),
  longest_match = FALSE,
  grammar_ident = "gram",
  ident_from_filename = FALSE,
  scanner_blocks = 4,
  write_line_directives = TRUE,
  write_header = c("IfEmpty", TRUE, FALSE),
  rdebug = FALSE,
  verbose = FALSE,
  write_extension = "c",
  use_r_header = TRUE
)
```

## Arguments

- file:

  File name of grammer to parse.

- outputFile:

  Output file name. Can be a directory. If so, the file name is
  determined by the input file.

- set_op_priority_from_rule:

  Toggle setting of operator priority from rules. Setting of operator
  priorities on operator tokens can increase the size of the tables but
  can permit unnecessary parse stacks to be pruned earlier. (FALSE by
  default)

- right_recursive_BNF:

  Toggle use of right recursion for EBNF productions. Do not change this
  unless you really know what you are doing. (FALSE by default)

- states_for_whitespace:

  Toggle computing whitespace states. If 'whitespace' is defined in the
  grammar, then use it as a subparser to consume whitespace. (TRUE by
  default)

- states_for_all_nterms:

  Toggle computing states for all non-terminals. Ensures that there is a
  unique state for each non-terminal so that a subparsers can be invoked
  for that non-terminal. (FALSE by default)

- tokenizer:

  Toggle building of a tokenizer for START. When TRUE, instead of
  generating a unique scanner for each state (i.e. a 'scannerless'
  parser), generate a single scanner (tokenizer) for the entire grammar.
  This provides an easy way to build grammars for languages which assume
  a tokenizer (e.g. ANSI C). (FALSE by default)

- token_type:

  Token type "#define" or "enum"

- longest_match:

  Toggle longest match lexical ambiguity resolution. When TRUE the
  scanner only recognizing the longest matching tokens in a given state.
  This provides an easy way to build grammars for languages which use
  longest match lexical ambiguity resolution (e.g. ANSI-C, C++). (FALSE
  by default)

- grammar_ident:

  Tag for grammar data structures so that multiple sets of tables can be
  included in one file/application. (defaults to 'gram')

- ident_from_filename:

  Build the grammer tag from the file-name.

- scanner_blocks:

  Number of blocks to which scanner tables are broken up into. Larger
  numbers permit more sharing with more overhead. 4 seems to be optimal
  for most grammars. (defaults to 4) files.

- write_line_directives:

  Toggle writing of line numbers. Used to debug the parsing table
  generator itself. (TRUE by default)

- write_header:

  Write header, FALSE : no, TRUE : yes, "IfEmpty" : only if not empty.

- rdebug:

  Replace all actions in the grammar with actions printing productions,
  1 : during the speculative parsing process (\<-), 2 : when reduction
  is part of any legal final parse (\<=), 3 : both, 4 : remove all
  actions from the grammar. Print the changed grammar to console. Useful
  for debugging or prototyping new, experimental grammars.

- verbose:

  Increase verbosity.

- write_extension:

  Set the extension of the generated code file. For C++ programs (for
  example) the extension can be set to .cpp with the option
  `write_extension="cpp"`. (`write_extension="c"` by default)

- use_r_header:

  when TRUE, add R headers and swap printf for Rprintf. By default this
  is TRUE.

## Value

Nothing. Outputs files instead.

## Details

Uses a grammer file to create a c file for parsing.

mkdparser is a scannerless GLR parser generator based on the Tomita
algorithm. It is self-hosted and very easy to use. Grammars are written
in a natural style of EBNF and regular expressions and support both
speculative and final actions.

## Creating a Grammar for Parsing

- Grammar Comments::

  Grammars can include C/C++ style comments

  **Example:**


      // My first grammar
      E: E '+' E | "[abc]";
      /* is this right? */

- Grammar Productions::

  A production is the parts of your language your are trying to parse
  and are tpyically named. See
  https://en.wikipedia.org/wiki/Top-down_parsing

  - The first production is the root of your grammar (what you will be
    trying to parse).

  - Productions start with the non-terminal being defined followed by a
    colon ':', a set of right hand sides separated by '\|' (or)
    consisting of elements (non-terminals or terminals).

  - Elements can be grouped with parens '(', and the normal regular
    expression symbols can be used ('+' '\*' '?' '\|').

  - Elements can be grouped with parens '(', and the normal regular
    expression symbols can be used ('+' '\*' '?' '\|').

  - Elements can be repeated using '@', for example elem@3 or elem@1:3
    for repeat 3 or between 1 and 3 times respectively.

  **Example:**


       program: statements+ |  comment* (function |  procedure)?;

  **Note:** Instead of using '\[' '\]' for optional elements we use the
  more familar and consistent '?' operator. The square brackets are
  reserved for speculative actions (below).

- Global C code in Grammars::

  Since the main parsing of the language grammar is in C, intermixing C
  code with the grammar can be useful.

  - Global (or static) C code can be intermixed with productions by
    surrounding the code with brackets '{}'.

  **Example:**


        { void dr_s() { printf("Dr. S\n"); }
         S: 'the' 'cat' 'and' 'the' 'hat' { dr_s(); } | T;
         { void twain() { printf("Mark Twain\n"); }
             T: 'Huck' 'Finn' { twain(); };

  **Note:** When parsing the grammar using `mkdparse`, the option
  `use_r_header = TRUE` will redefine `printf` to `Rprintf` to better
  comply with R packages.

- Terminals:

  The terminals are the peices of the language that are being parsed,
  like language keywords.

  - Strings terminals are surrounded with single quotes. For example:


      block: '{' statements* '}';
      whileblock: 'while' '(' expression ')' block;

  - Unicode literals can appear in strings or as characters with U+ or
    u+. For example:


      U+03c9 { printf("omega\n"); }

- Priorities and Associativity::

  Priorities can very from MININT to MAXINT and are specified as
  integers. Associativity can take the values:


      assoc : '$unary_op_right' | '$unary_op_left' | '$binary_op_right'
      | '$binary_op_left' | '$unary_right' | '$unary_left'
      | '$binary_right' | '$binary_left' | '$right' | '$left' ;

  - Token Prioritites

  Termininal priorities apply after the set of matching strings has been
  found and the terminal(s) with the highest priority is selected.

  Terminal priorities are introduced after a terminal by the specifier
  **\$term**. We saw an example of token priorities with the definition
  of **ident**.

  **Example:**


      S : 'if' '(' S ')' S ';' | 'do' S 'while' '(' S ')' ';' | ident;
      ident: "[a-z]+" $term -1;

  - Operator Priorities

  Operator priorities specify the priority of a operator symbol (either
  a terminal or a non-terminal). This corresponds to the yacc or bison
  doesn't require a global tokenizer, operator priorities and
  associativities are specified on the reduction which creates the
  token. Moreover, the associativity includes the operator usage as well
  since it cannot be infered from rule context. Possible operator
  associativies are:


      operator_assoc : '$unary_op_right' | '$unary_op_left' | '$binary_op_right'
                          | '$binary_op_left' | '$unary_right' | '$unary_left'
                          | '$binary_right' | '$binary_left';

  **Example:**


      E: ident op ident;
      ident: '[a-z]+';
      op: '*' $binary_op_left 2 |
          '+' $binary_op_left 1;

  - Rule Priorities

  Rule priorities specify the priority of the reduction itself and have
  the possible associativies:


      rule_assoc: '$right' | '$left';

  Rule and operator priorities can be intermixed and are interpreted at
  run time (not when the tables are built). This make it possible for
  user-defined scanners to return the associativities and priorities of
  tokens.

- Actions: :

  Actions are the bits of code which run when a reduction occurs.
  Example


       S: this | that;
       this: 'this' { printf("got this\n"); };
       that: 'that' { printf("got that\n"); };

  - Speculative Action

  Speculative actions occur when the reduction takes place during the
  speculative parsing process. It is possible that the reduction will
  not be part of the final parse or that it will occur a different
  number of times. For example:


      S: this | that;
      this: hi 'mom';
      that: ho 'dad';
      ho: 'hello' [ printf("ho\n"); ];
      hi: 'hello' [ printf("hi\n"); ];

  Will print both 'hi' and 'ho' when given the input 'hello dad' because
  at the time hello is reduced, the following token is not known.

  - Final Actions

  Final actions occur only when the reduction must be part of any legal
  final parse (committed). It is possible to do final actions during
  parsing or delay them till the entire parse tree is constructed (see
  Options). Final actions are executed in order and in number according
  the the single final unambiguous parse.


       S: A S 'b' | 'x';
       A: [ printf("speculative e-reduce A\n"); ]
          { printf("final e-reduce A\n"); };

  On input:


       xbbb

  Will produce:


       speculative e-reduce A
       final e-reduce A
       final e-reduce A
       final e-reduce A

  - Embedded Actions

  Actions can be embedded into rule. These actions are executed as if
  they were replaced with a synthetic production with a single null rule
  containing the actions. For example:


       S: A { printf("X"); } B;
       A: 'a' { printf("a"); };
       B: 'b' { printf("b"); };

  On input:


      ab

  Will produce:


       aXb

  Note that in the above example, the print("X") is evaluated in a
  context null rule context while in:


       S: A (A B { printf("X"); }) B;

  The print is evalated in the context of the "A B" subrule because it
  appears at the end of the subrule and is therefor treated as a normal
  action for the subrule.

  - Pass Actions

  DParser supports multiple pass compilation. The passes are declared at
  the top of the grammar, and the actions are associated with individual
  rules.

  **Example;**


       ${pass sym for_all postorder}
       ${pass gen for_all postorder}

       translation_unit: statement*;

       statement
         : expression ';' {
           d_pass(${parser}, &$n, ${pass sym});
           d_pass(${parser}, &$n, ${pass gen});
         }
         ;

       expression :  integer
         gen: { printf("gen integer\n"); }
         sym: { printf("sym integer\n"); }
         | expression '+' expression $right 2
         sym: { printf("sym +\n"); }
         ;

  A pass name then a colon indicate that the following action is
  associated with a particular pass. Passes can be either for_all or
  for_undefined (which means that the automatic traversal only applies
  to rules without actions defined for this pass). Furthermore, passes
  can be postorder, preorder, and manual (you have to call d_pass
  yourself). Passes can be initiated in the final action of any rule.

  - Default Actions

  The special production "\_" can be defined with a single rule whose
  actions become the default when no other action is specified. Default
  actions can be specified for speculative, final and pass actions and
  apply to each separately.

  **Example**


       _: { printf("final action"); }
           gen: { printf("default gen action"); }
           sym: { printf("default sym action"); }
           ;

- Attributes and Action Specifiers:

  Each of the language parser can have some global attributes and
  actions associated with each part of the parsed code.

  - Global State (\$g)

  Global state is declared by define'ing D_ParseNode_Globals (see the
  ANSI C grammar for a similar declaration for symbols). Global state
  can be accessed in any action with \$g. Because DParser handles
  ambiguous parsing global state can be accessed on different
  speculative parses. In the future automatic splitting of global state
  may be implemented (if there is demand). Currently, the global state
  can be copied and assigned to \$g to ensure that the changes made only
  effect subsequent speculative parses derived from the particular
  parse.

  **Example**


        [ $g = copy_globals($g);
        $g->my_variable = 1;
        ]

  The symbol table (see below) can be used to manage state information
  safely for different speculative parses.

  - Parse Node State

  Each parse node includes a set of system state variables and can have
  a set of user-defined state variables. User defined parse node state
  is declared by define'ing D_ParseNodeUser. The size of the parse node
  state must be passed into new_D_Parser() to ensure that the
  appropriate amount of space is allocated for parse nodes. Parse node
  state is accessed with:

  \$#

  :   number of child nodes

  \$\$

  :   user parse node state for parent node (non-terminal defined by the
      production)

  \$X (where X is a number)

  :   the user parse node state of element X of the production

  \$n

  :   the system parse node state of the rule node

  \$nX

  :   the system parse node state of element X of the production

  The system parse node state is defined in dparse.h which is installed
  with DParser. It contains such information as the symbol, the location
  of the parsed string, and pointers to the start and end of the parsed
  string.

  - Misc

  \${scope}

  :   the current symbol table scope

  \${reject}

  :   in speculative actions permits the current parse to be rejected

- Symbol Table:

  The symbol table can be updated down different speculative paths while
  sharing the bulk of the data. It defines the following functions in
  the file (dsymtab.h):


        struct D_Scope *new_D_Scope(struct D_Scope *st);
        struct D_Scope *enter_D_Scope(struct D_Scope *current, struct D_Scope *scope);
        D_Sym *NEW_D_SYM(struct D_Scope *st, char *name, char *end);
        D_Sym *find_D_Sym(struct D_Scope *st, char *name, char *end);
        D_Sym *UPDATE_D_SYM(struct D_Scope *st, D_Sym *sym);
        D_Sym *current_D_Sym(struct D_Scope *st, D_Sym *sym);
        D_Sym *find_D_Sym_in_Scope(struct D_Scope *st, char *name, char *end);
        

  'new_D_Scope' creates a new scope below 'st' or NULL for a 'top level'
  scope. 'enter_D_Scope' returns to a previous scoping level. NOTE: do
  not simply assign \${scope} to a previous scope as any updated symbol
  information will be lost. 'commit_D_Scope' can be used in final
  actions to compress the update list for the top level scope and
  improve efficiency.

  'find_D_Sym' finds the most current version of a symbol in a given
  scope. 'UPDATE_D_SYM' updates the value of symbol (creates a
  difference record on the current speculative parse path).
  'current_D_Sym' is used to retrive the current version of a symbol,
  the pointer to which may have been stored in some other attribute or
  variable. Symbols with the same name should not be created in the same
  scope. The function 'find_D_Sym_in_Scope' is provided to detect this
  case.

  User data can be attached to symbols by **define**'ing **D_UserSym**.
  See the ANSI C grammar for an example.

  Here is a full example of scope usage (from tests/g29.test.g):



        #include <stdio.h>

        typedef struct My_Sym {
          int value;
        } My_Sym;
        #define D_UserSym My_Sym
        typedef struct My_ParseNode {
          int value;
          struct D_Scope *scope;
        } My_ParseNode;
        #define D_ParseNode_User My_ParseNode
      }

      ranslation_unit: statement*;

      tatement
      : expression ';'
      { printf("
      | '{' new_scope statement* '}'
      [ ${scope} = enter_D_Scope(${scope}, $n0.scope); ]
      { ${scope} = commit_D_Scope(${scope}); }
      ;

      ew_scope: [ ${scope} = new_D_Scope(${scope}); ];

      xpression
      : identifier ':' expression
      [
      _Sym *s;
      f (find_D_Sym_in_Scope(${scope}, $n0.start_loc.s, $n0.end))
      rintf("duplicate identifier line 
       = NEW_D_SYM(${scope}, $n0.start_loc.s, $n0.end);
      ->user.value = $2.value;
      $.value = s->user.value;
      ]
      | identifier '=' expression
      [ D_Sym *s = find_D_Sym(${scope}, $n0.start_loc.s, $n0.end);
       = UPDATE_D_SYM(${scope}, s);
      ->user.value = $2.value;
      $.value = s->user.value;
      ]
      | integer
      [ $$.value = atoi($n0.start_loc.s); ]
      | identifier
      [ D_Sym *s = find_D_Sym(${scope}, $n0.start_loc.s, $n0.end);
      f (s)
      $.value = s->user.value;
      ]
      | expression '+' expression
      [ $$.value = $0.value + $1.value; ]
      ;

      nteger: "-?([0-9]|0(x|X))[0-9]*(u|U|b|B|w|W|L|l)*" $term -1;
      dentifier: "[a-zA-Z_][a-zA-Z_0-9]*";

- Whitespace:

  Whitespace can be specified two ways: C function which can be
  user-defined, or as a subgrammar. The default whitespace parser is
  compatible with C/C++ \#line directives and comments. It can be
  replaced with any user specified function as a parsing option (see
  Options).

  Additionally, if the (optionally) reserved production **whitespace**
  is defined, the subgrammar it defines will be used to consume
  whitespace for the main grammar. This subgrammar can include normal
  actions.

  **Example**


      : 'a' 'b' 'c';
      hitespace: "[ \t\n]*";

  Whitespace can be accessed on a per parse node basis using the
  unctions: **d_ws_before** and **d_ws_after**, which return the tart of
  the whitespace before start_loc.s and after end respectively.

- Ambiguities:

  Ambiguities are resolved automatically based on priorities and
  associativities. In addition, when the other resolution techniques
  fail, user defined ambiguity resolution is possible. The default
  ambiguity handler produces a fatal error on an unresolved ambiguity.
  This behavior can be replaced with a user defined resolvers the
  signature of which is provided in dparse.h.

  If the **verbose_level** flag is set, the default ambiguity handler
  will print out parenthesized versions of the ambiguous parse trees.
  This may be of some assistance in disambiguating a grammar.

- Error Recovery:

  DParser implements an error recovery scheme appropriate to scannerless
  parsers. I haven't had time to investigate all the prior work in this
  area, so I am not sure if it is novel. Suffice for now that it is
  optional and works well with C/C++ like grammars.

- Parsing Options:

  Parser are instantiated with the function new_D_Parser. The resulting
  data structure contains a number of user configurable options (see
  dparser.h). These are provided reasonable default values and include:

  - **initial_globals** - the initial global variables accessible
    through \$g

  - **initial_skip_space_fn** - the initial whitespace function

  - **initial_scope** - the initial symbol table scope

  - **syntax_error_fn** - the function called on a syntax error

  - **ambiguity_fn** - the function called on an unresolved ambiguity

  - **loc** - the initial location (set on an error).

  In addition, there are the following user configurables:

  - **sizeof_user_parse_node** - the sizeof D_ParseNodeUser

  - **save_parse_tree** - whether or not the parse tree should be save
    once the final actions have been executed

  - **dont_fixup_internal_productions** - to not convert the Kleene star
    into a variable number of children from a tree of reductions

  - **dont_merge_epsilon_trees** - to not automatically remove
    ambiguities which result from trees of epsilon reductions without
    actions

  - **dont_use_greediness_for_disambiguation** - do not use the rule
    that the longest parse which reduces to the same token should be
    used to disambiguate parses. This rule is used to handle the case
    (if then else?) relatively cleanly.

  - **dont_use_height_for_disambiguation** - do not use the rule that
    the least deep parse which reduces to the same token should be used
    to disabiguate parses. This rule is used to handle recursive
    grammars relatiively cleanly.

  - **dont_compare_stacks** - disables comparing stacks to handle
    certain exponential cases during ambiguous operator priority
    resolution.

  - **commit_actions_interval** - how often to commit final actions (0
    is immediate, MAXINT is essentially not till the end of parsing)

  - **error_recovery** - whether or not to use error recovery (defaults
    ON)

  An the following result values:

  - **syntax_errors** - how many syntax errors (if **error_recovery**
    was on)

  This final value should be checked to see if parse was successful.

## Author

Matthew L. Fidler for R interface, John Plevyak for dparser

## Examples

``` r

## This makes the ANSI c grammar file to parse C code:
mkdparse(system.file("ansic.test.g", package = "dparser"),
        file.path(tempdir(), "ansic_gram.c"),
         grammar_ident="ascii_C")
```
