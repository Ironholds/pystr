#' Partition a string.
#'
#' Split the string at the first occurrence of \code{sep}, and return a character vector containing the part
#' before the separator, the separator itself, and the part after the separator.
#'
#' If the separator is not found, return a character vector containing the string itself, followed by two empty strings.
#'
#' @param str A string.
#' @param sep A string.
#'
#' @return A character vector.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.partition}
#'
#' @seealso \code{\link{pystr_rpartition}}
#'
#' @examples
#' pystr_partition("onetwothreeonetwothree", "two")
#'
#' @export
pystr_partition <- function(str, sep) {
  if(sep == "") {
    stop("Empty separator.")
  }

  idx = pystr_find(str, sep)

  if(idx == -1) {
    return(c(str, "", ""))
  }

  before = substr(str, 1, idx - 1)
  after = substr(str, idx + nchar(sep), nchar(str))
  return(c(before, sep, after))
}
