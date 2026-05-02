# Get file for dparser arguments

Get file for dparser arguments

## Usage

``` r
dpGetFile(file, fileext = "", envir = parent.frame(1))
```

## Arguments

- file:

  \- File to handle. This file can be:

  - an actual file.

  - a character string. In this case, a temporary file is created with
    the character string.

  - A bracket [`{}`](https://rdrr.io/r/base/Paren.html) enclosed R
    expression. In this case the contents of the expressions is put into
    a temporary file.

  - A function. In this case the contents of the function body are put
    into the temporary file.

- fileext:

  file extension of temporary file to create

- envir:

  Environment to deparse variables

## Value

a list of three elements:

- `file`:

  The file name of either the temporary file or the real file

- `use_file_name`:

  If the file name was used (`TRUE`), or a temporary file was
  created(`FALSE`)

- `md5`:

  md5 of the model

## Author

Matthew L. Fidler
