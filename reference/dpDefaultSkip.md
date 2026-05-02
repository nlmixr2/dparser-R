# Default skip function for darsing grammar

This function is to determine if children are parsed or skipped. By
default, all children are parsed.

## Usage

``` r
dpDefaultSkip(name, value, pos, depth)
```

## Arguments

- name:

  Production Name

- value:

  Production Value

- pos:

  terminal position. Negative values are parsed before children are
  parsed. A value of -1 means there are no children nodes. A value of -2
  means there are children nodes. Otherwise, the terminal position is
  numbered starting at 0.

- depth:

  Parsing Depth

## Value

FALSE. If a comparable function returns TRUE, the children are not
parsed.

## Author

Matthew L. Fidler
