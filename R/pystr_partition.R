#' Partition a string.
#'
#' Split the string at the first occurrence of \code{sep}, and return a list of character vectors containing the part
#' before the separator, the separator itself, and the part after the separator.
#'
#' If the separator is not found, return a character vector containing the string itself, followed by two empty strings.
#'
#' @param str A character vector.
#' @param sep A character string.
#'
#' @return A list of character vectors.
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
  return(mapply(pystr_partition_, str, sep, SIMPLIFY=FALSE, USE.NAMES=FALSE))
}
pystr_partition_ <- function(str, sep) {
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
