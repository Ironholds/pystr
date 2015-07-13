#' Check if a string is numeric.
#'
#' Return \code{TRUE} if all characters in the string are numeric characters, and there is at least one
#' character, \code{FALSE} otherwise.
#'
#' @param str A string.
#'
#' @return \code{TRUE} or \code{FALSE}
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
  for(i in 1:nchar(str)) {
    letter = substr(str, i, i)
    not_a_number = suppressWarnings(is.na(as.numeric(letter)))

    if(not_a_number) {
      return(FALSE)
    }
  }

  return(TRUE)
}
