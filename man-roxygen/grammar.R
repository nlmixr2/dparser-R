##' @section Creating a Grammar for Parsing:
##' \describe{
##' \item{Grammar Comments:}{Grammars can include C/C++ style comments
##'
##'  \bold{Example:}
##' \preformatted{
##' // My first grammar
##' E: E '+' E | "[abc]";
##' /* is this right? */
##' }}
##' \item{Grammar Productions:}{
##'
##' A production is the parts of your language your are trying to parse and are tpyically named.  See https://en.wikipedia.org/wiki/Top-down_parsing
##'
##' \itemize{
##'
##' \item The first production is the root of your grammar (what you
##' will be trying to parse).
##'
##' \item Productions start with the non-terminal being defined
##'    followed by a colon ':', a set of right hand sides separated by
##'    '|' (or) consisting of elements (non-terminals or terminals).
##'
##' \item Elements can be grouped with parens '(', and the normal
##' regular expression symbols can be used ('+' '*' '?' '|').
##'
##' \item Elements can be grouped with parens '(', and the normal
##' regular expression symbols can be used ('+' '*' '?' '|').
##'
##' \item Elements can be repeated using '@', for example elem@3 or
##' elem@1:3 for repeat 3 or between 1 and 3 times respectively.
##' }
##'
##' \bold{Example:}
##' \preformatted{
##'  program: statements+ |  comment* (function |  procedure)?;
##' }
##'
##'  \bold{Note:} Instead of using '[' ']' for optional elements we
##'  use the more familar and consistent '?' operator.  The square
##'  brackets are reserved for speculative actions (below).
##' }
##' \item{Global C code in Grammars:}{
##'
##'  Since the main parsing of the language grammar is in C, intermixing C code with the grammar can be useful.
##'
##' \itemize{\item Global (or static) C code can be intermixed with productions by surrounding the code with brackets '\{\}'.}
##'
##' \bold{Example:}
##' \preformatted{
##'   \{ void dr_s() \{ printf("Dr. S\n"); \}
##'    S: 'the' 'cat' 'and' 'the' 'hat' \{ dr_s(); \} | T;
##'    \{ void twain() \{ printf("Mark Twain\n"); \}
##'        T: 'Huck' 'Finn' \{ twain(); \};
##' }
##'
##' \bold{Note:} When parsing the grammar using
##' \code{\link{mkdparse}}, the option \code{use_r_header = TRUE} will
##' redefine \code{printf} to \code{Rprintf} to better
##' comply with R packages.
##' }
##' \item{Terminals}{
##'
##' The terminals are the peices of the language that are being parsed, like language keywords.
##'
##' \itemize{\item Strings terminals are surrounded with single quotes.  For example:}
##'
##' \preformatted{
##' block: '\{' statements* '\}';
##' whileblock: 'while' '(' expression ')' block;
##' }
##' \itemize{\item Unicode literals can appear in strings or as charaters with U+ or u+.  For example:}
##'
##' \preformatted{
##' U+03c9 \{ printf("omega\n"); \}
##' }
##' }
##'
##' \itemize{\item  Regular expressions are surrounded with double quotes.  For example:}
##' \preformatted{
##' hexint: "(0x|0X)[0-9a-fA-F]+[uUlL]?";
##' }
##' \bold{Note:}  only the simple regular expression operators are currently supported. This include parens, square parens, ranges, and '*', '+', '?'.
##'
##'
##' \itemize{\item Terminal modifiers}
##'
##' Terminals can contain embbed escape codes.  Including the standard
##' C escape codes, the codes \\x and \\d permit inserting hex and
##' decimal ASCII characters directly.
##'
##' Tokens can be given a name by appending the $name option.  This is useful when you have several
##' tokens which which represent the same string (e.g. ',').   For example,
##'
##' \preformatted{
##' function_call: function '(' parameter ( ',' $name 'parameter_comma' parameter) ')';
##' }
##'
##' It is now possible to use $0.symbol == $\{string parameter_comma\} to differentiate ParseNode ($0) between
##' a parameter comma node and say an initialization comma.
##'
##' Terminals ending in '/i' are case insensitive.  For example 'hi'/i
##' matches 'HI', 'Hi' and "hI' in addition to 'hi'.
##'
##' \itemize{\item External (C) Scanners}
##'
##' There are two types of external scanners, those which read a
##' single terminal, and those which are global (called for every
##' terminal).  Here is an example of a scanner for a single terminal.
##' Notice how it can be mixed with regular string terminals.
##'
##' \preformatted{
##' \{
##'     extern char *ops;
##'     extern void *ops_cache;
##'     int ops_scan(char *ops, void *ops_cache, char **as,
##'                  int *col, int *line, unsigned short *op_assoc, int *op_priority);
##' \}
##'
##' X: '1' ($\{scan ops_scan(ops, ops_cache)\} '2')*;
##'
##'
##' The user provides the 'ops_scan' function.  This example is from tests/g4.test.g in the source distribution.
##'
##' The second type of scanner is a global scanner:
##' \preformatted{
##'\{
##'    #include "g7.test.g.d_parser.h"
##'    int myscanner(char **s, int *col, int *line, unsigned short *symbol,
##'                  int *term_priority, unsigned short *op_assoc, int *op_priority)
##'    \{
##'        if (**s == 'a') \{
##'            (*s)++;
##'            *symbol = A;
##'            return 1;
##'        \} else if (**s == 'b') \{
##'            (*s)++;
##'            *symbol = BB;
##'            return 1;
##'        \} else if (**s == 'c') \{
##'            (*s)++;
##'            *symbol = CCC;
##'            return 1;
##'        \} else if (**s == 'd') \{
##'            (*s)++;
##'            *symbol = DDDD;
##'            return 1;
##'        \} else
##'            return 0;
##'    \}
##'    $\{scanner myscanner\}
##'    $\{token A BB CCC DDDD\}
##'
##'    S: A (BB CCC)+ SS;
##'    SS: DDDD;
##' }
##'
##' Notice how the you need to include the header file generated by
##' \code{\link{mkdparse}} which contains the token definitions.
##'
##' \itemize{\item Tokenizers}
##'
##' Tokenizers are non-context sensitive global scanners which produce
##' only one token for any given input string.  Some programming
##' languages (for example C) are easier to specify using a tokenizer
##' because (for example) reserved words can be handled simply by
##' lowering the terminal priority for identifiers.
##' \preformatted{
##' S : 'if' '(' S ')' S ';' | 'do' S 'while' '(' S ')' ';' | ident;
##' ident: "[a-z]+" $term -1;
##' }
##'
##' The sentence: \bold{if ( while ) a;} is legal because \bold{while}
##' cannot appear at the start of \bold{S} and so it doesn't conflict
##' with the parsing of \bold{while} as an \bold{ident} in that
##' position.  However, if a tokenizer is specified, all tokens will
##' be possible at each position and the sentense will produce a
##' syntax error.
##'
##' \bold{DParser} provides two ways to specify tokenizers: globally
##' as an option (-T) to \code{\link{mkdparse}} and locally with a $\{declare
##' tokenize ...\} specifier (see the ANSI C grammar for an example).
##' The $\{declare tokenize ...\} declartion allows a tokenizer to be
##' specified over a subset of the parsing states so that (for
##' example) ANSI C could be a subgrammar of another larger grammar.
##' Currently the parse states are not split so that the productions
##' for the substates must be disjoint.
##'
##' \itemize{\item Longest Match}
##'
##'  Longest match lexical ambiguity resolution is a technique used by
##'  separate phase lexers to help decide (along with lexical
##'  priorities) which single token to select for a given input
##'  string.  It is used in the definition of ANSI-C, but not in C++
##'  because of a snafu in the definition of templates whereby
##'  templates of templates (List<List <Int>>) can end with the right
##'  shift token
##'  ('>>').  Since \bold{DParser} does not have a separate lexical phase, it
##'  does not require longest match disambiguation, but provides it as an option.
##'
##' There are two ways to specify longest match disabiguation:
##' globally as an option (-l) to make_dparser or locally with with a
##' $\{declare longest_match ...\}.  If global longest match
##' disambiguation is \bold{ON}, it can be locally disabled with \{$declare
##' all_matches ...\} .  As with Tokenizers above, local declarations
##' operate on disjoint subsets of parsing states.
##' }
##' \item{Priorities and Associativity:}{
##'  Priorities can very from MININT to MAXINT and are specified as integers.  Associativity can take the values:
##' \preformatted{
##' assoc : '$unary_op_right' | '$unary_op_left' | '$binary_op_right'
##' | '$binary_op_left' | '$unary_right' | '$unary_left'
##' | '$binary_right' | '$binary_left' | '$right' | '$left' ;
##' }
##' \itemize{\item Token Prioritites}
##'
##' Termininal priorities apply after the set of matching strings has
##' been found and the terminal(s) with the highest priority is
##' selected.
##'
##' Terminal priorities are introduced after a terminal by the
##' specifier \bold{$term}.  We saw an example of token priorities
##' with the definition of \bold{ident}.
##'
##' \bold{Example:}\preformatted{
##' S : 'if' '(' S ')' S ';' | 'do' S 'while' '(' S ')' ';' | ident;
##' ident: "[a-z]+" $term -1;
##' }
##' \itemize{\item Operator Priorities}
##'
##' Operator priorities specify the priority of a operator symbol
##' (either a terminal or a non-terminal).  This corresponds to the
##' yacc or bison %left etc. declaration.  However, since DParser is
##' doesn't require a global tokenizer, operator priorities and
##' associativities are specified on the reduction which creates the
##' token.  Moreover, the associativity includes the operator usage as
##' well since it cannot be infered from rule context.  Possible
##' operator associativies are:
##' \preformatted{
##' operator_assoc : '$unary_op_right' | '$unary_op_left' | '$binary_op_right'
##'                     | '$binary_op_left' | '$unary_right' | '$unary_left'
##'                     | '$binary_right' | '$binary_left';
##' }
##' \bold{Example:}\preformatted{
##' E: ident op ident;
##' ident: '[a-z]+';
##' op: '*' $binary_op_left 2 |
##'     '+' $binary_op_left 1;
##' }
##'
##' \itemize{\item Rule Priorities}
##' Rule priorities specify the priority of the reduction itself and have the possible associativies:
##'\preformatted{
##' rule_assoc: '$right' | '$left';
##'}
##'
##' Rule and operator priorities can be intermixed and are interpreted
##' at run time (not when the tables are built).  This make it
##' possible for user-defined scanners to return the associativities
##' and priorities of tokens.
##'
##' }
##' \item{Actions: }{
##' Actions are the bits of code which run when a reduction occurs.
##' Example
##' \preformatted{
##'  S: this | that;
##'  this: 'this' \{ printf("got this\n"); \};
##'  that: 'that' \{ printf("got that\n"); \};
##' }
##' \itemize{\item Speculative Action}
##'
##'   Speculative actions occur when the reduction takes place during
##'   the speculative parsing process.  It is possible that the
##'   reduction will not be part of the final parse or that it will
##'   occur a different number of times.  For example:
##'
##' \preformatted{
##' S: this | that;
##' this: hi 'mom';
##' that: ho 'dad';
##' ho: 'hello' [ printf("ho\n"); ];
##' hi: 'hello' [ printf("hi\n"); ];
##' }
##'
##' Will print both 'hi' and 'ho' when given the input 'hello dad' because at the time hello is reduced, the following token is not known.
##'
##' \itemize{\item Final Actions}
##'
##'   Final actions occur only when the reduction must be part of any
##'   legal final parse (committed).  It is possible to do final
##'   actions during parsing or delay them till the entire parse tree
##'   is constructed (see Options).  Final actions are executed in
##'   order and in number according the the single final unambiguous
##'   parse.
##'
##' \preformatted{
##'  S: A S 'b' | 'x';
##'  A: [ printf("speculative e-reduce A\n"); ]
##'     \{ printf("final e-reduce A\n"); \};
##' }
##'    On input:
##' \preformatted{
##'  xbbb
##' }
##'    Will produce:
##' \preformatted{
##'  speculative e-reduce A
##'  final e-reduce A
##'  final e-reduce A
##'  final e-reduce A
##' }
##'
##' \itemize{\item Embedded Actions}
##'
##'   Actions can be embedded into rule. These actions are executed as
##'   if they were replaced with a synthetic production with a single
##'   null rule containing the actions.  For example:
##'
##' \preformatted{
##'  S: A \{ printf("X"); \} B;
##'  A: 'a' \{ printf("a"); \};
##'  B: 'b' \{ printf("b"); \};
##' }
##'   On input:
##'\preformatted{
##' ab
##' }
##'
##'    Will produce:
##' \preformatted{
##'  aXb
##' }
##'  Note that in the above example, the print("X") is evaluated in a context null rule context while in:
##' \preformatted{
##'  S: A (A B \{ printf("X"); \}) B;
##' }
##'
##' The print is evalated in the context of the "A B" subrule because
##' it appears at the end of the subrule and is therefor treated as a
##' normal action for the subrule.
##'
##' \itemize{\item Pass Actions}
##'
##' DParser supports multiple pass compilation.  The passes are
##' declared at the top of the grammar, and the actions are associated
##' with individual rules.
##'
##' \bold{Example;}
##' \preformatted{
##'  $\{pass sym for_all postorder\}
##'  $\{pass gen for_all postorder\}
##'
##'  translation_unit: statement*;
##'
##'  statement
##'    : expression ';' \{
##'      d_pass($\{parser\}, &$n, $\{pass sym\});
##'      d_pass($\{parser\}, &$n, $\{pass gen\});
##'    \}
##'    ;
##'
##'  expression :  integer
##'    gen: \{ printf("gen integer\n"); \}
##'    sym: \{ printf("sym integer\n"); \}
##'    | expression '+' expression $right 2
##'    sym: \{ printf("sym +\n"); \}
##'    ;
##' }
##'
##' A pass name then a colon indicate that the following action is
##' associated with a particular pass. Passes can be either for_all or
##' for_undefined (which means that the automatic traversal only
##' applies to rules without actions defined for this pass).
##' Furthermore, passes can be postorder, preorder, and manual (you
##' have to call d_pass yourself).  Passes can be initiated in the
##' final action of any rule.
##'
##' \itemize{\item Default Actions}
##'
##'   The special production "_" can be defined with a single rule
##'   whose actions become the default when no other action is
##'   specified.  Default actions can be specified for speculative,
##'   final and pass actions and apply to each separately.
##'
##' \bold{Example}
##' \preformatted{
##'  _: \{ printf("final action"); \}
##'      gen: \{ printf("default gen action"); \}
##'      sym: \{ printf("default sym action"); \}
##'      ;
##' }
##'}
##' \item{Attributes and Action Specifiers}{
##'
##' Each of the language parser can have some global atrributes and actions associated with each part of the parsed code.
##'
##' \itemize{\item  Global State ($g)}
##'
##'   Global state is declared by define'ing D_ParseNode_Globals (see the ANSI C grammar for a similar declaration for symbols). Global state can be accessed in any action with $g.  Because DParser handles ambiguous parsing global state can be accessed on different speculative parses.  In the future automatic splitting of global state may be implemented (if there is demand). Currently, the global state can be copied and assigned to $g to ensure that the changes made only effect subsequent speculative parses derived from the particular parse.
##'
##'   \bold{Example}
##' \preformatted{
##'   [ $g = copy_globals($g);
##'   $g->my_variable = 1;
##'   ]
##' }
##'   The symbol table (see below) can be used to manage state information safely for different speculative parses.
##'
##' \itemize{\item Parse Node State}
##'
##'   Each parse node includes a set of system state variables and can have a set of user-defined state variables.  User defined parse node state is declared by define'ing D_ParseNodeUser. The size of the parse node state must be passed into new_D_Parser() to ensure that the appropriate amount of space is allocated for parse nodes.   Parse node state is accessed with:
##'
##'   \describe{
##'     \item{$# }{number of child nodes}
##'     \item{$$ }{user parse node state for parent node (non-terminal defined by the production)}
##'     \item{$X (where X is a number) }{the user parse node state of element X of the production}
##'     \item{$n }{the system parse node state of the rule node}
##'     \item{$nX }{the system parse node state of element X of the production}
##'   }
##'
##'   The system parse node state is defined in dparse.h which is installed with DParser.  It contains such information as the symbol, the location of the parsed string, and pointers to the start and end of the parsed string.
##'
##' \itemize{\item Misc}
##'
##' \describe{
##'   \item{$\{scope\} }{the current symbol table scope}
##'   \item{$\{reject\} }{in speculative actions permits the current parse to be rejected}
##' }
##' }
##' \item{Symbol Table}{
##'
##'   The symbol table can be updated down different speculative paths while sharing the bulk of the data.  It defines the following functions in the file (dsymtab.h):
##'   \preformatted{
##'   struct D_Scope *new_D_Scope(struct D_Scope *st);
##'   struct D_Scope *enter_D_Scope(struct D_Scope *current, struct D_Scope *scope);
##'   D_Sym *NEW_D_SYM(struct D_Scope *st, char *name, char *end);
##'   D_Sym *find_D_Sym(struct D_Scope *st, char *name, char *end);
##'   D_Sym *UPDATE_D_SYM(struct D_Scope *st, D_Sym *sym);
##'   D_Sym *current_D_Sym(struct D_Scope *st, D_Sym *sym);
##'   D_Sym *find_D_Sym_in_Scope(struct D_Scope *st, char *name, char *end);
##'   }
##'   'new_D_Scope' creates a new scope below 'st' or NULL for a 'top level'
##'   scope.  'enter_D_Scope' returns to a previous scoping level.  NOTE: do
##'   not simply assign $\{scope\} to a previous scope as any updated symbol
##'   information will be lost.  'commit_D_Scope' can be used in final
##'   actions to compress the update list for the top level scope and
##'   improve efficiency.
##'
##'   'find_D_Sym' finds the most current version of a symbol in a given
##'   scope.  'UPDATE_D_SYM' updates the value of symbol (creates a
##'   difference record on the current speculative parse path).
##'   'current_D_Sym' is used to retrive the current version of a symbol,
##'   the pointer to which may have been stored in some other attribute or
##'   variable.  Symbols with the same name should not be created in the
##'   same scope.  The function 'find_D_Sym_in_Scope' is provided to detect
##'   this case.
##'
##'   User data can be attached to symbols by \bold{define}'ing \bold{D_UserSym}.  See the ANSI C grammar for an example.
##'
##'   Here is a full example of scope usage (from tests/g29.test.g):
##'   \preformatted{
##'
##'   #include <stdio.h>
##'
##'   typedef struct My_Sym \{
##'     int value;
##'   \} My_Sym;
##'   #define D_UserSym My_Sym
##'   typedef struct My_ParseNode \{
##'     int value;
##'     struct D_Scope *scope;
##'   \} My_ParseNode;
##'   #define D_ParseNode_User My_ParseNode
##' \}
##'
##' ranslation_unit: statement*;
##'
##' tatement
##' : expression ';'
##' \{ printf("%d\n", $0.value); \}
##' | '\{' new_scope statement* '\}'
##' [ $\{scope\} = enter_D_Scope($\{scope\}, $n0.scope); ]
##' \{ $\{scope\} = commit_D_Scope($\{scope\}); \}
##' ;
##'
##' ew_scope: [ $\{scope\} = new_D_Scope($\{scope\}); ];
##'
##' xpression
##' : identifier ':' expression
##' [
##' _Sym *s;
##' f (find_D_Sym_in_Scope($\{scope\}, $n0.start_loc.s, $n0.end))
##' rintf("duplicate identifier line %d\n", $n0.start_loc.line);
##'  = NEW_D_SYM($\{scope\}, $n0.start_loc.s, $n0.end);
##' ->user.value = $2.value;
##' $.value = s->user.value;
##' ]
##' | identifier '=' expression
##' [ D_Sym *s = find_D_Sym($\{scope\}, $n0.start_loc.s, $n0.end);
##'  = UPDATE_D_SYM($\{scope\}, s);
##' ->user.value = $2.value;
##' $.value = s->user.value;
##' ]
##' | integer
##' [ $$.value = atoi($n0.start_loc.s); ]
##' | identifier
##' [ D_Sym *s = find_D_Sym($\{scope\}, $n0.start_loc.s, $n0.end);
##' f (s)
##' $.value = s->user.value;
##' ]
##' | expression '+' expression
##' [ $$.value = $0.value + $1.value; ]
##' ;
##'
##' nteger: "-?([0-9]|0(x|X))[0-9]*(u|U|b|B|w|W|L|l)*" $term -1;
##' dentifier: "[a-zA-Z_][a-zA-Z_0-9]*";
##' }}
##' \item{Whitespace}{
##'
##'    Whitespace can be specified two ways: C function which can be
##'    user-defined, or as a subgrammar.  The default whitespace parser is
##'    compatible with C/C++ #line directives and comments.  It can be
##'    replaced with any user specified function as a parsing option (see
##'    Options).
##'
##'    Additionally, if the (optionally) reserved production \bold{whitespace} is
##'    defined, the subgrammar it defines will be used to consume whitespace
##'    for the main grammar.  This subgrammar can include normal actions.
##'
##'  \bold{Example}
##' \preformatted{
##' : 'a' 'b' 'c';
##' hitespace: "[ \t\n]*";
##' }
##'
##'    Whitespace can be accessed on a per parse node basis using the
##' unctions: \bold{d_ws_before} and \bold{d_ws_after}, which return the
##' tart of the whitespace before start_loc.s and after end respectively.
##'
##' } \item{Ambiguities}{
##'
##'    Ambiguities are resolved automatically based on priorities and
##'    associativities.  In addition, when the other resolution techniques
##'    fail, user defined ambiguity resolution is possible.  The default
##'    ambiguity handler produces a fatal error on an unresolved ambiguity.
##'    This behavior can be replaced with a user defined resolvers the
##'    signature of which is provided in dparse.h.
##'
##'    If the \bold{verbose_level} flag is set, the default ambiguity
##' andler will print out parenthesized versions of the ambiguous parse
##' rees.  This may be of some assistence in disambiguating a grammar.
##' }
##' \item{Error Recovery}{
##'
##'    DParser implements an error recovery scheme appropriate to scannerless parsers.  I haven't had time to investigate all the prior work in this area, so I am not sure if it is novel.  Suffice for now that it is optional and works well with C/C++ like grammars.
##'  }
##'  \item{Parsing Options}{
##'    Parser are instantiated with the function new_D_Parser.  The
##'    resulting data structure contains a number of user configurable
##'    options (see dparser.h).  These are provided reasonable default
##'    values and include:
##'    \itemize{
##'      \item \bold{initial_globals} - the initial global variables accessable through $g
##'      \item \bold{initial_skip_space_fn} - the initial whitespace function
##'      \item \bold{initial_scope} - the initial symbol table scope
##'      \item \bold{syntax_error_fn} - the function called on a syntax error
##'      \item \bold{ambiguity_fn} - the function called on an unresolved ambiguity
##'      \item \bold{loc} - the initial location (set on an error).
##'    }
##'    In addtion, there are the following user configurables:
##'    \itemize{
##'      \item \bold{sizeof_user_parse_node} - the sizeof D_ParseNodeUser
##'      \item \bold{save_parse_tree} - whether or not the parse tree should be save once the final actions have been executed
##'      \item \bold{dont_fixup_internal_productions} - to not convert the Kleene star into a variable number of children from a tree of reductions
##'      \item \bold{dont_merge_epsilon_trees} - to not automatically remove ambiguities which result from trees of epsilon reductions without actions
##'      \item \bold{dont_use_greediness_for_disambiguation} - do not use the rule that the longest parse which reduces to the same token should be used to disambiguate parses.  This rule is used to handle the case (if then else?) relatively cleanly.
##'      \item \bold{dont_use_height_for_disambiguation} - do not use the rule that the least deep parse which reduces to the same token should be used to disabiguate parses.  This rule is used to handle recursive grammars relatiively cleanly.
##'      \item \bold{dont_compare_stacks} - disables comparing stacks to handle certain exponential cases during ambiguous operator priority resolution.
##'      \item \bold{commit_actions_interval} - how often to commit final actions (0 is immediate, MAXINT is essentially not till the end of parsing)
##'      \item \bold{error_recovery} - whether or not to use error recovery (defaults ON)
##'    }
##'    An the following result values:
##'    \itemize{
##'      \item \bold{syntax_errors} - how many syntax errors (if \bold{error_recovery} was
##'      on)
##'    }
##'    This final value should be checked to see if parse was successful.
##'
##' }
##'
##' }
