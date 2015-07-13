#' Uppercase a string.
#'
#' Return a copy of the string with all the cased characters converted to uppercase.
#'
#' @param str A string.
#'
#' @return A string.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.upper}
#'
#' @seealso \code{\link{pystr_lower}}
#'
#' @examples
#' pystr_upper("uppercase me!")
#'
#' @export
pystr_upper <- function(str) {
  return(toupper(str))
}
