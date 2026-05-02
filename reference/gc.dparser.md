# Garbage collection for dpaser functions

This will delete the dynamically created dll upon garbage collection.

## Usage

``` r
gc.dparser(env)
```

## Arguments

- env:

  Environment that is being garbage collected.

## Value

Nothing.

## Garbage collection

There are two user options that control if the dlls for the grammars
created by dparser will be deleted upon garbage collection or R exit if
they are not associated with any active objects. These are:

- `dpaser.rm.unnamed.parser.dll`::

  when `TRUE`, this remove parsers that are created from strings, or
  other memory-based items in R.

- `dpaser.rm.unnamed.parser.dll`::

  when `TRUE`, this removes parsers created from grammar files.

## Author

Matthew L. Fidler
