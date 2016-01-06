#' Right strip a string.
#'
#' Return a copy of the string with trailing characters removed.
#'
#' The \code{chars} argument is a string specifying the set of characters to be removed.
#' If omitted, the \code{chars} argument defaults to removing whitespace. The \code{chars} argument
#' is not a suffix; rather, all combinations of its values are stripped.
#'
#' @param str A character vector.
#' @param chars A character string.
#'
#' @return A character vector.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.rstrip}
#'
#' @seealso \code{\link{pystr_lstrip}}
#'
#' @examples
#' pystr_rstrip("    spacious     ")
#' pystr_rstrip("www.example.com", ".omc")
#'
#' @export
pystr_rstrip <- function(str, chars = " ") {
  return( pystr_rstrip_(str,chars) )
}
