# dparser

- This release adds an additional header file to support multiple
  grammars in the same package (needed for upcoming `nonmem2rx`)
  
- This package has a binary linkage to `rxode2parse`, and
  `rxode2parse` will be submitted right after this is accepted
  
- Adding this new version of `rxode2parse` will break `rxode2` on
  CRAN.  The following packages will be updated to support a new
  version of `rxode2`: `rxode2et` and `rxode2random`. 
  
- `nlmixr2est` has a binary linkage to `rxode2` and will also be
  updated.
