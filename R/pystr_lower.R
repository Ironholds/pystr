#' Lowercase a string.
#'
#' Return a copy of the string with all the cased characters converted to lowercase.
#'
#' @param str A string.
#'
#' @return A string.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.lower}
#'
#' @seealso \code{\link{pystr_upper}}
#'
#' @examples
#' pystr_lower("LOWERCASE ME!")
#'
#' @export
pystr_lower <- function(str) {
  return(tolower(str))
}
