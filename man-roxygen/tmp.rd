##' \item{Attributes and Action Specifiers}{
##' 
##' \itemize{\item  Global State ($g)}
##' 
##'   Global state is declared by define'ing D_ParseNode_Globals (see the ANSI C grammar for a similar declaration for symbols). Global state can be accessed in any action with $g.  Because DParser handles ambiguous parsing global state can be accessed on different speculative parses.  In the future automatic splitting of global state may be implemented (if there is demand). Currently, the global state can be copied and assigned to $g to ensure that the changes made only effect subsequent speculative parses derived from the particular parse.
##' 
##'   \textbf{Example}
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
##'   \description{
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
##' \description{
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
##'   User data can be attached to symbols by \textbf{define}'ing \textbf{D_UserSym}.  See the ANSI C grammar for an example.
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