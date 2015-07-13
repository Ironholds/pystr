#' Partition a string from the right.
#'
#' Split the string at the last occurrence of \code{sep}, and return a character vector containing the part before the separator,
#' the separator itself, and the part after the separator.
#'
#' If the separator is not found, return a character vector containing two empty strings, followed by the string itself.
#'
#' @param str A string.
#' @param sep A string.
#'
#' @return A character vector.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.rpartition}
#'
#' @seealso \code{\link{pystr_partition}}
#'
#' @examples
#' pystr_rpartition("onetwothreeonetwothree", "two")
#'
#' @export
pystr_rpartition <- function(str, sep) {
  if(sep == "") {
    stop("Empty separator.")
  }

  idx = pystr_rfind(str, sep)

  if(idx == -1) {
    return(c("", "", str))
  }

  before = substr(str, 1, idx - 1)
  after = substr(str, idx + nchar(sep), nchar(str))
  return(c(before, sep, after))
}
