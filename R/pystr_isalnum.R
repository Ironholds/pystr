#' Check if a string is alphanumeric.
#'
#' Return \code{TRUE} if all characters in the string are alphanumeric and there is at
#' least one character, \code{FALSE} otherwise.
#'
#' @param str A character vector.
#'
#' @return A logical vector.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.isalnum}
#'
#' @seealso \code{\link{pystr_isalpha}}, \code{\link{pystr_isnumeric}}
#'
#' @examples
#' pystr_isalnum("abc")
#' pystr_isalnum("abc123")
#' pystr_isalnum("abc123!")
#' pystr_isalnum(c("one", "2", "three!"))
#'
#' @export
pystr_isalnum <- function(str) {
  return(pystr_isalnum_(str))
}
