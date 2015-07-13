#' Count the occurrences of a substring.
#'
#' Return the number of non-overlapping occurrences of substring \code{sub} in the range \code{start, end}.
#'
#' @param str A string.
#' @param sub A string.
#' @param start An integer.
#' @param end An integer.
#'
#' @return An integer.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.count}
#'
#' @examples
#' pystr_count("ababab", "aba")
#' pystr_count("abcxyzabc123", "abc")
#' pystr_count("a--b--c", "--", 4)
#'
#' @export
pystr_count <- function(str, sub, start=1, end=nchar(str)) {
  if(sub == "") {
    return(end - start + 2)
  }

  string_to_check = substr(str, start, end)
  count = 0

  repeat {
    idx = pystr_find(string_to_check, sub)
    if(idx < 0) {break}
    string_to_check = substr(string_to_check, idx + nchar(sub), nchar(string_to_check))
    count = count + 1
  }

  return(count)
}
