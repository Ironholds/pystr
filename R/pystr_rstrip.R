#' Right strip a string.
#'
#' Return a copy of the string with trailing characters removed.
#'
#' The \code{chars} argument is a string specifying the set of characters to be removed.
#' If omitted, the \code{chars} argument defaults to removing whitespace. The \code{chars} argument
#' is not a suffix; rather, all combinations of its values are stripped.
#'
#' @param str A string.
#' @param chars A string.
#'
#' @return A string.
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
  stripped = str
  chars = strsplit(chars, "")[[1]]

  for(i in nchar(str):1) {
    letter = substr(str, i, i)

    if(letter %in% chars) {
      stripped = substr(stripped, 1, nchar(stripped) - 1)
    } else {
      break
    }
  }

  return(stripped)
}
