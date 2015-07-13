#' Check if a string is lowercase.
#'
#' Return \code{TRUE} if all cased characters in the string are lowercase and there is at least one
#' cased character, \code{FALSE} otherwise.
#'
#' @param str A string.
#'
#' @return \code{TRUE} or \code{FALSE}
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
  cased = 0

  for(i in 1:nchar(str)) {
    letter = substr(str, i, i)

    if(pystr_isalpha(letter)) {
      cased = cased + 1
      if(!(letter == tolower(letter))) {
        return(FALSE)
      }
    }
  }

  return(cased > 0)
}
