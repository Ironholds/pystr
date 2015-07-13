#' Check if a string is uppercase.
#'
#' Return \code{TRUE} if all cased characters in the string are uppercase and there is at
#' least one cased character, \code{FALSE} otherwise.
#'
#' @param str A string.
#'
#' @return \code{TRUE} or \code{FALSE}
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.isupper}
#'
#' @seealso \code{\link{pystr_islower}}
#'
#' @examples
#' pystr_islower("ALL UPPERCASE!")
#' pystr_islower("All Uppercase?")
#' pystr_islower("ABC123")
#'
#' @export
pystr_isupper <- function(str) {
  cased = 0

  for(i in 1:nchar(str)) {
    letter = substr(str, i, i)

    if(pystr_isalpha(letter)) {
      cased = cased + 1
      if(!(letter == toupper(letter))) {
        return(FALSE)
      }
    }
  }

  return(cased > 0)
}
