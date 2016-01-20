#' Check if a string is uppercase.
#'
#' Return \code{TRUE} if all cased characters in the string are uppercase and there is at
#' least one cased character, \code{FALSE} otherwise.
#'
#' @param str A string or vector of strings.
#'
#' @return \code{TRUE} or \code{FALSE}, or \code{NA} in the case that the input
#' is \code{NA}.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.isupper}
#'
#' @seealso \code{\link{pystr_islower}}
#'
#' @examples
#' pystr_islower("ALL UPPERCASE!")
#' pystr_islower("All Uppercase?")
#' pystr_islower("ABC123")
#'
#' @export
pystr_isupper <- function(str) {
  return(pystr_isupper_(str))
}
