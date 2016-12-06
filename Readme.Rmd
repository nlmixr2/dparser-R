[![Build Status](https://travis-ci.org/mattfidler/dparser-R.svg?branch=master)](https://travis-ci.org/mattfidler/dparser-R)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/mattfidler/dparser-R?branch=master&svg=true)](https://ci.appveyor.com/project/mattfidler/dparser-R)
[![codecov.io](https://codecov.io/github/mattfidler/dparser-R/coverage.svg?branch=master)](https://codecov.io/github/mattfidler/dparser-R?branch=master)
[![CRAN version](http://www.r-pkg.org/badges/version/dparser)](https://cran.r-project.org/package=dparser)

## Installing dparser R package (Adapted from Rik Schoemaker's instructions for nlmixr)
### Windows Pre-requisites
Rtools is required to supply the compiler for packages like dparser in
which R code is converted to C. Rtools34.exe (version 3.3.x and later)
can be downloaded from
http://cran.r-project.org/bin/windows/Rtools/. Install by
double-clicking the file and following the prompts. Select the default
items , and make sure the toolset is installed in C:\Rtools: do not
rename the directory to something else, and remove the 32 bit
toolchain option (so keep "R toolset", "Cygwin DLLs", and "R 3.3.x+ 64
bit toolchain").

During the installation process, in the "Select additional tasks"
window, check the box for "Edit the system path: Current value:", and
ensure the path contains the following items:
```
C:\Rtools\bin;
C:\Rtools\mingw_64\bin;
```
Then install your preferred R package in the 64 bit version if not yet
installed (e.g. download microsoft-r-open-3.3.1.msi, from
http://mran.revolutionanalytics.com/download/, and install R by
double-clicking microsoft-r-open-3.3.1.msi. Do not install the 32 bit
version of R so make sure you uncheck the 32-bit option! Ensure that
your path points to the R-installation directory, e.g.:

```
C:\Program Files\Microsoft\MRO-3.3.1\bin\x64\
```
or
```
C:\Program Files\R\R-3.3.1\bin\x64\
```
### Mac Pre-requisites

Rtools is not available on OS X, and is replaced By Xcode and the
command line tools, so first install Xcode 8.1 and the command line
tools, then install devtools:

### Installing dparser

```
install.packages("devtools")
devtools::install_github("mattfidler/dparser")
```

### Differences between the R dparser port and the C-version of dparser

There are a few differences between the R dparser port and the standard dparser:
- The R version uses R memory managment instead of C's memory managment i.e. `malloc`
- The R version is never called from the command line, so all command line interface is removed `arg.c`
- The R version doesn't exit from the command (killing R), but errors out in R.
- All outputs are using R's output interface instead of printing to `stdout`, or `stderr`.
- Some convience functions are added to translate (and maybe parse) grammers within R.
