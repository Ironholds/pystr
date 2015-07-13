#' Capitalize a string.
#'
#' Return a copy of the string with its first character capitalized and the rest lowercased.
#'
#' @param str A string.
#'
#' @return A string.
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
  return(paste0(toupper(substr(str, 1, 1)), tolower(substr(str, 2, nchar(str)))))
}
