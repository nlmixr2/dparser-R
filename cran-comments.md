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

Changed to:

> system(cmd, ignore.stdout=FALSE, ignore.stderr=FALSE)

instead of

> do.call("system" list(cmd, ignore.stdout=TRUE, ignore.stderr=TRUE))

Checked on Fedora with rhub:

https://builder.r-hub.io/status/dparser_1.3.1-2.tar.gz-879de5fd2f8e422bb003fb11fde5f3e4

