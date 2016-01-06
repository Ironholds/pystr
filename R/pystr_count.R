#' Count the occurrences of a substring.
#'
#' Return the number of non-overlapping occurrences of substring \code{sub} in the range \code{start, end}.
#'
#' @param str A character vector.
#' @param sub A character string.
#' @param start An integer.
#' @param end An integer.
#'
#' @return A numeric vector.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.count}
#'
#' @examples
#' pystr_count("ababab", "aba")
#' pystr_count("abcxyzabc123", "abc")
#' pystr_count("a--b--c", "--", 4)
#' pystr_count(c("one", "two", "three"), "e")
#'
#' @export
pystr_count <- function(str, sub, start=1, end=max(nchar(str))) {
  return(pystr_count_(str, sub, start - 1, end - 1))
}
