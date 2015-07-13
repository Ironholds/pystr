#' Check if a string is alphanumeric.
#'
#' Return \code{TRUE} if all characters in the string are alphanumeric and there is at
#' least one character, \code{FALSE} otherwise.
#'
#' @param str A string.
#'
#' @return \code{TRUE} or \code{FALSE}.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.isalnum}
#'
#' @seealso \code{\link{pystr_isalpha}}, \code{\link{pystr_isnumeric}}
#'
#' @examples
#' pystr_isalnum("abc")
#' pystr_isalnum("abc123")
#' pystr_isalnum("abc123!")
#'
#' @export
pystr_isalnum <- function(str) {
  for(i in 1:nchar(str)) {
    letter = substr(str, i, i)
    if(!(pystr_isalpha(letter) || pystr_isnumeric(letter))) {
      return(FALSE)
    }
  }

  return(TRUE)
}
