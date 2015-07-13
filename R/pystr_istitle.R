#' Check if a string is titlecase.
#'
#' Return \code{TRUE} if the string is a titlecased string and there is at least one
#' character, for example uppercase characters may only follow uncased characters and lowercase
#' characters only cased ones. Return \code{FALSE} otherwise.
#'
#' @param str A string.
#'
#' @return \code{TRUE} or \code{FALSE}
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.istitle}
#'
#' @examples
#' pystr_istitle("I Am A Title")
#' pystr_istitle("I Am not A Title")
#'
#' @export
pystr_istitle <- function(str) {
  return(str == pystr_title(str))
}
