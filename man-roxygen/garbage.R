##' @section Garbage collection:
##'
##' There are two user options that control if the dlls for the
##' grammars created by dparser will be deleted upon garbage
##' collection or R exit if they are not associated with any active
##' objects.  These are:
##'
##' \describe{
##'
##' \item{\code{dpaser.rm.unnamed.parser.dll}:}{when \code{TRUE}, this remove parsers
##' that are created from strings, or other memory-based items in R.}
##'
##' \item{\code{dpaser.rm.unnamed.parser.dll}:}{when \code{TRUE}, this
##' removes parsers created from grammar files.}
##'
##' }
