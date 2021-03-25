##' A Scannerless GLR parser/parser generator
##'
##' This package is based on the C dparser
##' https://github.com/jplevyak/dparser
##'
##' DParser is an simple but powerful tool for parsing.  You can
##' specify the form of the text to be parsed using a combination of
##' regular expressions and grammar productions.  Because of the
##' parsing technique (technically a scannerless GLR parser based on
##' the Tomita algorithm) there are no restrictions.  The grammar can
##' be ambiguous, right or left recursive, have any number of null
##' productions, and because there is no separate tokenizer, can
##' include whitespace in terminals and have terminals which are
##' prefixes of other terminals.  DParser handles not just well formed
##' computer languages and data files, but just about any wacky
##' situation that occurs in the real world.
##'
##' @section Features:
##'
##' \itemize{
##' \item Powerful GLR parsing
##' \item Simple EBNF-style grammars and regular expression terminals
##' \item Priorities and associativities for token and rules
##' \item Built-in error recovery
##' \item Speculative actions (for semantic disambiguation)
##' \item Auto-building of parse tree (optionally)
##' \item Final actions as you go, or on the complete parse tree
##' \item Tree walkers and default actions (multi-pass compilation support)
##' \item Symbol table built for ambiguous parsing
##' \item Partial parses, recursive parsing, parsing starting with any non-terminal
##' \item Whitespace can be specified as a subgrammar
##' \item External (C call interface) tokenizers and external terminal scanners
##' \item Good asymptotically efficiency
##' \item Comes with ANSI-C, Python and Verilog grammars
##' \item Comes with full source
##' \item Portable C for easy compilation and linking
##' \item BSD license, so you can included it in your application without worrying about licensing
##' }
##'
##' The result is natural grammars and powerful parsing.
##'
##' The R based tree parsing in \code{\link{dparse}} creates dlls on
##' the fly based on C code. By default the echoing of the compile is
##' disabled, but you can change this by
##' \code{options(dparser.echo.compile=FALSE)}
##'
##' @template garbage
##'
##' @template grammar
##' @useDynLib dparser, .registration=TRUE
##' @importFrom methods new
##' @importFrom utils assignInMyNamespace
"_PACKAGE"
.onLoad <- function(libname, pkgname){ ## nocov start
    op.dparser <- list(dpaser.rm.named.parser.dll=FALSE,
                       dpaser.rm.unnamed.parser.dll=TRUE,
                       dparser.echo.compile=FALSE)
    op <- options();
    w <- !(names(op.dparser) %in% names(op))
    if (any(w)) options(op.dparser[w]);
} ## nocov end

refresh <- function(){ # nocov start
    source(devtools::package_file("build/refresh.R"))
} # nocov end

##' Make a dparser c file based on a grammer
##'
##' Uses a grammer file to create a c file for parsing.
##'
##'  mkdparser is a scannerless GLR parser generator based on the
##'  Tomita algorithm. It is self-hosted and very easy to
##'  use. Grammars are written in a natural style of EBNF and regular
##'  expressions and support both speculative and final actions.
##'
##' @title mkdparse dparser grammer c
##'
##' @param file File name of grammer to parse.
##'
##' @param outputFile Output file name.  Can be a directory.  If so,
##'     the file name is determined by the input file.
##'
##' @param set_op_priority_from_rule Toggle setting of operator
##'     priority from rules.  Setting of operator priorities on
##'     operator tokens can increase the size of the tables but can
##'     permit unnecessary parse stacks to be pruned earlier. (FALSE
##'     by default)
##'
##' @param right_recursive_BNF Toggle use of right recursion for EBNF
##'     productions.  Do not change this unless you really know what
##'     you are doing. (FALSE by default)
##'
##' @param states_for_whitespace Toggle computing whitespace states.
##'     If 'whitespace' is defined in the grammar, then use it as a
##'     subparser to consume whitespace. (TRUE by default)
##'
##' @param states_for_all_nterms Toggle computing states for all
##'     non-terminals.  Ensures that there is a unique state for each
##'     non-terminal so that a subparsers can be invoked for that
##'     non-terminal. (FALSE by default)
##'
##' @param tokenizer Toggle building of a tokenizer for START.  When
##'     TRUE, instead of generating a unique scanner for each state
##'     (i.e. a 'scannerless' parser), generate a single scanner
##'     (tokenizer) for the entire grammar.  This provides an easy way
##'     to build grammars for languages which assume a tokenizer
##'     (e.g. ANSI C). (FALSE by default)
##'
##' @param token_type Token type "#define" or "enum"
##'
##' @param longest_match Toggle longest match lexical ambiguity
##'     resolution.  When TRUE the scanner only recognizing the
##'     longest matching tokens in a given state. This provides an
##'     easy way to build grammars for languages which use longest
##'     match lexical ambiguity resolution (e.g. ANSI-C, C++). (FALSE
##'     by default)
##'
##' @param grammar_ident Tag for grammar data structures so that
##'     multiple sets of tables can be included in one
##'     file/application. (defaults to 'gram')
##'
##' @param ident_from_filename Build the grammer tag from the
##'     file-name.
##'
##' @param scanner_blocks Number of blocks to which scanner tables are
##'     broken up into. Larger numbers permit more sharing with more
##'     overhead.  4 seems to be optimal for most grammars. (defaults
##'     to 4) files.
##'
##' @param write_line_directives Toggle writing of line numbers.  Used
##'     to debug the parsing table generator itself. (TRUE by default)
##'
##' @param write_header Write header, FALSE : no, TRUE : yes,
##'     "IfEmpty" : only if not empty.
##'
##' @param rdebug Replace all actions in the grammar with actions
##'     printing productions, 1 : during the speculative parsing
##'     process (<-), 2 : when reduction is part of any legal final
##'     parse (<=), 3 : both, 4 : remove all actions from the grammar.
##'     Print the changed grammar to console.  Useful for debugging or
##'     prototyping new, experimental grammars.
##'
##' @param verbose Increase verbosity.
##'
##' @param write_extension Set the extension of the generated code
##'     file.  For C++ programs (for example) the extension can be set
##'     to .cpp with the option \code{write_extension="cpp"}.
##'     (\code{write_extension="c"} by default)
##'
##' @param use_r_header when TRUE, add R headers and swap printf for
##'     Rprintf. By default this is TRUE.
##'
##' @template grammar
##'
##' @return Nothing. Outputs files instead.
##'
##' @author Matthew L. Fidler for R interface, John Plevyak for
##'     dparser
##' @examples
##'
##' ## This makes the ANSI c grammar file to parse C code:
##' mkdparse(system.file("ansic.test.g", package = "dparser"),
##'         file.path(tempdir(), "ansic_gram.c"),
##'          grammar_ident="ascii_C")
##' @export
mkdparse <- function(file,outputFile,
                     set_op_priority_from_rule = FALSE,
                     right_recursive_BNF = FALSE,
                     states_for_whitespace = TRUE,
                     states_for_all_nterms = FALSE,
                     tokenizer = FALSE,
                     token_type = c("#define","enum"),
                     longest_match = FALSE,
                     grammar_ident ="gram",
                     ident_from_filename = FALSE,
                     scanner_blocks = 4,
                     write_line_directives = TRUE,
                     write_header = c("IfEmpty",TRUE,FALSE),
                     rdebug = FALSE,
                     verbose = FALSE,
                     write_extension="c",
                     use_r_header = TRUE
                     ){
    file <- gsub("\\\\","/",normalizePath(file))
    if (missing(write_header) || write_header == "IfEmpty"){
        write_header <- -1;
    }
    if (ident_from_filename){
        ## Put ident from the filename
        grammar_ident = (gsub("[.][^.]$","",basename(file)))
    }
    if (missing(outputFile)){
        outputFile <- file.path(dirname(file),paste0(basename(file),".d_parser.",write_extension))
    } else if (dir.exists(outputFile)){
        outputFile <- file.path(outputFile,paste0(basename(file),".d_parser.",write_extension))
    }
    outputFile <- gsub("\\\\","/",suppressWarnings(normalizePath(outputFile)))
    if (missing(token_type)){
        token_type <- 0
    } else if (token_type == "enum"){
        token_type <- 1
    } else {
        token_type <- 0
    }
    .Call(cDparser,
          file,
          outputFile,
          as.integer(set_op_priority_from_rule),
          as.integer(right_recursive_BNF),
          as.integer(states_for_whitespace),
          as.integer(states_for_all_nterms),
          as.integer(tokenizer),
          as.integer(longest_match),
          grammar_ident,
          as.integer(scanner_blocks),
          as.integer(write_line_directives),
          as.integer(rdebug),
          as.integer(verbose),
          write_extension,
          as.integer(write_header),
          as.integer(token_type),
          as.integer(use_r_header),
          PACKAGE="dparser")
    return(invisible())
}

##' Return the include directory
##'
##' The include directory has the headers that may be needed to build
##' functions against the Dparser library.
##'
##' @title Dparser C headers include directory
##' @param ... Additional parameters sent to file.path
##' @return Dparser include directory
##' @author Matthew L. Fidler
##' @keywords internal
##' @export
dpIncludeDir <- function(...){
    incl <- system.file("include", package = "dparser");
    if (file.exists(file.path(incl, "d.h"))){
        return(file.path(incl, ...));
    } else {
        ## nocov start
        incl <- system.file("src", package = "dparser");
        if (file.exists(file.path(incl, "d.h"))){
            return(file.path(incl, ...));
        } else {
            stop("Cannot find d.h in a include directory.  dparser installation may be corrupt.")
        }
        ## nocov end
    }
}

##' A S4 class for dparser functions
##'
##' The data here is the function to be called.
##'
##' @slot env contains the environment where the grammar name and dll
##'     files are stored.
##' @slot .Data is the function data
##'
##'@keywords internal
##'@export
setClass("dparserFunction",
         representation(
             env="environment"),
         contains="function")

##' Print the s4 object
##' @param x dparserFunction to print.
##' @keywords internal
##' @aliases show,dparserFunction-method
setMethod("show", "dparserFunction", function(object){
    cat("An object of class 'dparserFunction'\n");
    dat <- object@.Data;
    print(dat);
    grammar <- object@env$grammar;
    dll.file <- object@env$dll.file;
    cat(sprintf("Grammar File: %s\nDll File: %s\n", grammar, dll.file));
})

gc.items <- c()

##' Garbage collection for dpaser functions
##'
##' This will delete the dynamically created dll upon garbage
##' collection.
##'
##' @template garbage
##'
##' @param env Environment that is being garbage collected.
##' @return Nothing.
##' @author Matthew L. Fidler
##' @keywords internal
##' @export
gc.dparser <- function(env){
    dll.file <- env$dll.file;
    if (!is.na(gc.items[dll.file])){
        if (gc.items[dll.file] > 1){
            tmp <- gc.items;
            tmp[dll.file] <- tmp[dll.file] - 1;
            assignInMyNamespace("gc.items", tmp);
        } else {
            if (file.exists(dll.file)){
                generated <- env$generated;
                if ((generated && getOption("dpaser.rm.unnamed.parser.dll", TRUE)) ||
                    (!generated && getOption("dpaser.rm.named.parser.dll", FALSE))){
                    rc <- try(dyn.unload(dll.file), silent = TRUE);
                    unlink(dll.file)
                }
            }
            tmp <- gc.items;
            tmp <- tmp[names(tmp) != dll.file];
            assignInMyNamespace("gc.items", tmp);
        }
    }

}

##' Get file for dparser arguments
##'
##' @param file - File to handle.  This file can be:
##' \itemize{
##'
##' \item an actual file.
##'
##' \item a character string.  In this case, a temporary file is
##' created with the character string.
##'
##' \item A bracket \code{\{\}} enclosed R expression.  In this case
##' the contents of the expressions is put into a temporary file.
##'
##' \item A function.  In this case the contents of the function body are put into the temporary file.
##'
##' }
##'
##' @param fileext file extension of temporary file to create
##'
##' @param envir Environment to deparse variables
##'
##' @return a list of three elements:
##' \describe{
##'
##' \item{\code{file}}{The file name of either the temporary file or the real file}
##'
##' \item{\code{use_file_name}}{If the file name was used (\code{TRUE}), or a temporary file was created(\code{FALSE})}
##'
##' \item{\code{md5}}{md5 of the model}
##'
##' }
##' @author Matthew L. Fidler
##' @keywords internal
##' @export
dpGetFile <- function(file, fileext="", envir=parent.frame(1)){
    ret <- list(use_file_name=FALSE);
    if (class(substitute(file)) == "call"){
        file <- file;
    }
    if (class(substitute(file)) == "{"){
        file <- deparse(substitute(file))[-1];
        file <- paste(file[-length(file)], collapse="\n");
    } else if (class(file) == "function" || class(file) == "call"){
        file <- body(file);
    } else if (class(file) == "character"){
        if (file.exists(file)){
            ret$use_file_name <- TRUE;
        }
    } else if (class(file) == "name"){
        file <- eval(file, envir=envir);
    } else {
        stop(sprintf("Cant figure out how to handle the file argument (%s).", class(file)));
    }
    if (!ret$use_file_name){
        ret$md5 <- digest::digest(file);
        tmpf <- tempfile(fileext=fileext);
        sink(tmpf);
        cat(file);
        sink();
        ret$file <- tmpf;
    } else {
        ret$md5 <- digest::digest(file, file=TRUE);
        ret$file <- file;
    }
    return(ret);
}


##' Create R-based Dparser tree walking function based on grammar
##'
##' Note R-based dparser tree walking works on Windows (with R tools)
##' Mac, or Linux. Linking to arbitrary c grammars works on any
##' platform.
##'
##' @param grammar Dparser grammar filename (must be a file with a ".g"
##'   extension)
##' @param start_state Start State (default 0)
##' @param save_parse_tree Save Parse Tree (default TRUE)
##' @param partial_parses Partial Parses (default FALSE)
##' @param compare_stacks Compare Stacks (default TRUE)
##' @param commit_actions_interval Commit Interval (default 100)
##' @param fixup Fix-up Internal Productions (default FALSE)
##' @param fixup_ebnf Fixup EBNF Productions (default FALSE)
##' @param nogreedy No Greediness for Disambiguation (default FALSE)
##' @param noheight No Height for Disambiguation (default FALSE)
##' @param use_file_name Use File Name for syntax errors (default
##'     TRUE)
##' @param parse_size Parser size (default 1024)
##' @param verbose_level the level of verbosity when creating parser
##'     (default 0)
##' @param children_first When TRUE, parse the children before the
##'     parent (default TRUE).
##' @param ... Parameters sent to \code{\link{mkdparse}}, with the
##'     exception of \code{use_r_header} which is forced to be
##'     \code{TRUE}.
##'
##' @return A function that allows parsing of a file based on the
##'     grammar supplied. This function would be able to
##'     parse arbitrary grammars the way you may want with your own
##'     user supplied function.
##'
##' @template garbage
##'
##' @seealso \code{\link{mkdparse}}
##' @examples
##' \donttest{
##' ## This creates the R based parsing function.  It requires
##' ## compilation and runs on most OSes, with the exception of solaris.
##' ## Windows requires Rtools to be installed.
##' f <- dparse(system.file("tran.g", package = "dparser"),children_first=FALSE)
##'
##' ## Once created, you may then use this function to parse an
##' ## arbitrary syntax file.  For example:
##' f("
##' b       = -1
##' d/dt(X) = a*X + Y*Z;
##' d/dt(Y) = b*(Y - Z);
##' d/dt(Z) = -X*Y + c*Y - Z
##' if (t < 0.02 | t > 99.98){
##'     print
##' }
##' ", function(name, value, pos, depth){
##'     ## This prints the name, value, position and depth passed to the
##'     ##parsing function.
##'     cat(sprintf("name:%s;value:%s;pos:%s;depth:%s\n", name, value, pos,
##'                  depth));
##' })
##'
##' ## You could use a better R parsing function; You could also use
##' ## this as a starting place for your own C-based parser
##'}
##' @export
dparse <- function(grammar,
                   start_state=0,
                   save_parse_tree=TRUE,
                   partial_parses=FALSE,
                   compare_stacks=TRUE,
                   commit_actions_interval=100,
                   fixup=TRUE,
                   fixup_ebnf=FALSE,
                   nogreedy=FALSE,
                   noheight=FALSE,
                   use_file_name=TRUE,
                   parse_size=1024,
                   verbose_level=0,
                   children_first=TRUE,
                   ...) {
  if (!file.exists(grammar)) {
    stop("'grammar' file doesn't exist")
  }
  grammar <- normalizePath(grammar)
  .oldWd <- getwd()
  setwd(tempdir())
  on.exit(setwd(.oldWd))
  lst <- list(file=grammar,
              use_file_name=TRUE,
              md5=digest::digest(grammar, file=TRUE))
  save_parse_tree <- as.integer(save_parse_tree);
  save_parse_tree <- as.integer(save_parse_tree);
  partial_parses <- as.integer(partial_parses);
  dont_compare_stacks <- as.integer(!compare_stacks);
  notfixup <- as.integer(!fixup);
  fixup_ebnf <- as.integer(fixup_ebnf);
  nogreedy <- as.integer(nogreedy);
  noheight <- as.integer(noheight);
  md5 <- lst$md5;
  gram <- gsub("([^A-Za-z0-9]|[-])", "_", basename(grammar))
  pkg <- sprintf("%s_%s", gram, .Platform$r_arch)
  dll.file <- sprintf("%s_%s%s", gram, .Platform$r_arch, .Platform$dynlib.ext);
  if (file.exists(dll.file)){
    dyn.load(dll.file);
    sym <- getNativeSymbolInfo(sprintf('dparse_%s_digest', gram), PACKAGE=pkg);
    tst.fn <- eval(bquote(function()(.(quote(.Call))(.(sym), PACKAGE=.(pkg)))));
    tst <- tst.fn();
    if (tst != md5){
      dyn.unload(dll.file);
      unlink(dll.file);
    }
  }
  tmpf <- tempfile()
  mkdparse(grammar, tmpf, grammar_ident=gram, ..., use_r_header=TRUE);
  tmp <- readLines(tmpf)
  unlink(tmpf)
  ## could use brew but I prefer minimal dependencies.
  tmp <- gsub("<%=digest%>", md5,
              gsub("<%=pasertables%>", paste(tmp, collapse="\n"),
                   gsub("<%=gram%>", gram, dpRparse())))

  tmpd <- tempfile()
  dir.create(tmpd)
  owd <- getwd()
  setwd(tmpd)
  writeLines(tmp, sprintf("%s_%s.c", gram, .Platform$r_arch))
  writeLines(sprintf("PKG_CFLAGS=-I\"%s\"\n",dpIncludeDir()), "Makevars")
  cmd <- sprintf("%s/bin/R CMD SHLIB %s_%s.c",
                 Sys.getenv("R_HOME"), gram, .Platform$r_arch)
  do.call(system,list(cmd,ignore.stdout=!getOption("dparser.echo.compile", FALSE),
                  ignore.stderr=!getOption("dparser.echo.compile", FALSE)))
  dyn.load(dll.file)
  fun <- eval(bquote(function(file,
                              fn,
                              skip_fn,
                              envir=parent.frame(),
                              ##
                              start_state=.(start_state),
                              save_parse_tree=.(save_parse_tree),
                              partial_parses=.(partial_parses),
                              compare_stacks=.(compare_stacks),
                              commit_actions_interval=.(commit_actions_interval),
                              fixup=.(fixup),
                              fixup_ebnf=.(fixup_ebnf),
                              nogreedy=.(nogreedy),
                              noheight=.(noheight),
                              use_file_name=.(use_file_name),
                              parse_size=.(parse_size),
                              verbose_level=.(verbose_level),
                              children_first=.(children_first)
                              ){
    NULL
  }))
  sym <- getNativeSymbolInfo(sprintf('dparse_%s', gram), PACKAGE=pkg)
  body <- bquote({
    if (missing(skip_fn)){
      skip_fn <- quote(dparser::dpDefaultSkip);
    }
    lst <- dpGetFile(substitute(file), envir=parent.frame(1));
    file <- lst$file;
    start_state         <- as.integer(start_state);
    save_parse_tree     <- as.integer(save_parse_tree);
    save_parse_tree     <- as.integer(save_parse_tree);
    partial_parses      <- as.integer(partial_parses);
    dont_compare_stacks <- as.integer(!compare_stacks);
    notfixup            <- as.integer(!fixup);
    fixup_ebnf          <- as.integer(fixup_ebnf);
    nogreedy            <- as.integer(nogreedy);
    noheight            <- as.integer(noheight);
    if (missing(use_file_name)){
      use_file_name <- as.integer(lst$use_file_name);
    } else {
      use_file_name       <- as.integer(use_file_name);
    }
    if (!lst$use_file_name){
      on.exit(unlink(lst$file));
    }
    .(quote(.Call))(.(sym$address),
      file,
      start_state,
      save_parse_tree,
      partial_parses,
      compare_stacks,
      as.integer(commit_actions_interval),
      fixup,
      fixup_ebnf,
      nogreedy,
      noheight,
      use_file_name,
      as.integer(parse_size),
      as.integer(verbose_level),
      as.integer(children_first),
      fn,
      skip_fn,
      envir);
    return(invisible());
  });
  body(fun) <- body;
  ret <- new("dparserFunction", env=new.env());
  ret@.Data <- fun;
  ret@env$generated <- (!lst$use_file_name);
  ret@env$grammar <- normalizePath(grammar)
  ret@env$dll.file <- normalizePath(dll.file)
  ## Cleanup
  if (any(names(gc.items) == ret@env$dll.file)){
    tmp <- gc.items;
    tmp[ret@env$dll.file] <- tmp[ret@env$dll.file] + 1;
    assignInMyNamespace("gc.items", tmp);
  } else {
    tmp <- gc.items;
    tmp[ret@env$dll.file] <- 1
    assignInMyNamespace("gc.items", tmp);
  }
  reg.finalizer(ret@env, gc.dparser, onexit=TRUE);
  return(ret)
}

##' Default skip function for darsing grammar
##'
##' This function is to determine if children are parsed or skipped.
##' By default, all children are parsed.
##'
##' @param name Production Name
##'
##' @param value Production Value
##'
##' @param pos terminal position.  Negative values are parsed before
##'     children are parsed.  A value of -1 means there are no
##'     children nodes.  A value of -2 means there are children nodes.
##'     Otherwise, the terminal position is numbered starting at 0.
##' @param depth Parsing Depth
##' @return FALSE.  If a comparable function returns TRUE, the
##'     children are not parsed.
##' @author Matthew L. Fidler
##' @export
dpDefaultSkip <- function(name,value,pos,depth){
    return(FALSE)
}
##' Reload the R dparser dll
##'
##' This can be useful if parsing one grammar seems to affect another
##' grammar.
##'
##' @author Matthew L. Fidler
##' @export
dpReload <- function(){
    tmp <- getLoadedDLLs()$dparser
    class(tmp) <- "list";
    dyn.unload(tmp$path);
    ret <- is.null(getLoadedDLLs()$dparser)
    dyn.load(tmp$path);
    ret <- ret && !is.null(getLoadedDLLs()$dparser)
    return(ret)
}
