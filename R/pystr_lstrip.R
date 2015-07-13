#' Left strip a string.
#'
#' Return a copy of the string with leading characters removed.
#'
#' The \code{chars} argument is a string specifying the set of characters to be removed.
#' If omitted, the \code{chars} argument defaults to removing whitespace.
#' The \code{chars} argument is not a prefix; rather, all combinations of its values are stripped.
#'
#' @param str A string.
#' @param chars A string.
#'
#' @return A string.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.lstrip}
#'
#' @seealso \code{\link{pystr_rstrip}}
#'
#' @examples
#' pystr_lstrip("     spacious    ")
#' pystr_lstrip("www.example.com", "w.")
#'
#' @export
pystr_lstrip <- function(str, chars=" ") {
  stripped = str
  chars = strsplit(chars, "")[[1]]

  for(i in 1:nchar(str)) {
    letter = substr(str, i, i)

    if(letter %in% chars) {
      stripped = substr(stripped, 2, nchar(stripped))
    } else {
      break
    }
  }

  return(stripped)
}
