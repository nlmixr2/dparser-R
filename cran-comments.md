# sprintf

This package submission is to save CRAN maintainers overall time.

This fixes the `sprintf` issues that will show up with a M1 mac (once that check is run).

These errors are shown with the new significant warning that appeared
in `rxode2`, saying that `sprintf` cannot be used.

See:

https://www.stats.ox.ac.uk/pub/bdr/M1mac/rxode2.out

The fix to this issue is in `rxode2parse`, but before submitting
`rxode2parse`, I checked this binary dependency, which also has
`sprintf`.

I decided to take all `sprintf` statements out of this package first.
That way I can reduce the number of submissions to CRAN, saving the CRAN
maintainers overall time.

This submission is the first, the next are:

- `rxode2parse` 
- `rxode2`
- `nlmixr2est`

In this revision, I have changed `rxode2` so that it isn't a binary
dependency of `rxode2parse` (removed `ABI`)

Thank you for all you do!
