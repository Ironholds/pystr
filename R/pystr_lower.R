#' Lowercase a string.
#'
#' Return a copy of the string with all the cased characters converted to lowercase.
#'
#' @param str A character vector.
#'
#' @return A character vector.
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
  return(vapply(str, tolower, character(1), USE.NAMES = FALSE))
}
