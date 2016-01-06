#' Check if a string is whitespace.
#'
#' Return \code{TRUE} if there are only whitespace characters in the string and there is at least
#' one character, \code{FALSE} otherwise.
#'
#' @param str A character vector.
#'
#' @return A logical vector.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.isspace}
#'
#' @examples
#' pystr_isspace("    ")
#' pystr_isspace("  a ")
#'
#' @export
pystr_isspace <- function(str) {
  return(vapply(str, function(x) pystr_isspace_(x), logical(1), USE.NAMES = FALSE))
}

pystr_isspace_ <- function(str) {
  if(nchar(str) == 0) {return(FALSE)}

  for(i in 1:nchar(str)) {
    letter = substr(str, i, i)
    if(!(letter == " ")) {
      return(FALSE)
    }
  }

  return(TRUE)
}
