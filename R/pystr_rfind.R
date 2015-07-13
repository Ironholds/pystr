#' Find the highest index of a substring.
#'
#' Return the higest index in the string where substring \code{sub} is found,
#' such that \code{sub} is contained in the slice \code{substr(str, start, end)}.
#'
#' @param str A string.
#' @param sub A string.
#' @param start An integer.
#' @param end An integer.
#'
#' @return An integer. Returns \code{-1} if \code{sub} is not found.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.rfind}
#'
#' @seealso \code{\link{pystr_find}}
#'
#' @examples
#' pystr_rfind("abcdxyzabc", "abc")
#' pystr_rfind("abc", "xy")
#' pystr_rfind("abcxyzabc", "abc", 4)
#'
#' @export
pystr_rfind <- function(str, sub, start=1, end=nchar(str)) {
  string_to_check = substr(str, start, end)

  for(i in nchar(string_to_check):1) {
    start_check = i - nchar(sub) + 1
    end_check = i
    letters_to_check = substr(string_to_check, start_check, end_check)

    if(letters_to_check == sub) {
      return(start_check + start - 1)
    }
  }

  return(-1)
}
