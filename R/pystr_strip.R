#' Strip a string.
#'
#' Return a copy of the string with the leading and trailing characters removed.
#'
#' The \code{chars} argument is a string specifying the set of characters to be
#' removed. If omitted, the \code{chars} argument defaults to removing whitespace.
#' The \code{chars} argument is not a prefix or suffix; rather, all combinations
#' of its values are stripped.
#'
#' @param str A character vector.
#' @param chars A character string.
#'
#' @return A character vector.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.strip}
#'
#' @seealso \code{\link{pystr_lstrip}}, \code{\link{pystr_rstrip}}
#'
#' @examples
#' pystr_strip("   very spacious   ")
#' pystr_strip("www.example.com", "cmowz.")
#'
#' @export
pystr_strip <- function(str, chars=" ") {
  stripped = str
  stripped = pystr_lstrip(stripped, chars)
  stripped = pystr_rstrip(stripped, chars)
  return(stripped)
}
