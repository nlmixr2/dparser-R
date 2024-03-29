if (!file.exists(devtools::package_file("src/dparser"))){
  owd <- getwd();
  setwd(devtools::package_file("src"));
  system("git clone https://github.com/mattfidler/dparser")
  setwd(owd);
}
missingFns <- c("finalize_productions", # acutally missing
                "d_warn",
                "d_fail",
                "stack_push_internal",
                "set_add_fn" ## Remove this because of void* problems with CRAN warnings
                );
globalIntVars <- c("d_use_r_headers",
                   "d_rdebug_grammar_level",
                   "d_use_file_name",
                   "d_verbose_level",
                   "d_debug_level");
globalCharVars <- c("d_file_name");
if (file.exists(devtools::package_file("src/dparser"))) {
  owd <- getwd();
  setwd(devtools::package_file("src/dparser"));
  build <- gsub("([^ ]*) .*","\\1",system("git show-ref heads/main",intern=TRUE));
  setwd(owd);
  cat(sprintf("dparser build %s\n", build));
  for (f in c("dparse.h", "dparse_tables.h", "dsymtab.h", "gram.h", "gramgram.h", "lex.h",
              "lr.h", "mkdparse.h", "parse.h", "read_binary.h", "scan.h", "util.h", "write_tables.h",
              "gram.c", "grammar.g.c", "lex.c", "lex.h", "lr.c", "mkdparse.c", "scan.c", "dsymtab.c",
              "util.c", "write_tables.c", "d.h", "read_binary.c", "parse.c", "version.c")){
    cat(sprintf("\tf: %s\n", f));
    unlink(devtools::package_file("src/", f));
    d <- readLines(devtools::package_file("src/dparser/", f));
    reg.assert <- rex::rex("assert(",capture(anything), ")")
    w <- which(regexpr(reg.assert, d) != -1);
    if (length(w) > 0){
      d[w] <- gsub(reg.assert, "if (!(\\1)){error(\"Error parsing: assert(\\1).\");}", d[w]);
    }
    w <- which(regexpr("d_version(ver);", d, fixed=TRUE) != -1);
    if (length(w) > 0) {
      for (wc in w) {
        if (regexpr("fprintf", d[wc + 1]) != -1) {
          d[wc] <- gsub("(.*fprintf[(][^,]+),.*", "if (d_use_r_headers) {\n\\1, \"#include <R.h>\\\\n#include <Rinternals.h>\\\\n#define printf Rprintf\\\\n\\\\n\");}\nd_version(ver);", d[wc + 1])
        }
      }
    }
    if (any(f == c("gram.h", "lex.h", "lr.h", "parse.h", "read_binary.h", "scan.h", "util.h", "write_tables.h"))){
      ## Fix headers to work with C++
      d[1] <- sprintf('#if defined(__cplusplus)\nextern "C" {\n#endif\n%s', d[1]);
      d[length(d)] <- sprintf('%s\n#if defined(__cplusplus)\n}\n#endif\n', d[length(d)]);
      if (f == "gram.h"){
        ## Fix add_pass_code to be on one line.
        w <- which(regexpr("void add_pass_code", d) != -1);
        d[w] <- sprintf("%s %s", d[w], gsub("^[ \t]*", "", d[w + 1]));
        d <- d[-(w + 1)];
      }
    }
    if (f == "d.h"){
      ## w <- which(regexpr('#define (REALLOC|MALLOC|FREE|CALLOC)', d) != -1);
      ## d <- d[-w];
      w <- which(regexpr('#include "arg.h"', d) != -1);
      d[w] <- ""
      ## d <- d[-w];
      w <- which(regexpr('#include <string.h>', d) != -1)
      ver  <- readLines(devtools::package_file("src/dparser/Makefile"));
      major <- gsub("^ *MAJOR *= *", "", ver[which(regexpr("^ *MAJOR *=", ver) != -1)]);
      minor <- gsub("^ *MINOR *= *", "", ver[which(regexpr("^ *MINOR *=", ver) != -1)]);
      d <- c(d[1:w], "#include <R.h>", "#include <Rinternals.h>",
             sprintf("#define D_MAJOR_VERSION %s", major),
             sprintf("#define D_MINOR_VERSION %s", minor),
             sprintf('#define D_BUILD_VERSION "R-%s"', build),
             d[seq(1 + w, length(d))]);
    }
    ## d <- gsub("REALLOC", "R_chk_realloc", d);
    ## d <- gsub("MALLOC[(]", "R_chk_calloc(1,", d);
    ## d <- gsub("CALLOC[(]", "R_chk_calloc(1,", d);
    ## d <- gsub("FREE", "Free", d);
    d <- gsub("([ \t])printf[(]", "\\1Rprintf(", d);
    if (f == "parse.c") {
      w <- which(regexpr("^static void *syntax_error_report_fn", d) != -1);
      if (regexpr("^[ \t]*$", d[w - 1]) != -1){
        d[w - 1] <- "\nchar * d_file_name;\n int  d_use_file_name = 0;\n"
        while(regexpr("^[ \t]*ZNode [*]z", d[w]) == -1){
          w <- w + 1;
        }
        d[w] <- sprintf("%s\n  if (d_use_file_name){\n    fn = d_dup_pathname_str(d_file_name);\n }\n", d[w]);
        w <- which(regexpr(" *char +[*]fn *=", d) != -1)[1]
        d[w] <- " char *fn = NULL;"
      } else {
        stop("something is wrong.")
      }
      d <- gsub("fprintf[(]stderr[ \t]*,", "Rprintf(", d);

    }
    d <- gsub("DBG[(]printf[(]", "DBG(Rprintf(", d)
    if (f == "write_tables.c"){
      w  <- which(regexpr('#include "dparse_tables.h"', d, fixed=TRUE) != -1);
      d <- c(d[1:w], "int d_use_r_headers = 0;", d[seq(w + 1, length(d))]);
      w <- which(regexpr("^get_offset[(]", d) != -1) + 1;
      print(d[w]);
      d[w] <- paste0(d[w], "\n  (void)n; // Suppress warning...");
      print(d[w]);
    }
    if (f == "util.c"){
      w <- which(regexpr("^void *d_warn *[(]", d) != -1);
      w2 <- w + 1;
      while (regexpr("}", d[w2]) == -1){
        w2 <- w2 + 1;
      }
      d  <- c(d[seq(1, w - 1)],
              'void d_warn(const char *str, ...) {
  char nstr[256];
  char outstr[256*2];
  va_list ap;
  va_start(ap, str);
  snprintf(nstr, 255, "%s", str);
  vsprintf(outstr, nstr, ap);
  va_end(ap);
  warning(outstr);
}',
d[seq(w2 + 1, length(d))]);
      w <- which(regexpr("^void *d_fail *[(] *const +char", d) != -1);
      w2 <- w + 1;
      while (regexpr("}", d[w2]) == -1){
        w2 <- w2 + 1;
      }
      d  <- c(d[seq(1, w - 1)],
              'void d_fail(const char *str, ...) {
  char nstr[256];
  char outstr[256*2];
  va_list ap;
  va_start(ap, str);
  snprintf(nstr, 255, "Parser Fail: %s", str);
  vsprintf(outstr, nstr, ap);
  va_end(ap);
  error(outstr);
}',
d[seq(w2 + 1, length(d))]);
    }
    writeLines(d, devtools::package_file("src/", f))
  }
}
id <- rex::rex(one_of("_", "a":"z", "A":"Z"), any_of("_", "a":"z", "A":"Z", "0":"9"));
fnRex <- rex::rex(start, any_spaces, capture(id), spaces,
                  capture(any_of("*")), any_spaces, capture(id), any_spaces,
                  one_of("("), capture(except_any_of(")")), one_of(")"), any_spaces, one_of(";"));
commentRex <- rex::rex(or(group("/*", anything, "*/"), group("//", anything, end)));
comSep <- rex::rex(any_spaces, ",", any_spaces);
argRex <- rex::rex(start, any_spaces, capture(except_some_of("*")), spaces, capture(any_of("*")),
                   any_spaces, capture(id));
fns <- c();
calls <- c();
dparser <- "SEXP dparse_sexp(SEXP sexp_fileName, SEXP sexp_start_state, SEXP sexp_save_parse_tree, SEXP sexp_partial_parses, SEXP sexp_compare_stacks, SEXP sexp_commit_actions_interval, SEXP sexp_fixup, SEXP sexp_fixup_ebnf, SEXP sexp_nogreedy, SEXP sexp_noheight, SEXP sexp_use_filename, SEXP sexp_sizeof_parse_node, SEXP sexp_verbose, SEXP sexp_children_first, SEXP fn, SEXP skip_fn, SEXP env, D_ParserTables pt);\n"
headers <- c("dparse.h", "dparse_tables.h", "dsymtab.h", "gram.h", "gramgram.h", "lex.h",
             "lr.h", "mkdparse.h", "parse.h", "read_binary.h", "scan.h", "util.h", "write_tables.h");
defs <- c();
for (f in c("dparse.h", "dparse_tables.h", "dsymtab.h", "gram.h", "gramgram.h", "lex.h",
            "lr.h", "mkdparse.h", "parse.h", "read_binary.h", "scan.h", "util.h", "write_tables.h", "")){
  if (f == ""){
    txt <- c(sprintf("void set_%s(int x);", globalIntVars),
             sprintf("int get_%s();", globalIntVars),
             sprintf("void set_%s(char *x);", globalCharVars),
             dparser);
  } else {
    txt <- suppressWarnings({readLines(devtools::package_file(sprintf("src/%s", f)))});
  }
  ## print(txt);
  txt <- gsub(commentRex, "", txt[regexpr(fnRex, txt, perl=TRUE) != -1]);
  for (txti in txt){
    fnType <- gsub(fnRex, "\\1", txti, perl=TRUE);
    stars <- gsub(fnRex, "\\2", txti, perl=TRUE);
    fnName <- gsub("\n", "", gsub(fnRex, "\\3", txti, perl=TRUE));
    if (fnName == "d_free"){
      fnArg <- "void *x";
    } else {
      fnArg <- gsub(fnRex, "\\4", txti, perl=TRUE);
    }
    if (!any(fnName == missingFns)){
      if (f != ""){
        defs <- c(defs, txti);
      }
      argsTot <- strsplit(fnArg, comSep)[[1]];
      args <- gsub(argRex, "\\1\\2", argsTot, perl=TRUE);
      arge <- gsub(argRex, "\\3", argsTot, perl=TRUE);
      fn <- gsub("[(][*][)][(][)]","(*)(void)",
                 gsub("[(][*]fun[)][(][)]",
                 "(*fun)(void)",
                 sprintf("%s %s%s(%s){\n  static %s %s(*fun)(%s)=NULL;\n  if (fun == NULL) fun = (%s%s (*)(%s)) R_GetCCallable(\"dparser\",\"%s\");\n  %sfun(%s);\n}\n",
                    fnType, stars, fnName, fnArg,
                    fnType, stars, paste(args, collapse=", "),
                    fnType, stars, paste(args, collapse=", "),
                    fnName,
                    ifelse(regexpr("void", fnType) != -1,"", "return "),
                    paste(arge, collapse=", "))))
      fns <- c(fns, fn);
      call <- sprintf("  R_RegisterCCallable(\"dparser\",\"%s\",(DL_FUNC) %s);\n", fnName, fnName);
      calls <- c(call, calls);
    }
  }
}
fns <- sprintf("/*
Header file for using internal C-level dparser functions in dparser-R (generated).
*/
#ifndef __dparser_H__
#define __dparser_H__
#include <R.h>
#include <Rinternals.h>
#include <Rdefines.h>
#include <Rconfig.h>
#include <R_ext/Rdynload.h>
#include \"gramgram.h\"
#include \"d.h\"
#include \"mkdparse.h\"
#include \"dparse.h\"
#include \"read_binary.h\"
#if defined(__cplusplus)
extern \"C\" {
#endif
%s
void
d_fail(const char *str, ...) {
  char nstr[256];
  char outstr[256*2];
  va_list ap;
  va_start(ap, str);
  snprintf(nstr, 255, \"Parser Fail: %%s\", str);
  vsprintf(outstr, nstr, ap);
  va_end(ap);
  error(outstr);
}

void
d_warn(const char *str, ...) {
  char nstr[256];
  char outstr[256*2];
  va_list ap;
  va_start(ap, str);
  snprintf(nstr, 255, \"%%s\", str);
  vsprintf(outstr, nstr, ap);
  va_end(ap);
  warning(outstr);
}

#if defined(__cplusplus)
}
#endif
#endif\n", paste(fns, collapse="\n"));
sink(devtools::package_file("src/dparser.h"));
cat(fns);
sink();
cat(sprintf("\tf: dparser.h\n"));
sink(devtools::package_file("src/dparser.c"));
cat(sprintf("/*
Register C callables to R.
*/
#include <R.h>
#include <Rinternals.h>
#include <Rdefines.h>
#include <Rconfig.h>
#include <R_ext/Rdynload.h>
#include \"d.h\"
%s
%s
%s
%s

SEXP cDparser(SEXP fileName, SEXP sexp_output_file, SEXP set_op_priority_from_rule , SEXP right_recursive_BNF , SEXP states_for_whitespace , SEXP states_for_all_nterms , SEXP tokenizer , SEXP longest_match , SEXP sexp_grammar_ident , SEXP scanner_blocks , SEXP write_line_directives , SEXP rdebug, SEXP verbose, SEXP sexp_write_extension, SEXP write_header, SEXP token_type, SEXP use_r_header);


void __freeP();

void R_init_dparser(DllInfo *info){
  R_CallMethodDef callMethods[]  = {
    {\"cDparser\", (DL_FUNC) &cDparser, 17},
    {NULL, NULL, 0}
  };
  R_registerRoutines(info, NULL, callMethods, NULL, NULL);
  R_useDynamicSymbols(info, FALSE);
  R_RegisterCCallable(\"dparser\",\"__freeP\",(DL_FUNC) __freeP);
%s}

void R_unload_dparser() {
  __freeP();
}

",dparser, paste(sprintf("extern int %s;\nvoid set_%s(int x){\n  %s = x;\n}\nint get_%s(){\n return %s;\n}\n", globalIntVars, globalIntVars, globalIntVars, globalIntVars, globalIntVars), collapse="\n"),
paste(sprintf("extern char * %s;\nvoid set_%s(char *x){\n  %s=x;\n}\n", globalCharVars, globalCharVars, globalCharVars), collapse="\n"),
paste(defs, collapse="\n"),paste(calls, collapse="")));
sink();
cat(sprintf("\tf: dparser.c\n"))
dtest <- devtools::package_file("src/dparser/tests");
ttest <- devtools::package_file("tests/testthat");
for (f in list.files(dtest,"[.]g", full.names=TRUE)){
  if (!grepl("g50", f)) {
    cat(sprintf("\tf: %s\n", f));
    writeLines(gsub("printf[(]", "Rprintf(", readLines(f)), file.path(ttest, gsub(".*src/dparser/tests", "", f)))
  }
}
sink(devtools::package_file("R/version.R"))
cat("##\' Version and repository for this dparser package.
##\'
##\' @return A character vector with the version and repository.
##\' @author Matthew L. Fidler
##\' @keywords internal
##\' @export
dpVersion <- function(){return(c(version=\"");
ver <- readLines(devtools::package_file("DESCRIPTION"));
ver <- ver[regexpr("Version:", ver) != -1];
ver <- ver[1];
cat(gsub("Version: +", "", ver))
cat("\",build=\"");
cat(build);
cat("\",repo=\"");
cat("https://github.com/")
tmp <- readLines(devtools::package_file(".git/config"))
cat(gsub("\\.git$", "", gsub(".*git@github.com:", "", tmp[which(tmp == '[remote "origin"]')[1]+1])))
cat("\"))}\n");
sink();
sink(devtools::package_file("R/Rparse.R"))
tmp <- gsub("\"", "\\\\\"", readLines(devtools::package_file("build/Rparse.c")));
cat("##\' C code for R parser
##\'
##\' @return A string for generating C tree walker
##\' @author Matthew L. Fidler
##\' @keywords internal
##\' @export
dpRparse <- function(){return(\"")
cat(paste(tmp, collapse="\\n"));
cat("\\n\");}\n");
sink();
cat("Update README\n");
owd <- getwd();
on.exit({setwd(owd)});
setwd(devtools::package_file());
## knitr::knit(devtools::package_file("README.Rmd"))
devtools::load_all();
devtools::document();

