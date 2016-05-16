#' Check the prefix of a string.
#'
#' Return \code{TRUE} if the string \code{str} starts with the specified
#' \code{prefix}, otherwise return \code{FALSE}.
#'
#' @details
#' With optional \code{start}, test string beginning at that position.
#' With optional \code{end}, stop comparing string at that position.
#'
#' @param str A character vector.
#' @param prefix A character vector.
#' @param start A numeric vector.
#' @param end A numeric vector.
#'
#' @return A logical vector.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.startswith}
#'
#' @seealso \code{\link{pystr_endswith}}
#'
#' @examples
#' pystr_startswith("www.example.com", "www.")
#' pystr_startswith("example.com", "www.")
#' pystr_startswith("www.example.com", "example", 5)
#'
#' @export
pystr_startswith <- function(str, prefix, start=1, end=nchar(str)) {
  return(pystr_startswith_(str, prefix, start, end))
}
