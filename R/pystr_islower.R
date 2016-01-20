#' Check if a string is lowercase.
#'
#' Return \code{TRUE} if all cased characters in the string are lowercase and there is at least one
#' cased character, \code{FALSE} otherwise.
#'
#' @param str A string or vector of strings.
#'
#' @return \code{TRUE} or \code{FALSE}, or \code{NA} in the case that the input
#' is \code{NA}.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.islower}
#'
#' @seealso \code{\link{pystr_isupper}}
#'
#' @examples
#' pystr_islower("all lowercase!")
#' pystr_islower("All Lowercase?")
#' pystr_islower("abc123")
#'
#' @export
pystr_islower <- function(str) {
  return(pystr_islower_(str))
}
