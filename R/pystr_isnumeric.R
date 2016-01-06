#' Check if a string is numeric.
#'
#' Return \code{TRUE} if all characters in the string are numeric characters, and there is at least one
#' character, \code{FALSE} otherwise.
#'
#' @param str A character vector.
#'
#' @return A logical vector.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.isnumeric}
#'
#' @seealso \code{\link{pystr_isalpha}}, \code{\link{pystr_isalnum}}
#'
#' @examples
#' pystr_isnumeric("123")
#' pystr_isnumeric("123a")
#' pystr_isnumeric("123!")
#'
#' @export
pystr_isnumeric <- function(str) {
  return(pystr_isnumeric_(str))
}
