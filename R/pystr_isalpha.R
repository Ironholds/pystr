#' Check if a string is alphabetic.
#'
#' Return \code{TRUE} if all characters in the string are alphabetic and there is at least one character,
#' \code{FALSE} otherwise.
#'
#' @param str A string.
#'
#' @return \code{TRUE} or \code{FALSE}
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.isalpha}
#'
#' @seealso \code{\link{pystr_isalnum}}, \code{\link{pystr_isnumeric}}
#'
#' @examples
#' pystr_isalpha("abc")
#' pystr_isalpha("abc123")
#' pystr_isalpha("abc!")
#'
#' @export
pystr_isalpha <- function(str) {
  str = tolower(str)

  for(i in 1:nchar(str)) {
    x = substr(str, i, i)
    if(!(x %in% letters)) {
      return(FALSE)
    }
  }

  return(TRUE)
}
