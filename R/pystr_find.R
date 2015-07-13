#' Find the lowest index of a substring.
#'
#' Return the lowest index in the string where substring \code{sub} is found,
#' such that \code{sub} is contained in the slice \code{substr(str, start, end)}.
#'
#' @param str A string.
#' @param sub A string.
#' @param start An integer.
#' @param end An integer.
#'
#' @return An integer. Returns \code{-1} if \code{sub} is not found.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.find}
#'
#' @seealso \code{\link{pystr_rfind}}
#'
#' @examples
#' pystr_find("abcdxyzabc", "abc")
#' pystr_find("abc", "xy")
#' pystr_find("abcxyzabc", "abc", 4)
#'
#' @export
pystr_find <- function(str, sub, start=1, end=nchar(str)) {
  string_to_check = substr(str, start, end)

  for(i in 1:nchar(string_to_check)) {
    start_check = i
    end_check = i + nchar(sub) - 1
    letters_to_check = substr(string_to_check, start_check, end_check)

    if(letters_to_check == sub) {
      return(start_check + start - 1)
    }
  }

  return(-1)
}
