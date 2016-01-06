#' Check if a string is lowercase.
#'
#' Return \code{TRUE} if all cased characters in the string are lowercase and there is at least one
#' cased character, \code{FALSE} otherwise.
#'
#' @param str A character vector.
#'
#' @return A logical vector.
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
