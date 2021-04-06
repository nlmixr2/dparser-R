# Comments

> Please see the problems shown on
> <https://cran.r-project.org/web/checks/check_results_dparser.html>.
> 
> Please correct before 2021-04-20 to safely retain your package on CRAN.
> 
> The CRAN Team
> 
>
> 
> This seems to be from a problem with making the DSO but, bizarrely, you have
>
>     sh <- "system";
>     do.call(sh,list(cmd,ignore.stdout=TRUE,ignore.stderr=TRUE));
>
>that is
>
>system(cmd, ignore.stdout=TRUE, ignore.stderr=TRUE)
>
>thereby suppressing all the diagnostics and not checking the status and
>continuing if it fails.  So we will never know.


# Revision

With dparser 1.3.1-3, I used (as suggested):

> system(cmd, ignore.stdout=FALSE, ignore.stderr=FALSE)

instead of

> do.call("system" list(cmd, ignore.stdout=TRUE, ignore.stderr=TRUE))

In the cran system this gives the following error:

```sh
 gcc -I"/data/gannet/ripley/R/R-devel/include" -DNDEBUG -I"/data/gannet/ripley/R/packages/tests-devel/dparser.Rcheck/dparser/include" -I/usr/local/include -fpic -g -O2 -Wall -pedantic -mtune=native -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong -fstack-clash-protection -fcf-protection -Werror=implicit-function-declaration -c sample_parser.c -o sample_parser.o
  gcc -I"/data/gannet/ripley/R/R-devel/include" -DNDEBUG -I"/data/gannet/ripley/R/packages/tests-devel/dparser.Rcheck/dparser/include" -I/usr/local/include -fpic -g -O2 -Wall -pedantic -mtune=native -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong -fstack-clash-protection -fcf-protection -Werror=implicit-function-declaration -c g1.test.g.d_parser.c -o g1.test.g.d_parser.o
  /data/gannet/ripley/R/packages/tests-devel/dparser.Rcheck/tests/testthat/g1.test.g: In function ‘d_speculative_reduction_code_2_3_gram’:
  /data/gannet/ripley/R/packages/tests-devel/dparser.Rcheck/tests/testthat/g1.test.g:5:124: error: implicit declaration of function ‘Rprintf’; did you mean ‘dprintf’? [-Werror=implicit-function-declaration]
      5 | A: [ Rprintf("speculative e-reduce A\n"); ]
        | ^
        | dprintf
  cc1: some warnings being treated as errors
  make[1]: *** [/data/gannet/ripley/R/R-devel/etc/Makeconf:168: g1.test.g.d_parser.o] Error 1
  make[1]: Target 'all' not remade because of errors.
  make[1]: Leaving directory '/data/gannet/ripley/R/packages/tests-devel/dparser.Rcheck/tests/testthat'
  ══ Failed tests ════════════════════════════════════════════════════════════════
  ── Error (test-dparser.R:44:5): (code run outside of `test_that()`) ────────────
  Error: unable to load shared object '/data/gannet/ripley/R/packages/tests-devel/dparser.Rcheck/tests/testthat/sample_parser.so':
    /data/gannet/ripley/R/packages/tests-devel/dparser.Rcheck/tests/testthat/sample_parser.so: cannot open shared object file: No such file or directory
  Backtrace:
      █
   1. └─base::dyn.load(parser) test-dparser.R:44:4
```


This means that the R headers are not explicitly included in the
grammar.  The fix explicitly includes the grammars (checked by hand),
so the error in Fedora will no longer occur.

Also checked on rhub fedora (which didn't show the CRAN error), and it
still check successfully:

https://builder.r-hub.io/status/dparser_1.3.1-4.tar.gz-5e56bd55e8014567829a74aef47bef8e
