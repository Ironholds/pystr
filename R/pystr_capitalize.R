#' Capitalize a string.
#'
#' Return a copy of the string with its first character capitalized and the rest lowercased.
#'
#' @param str A character vector.
#'
#' @return A character vector.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.capitalize}
#'
#' @seealso \code{\link{pystr_title}}
#'
#' @examples
#' pystr_capitalize("ONCE UPON A TIME, ")
#'
#' @export
pystr_capitalize <- function(str) {
  return(pystr_capitalize_(str))
}
