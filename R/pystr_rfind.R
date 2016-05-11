#' Find the highest index of a substring.
#'
#' Return the higest index in the string where substring \code{sub} is found,
#' such that \code{sub} is contained in the slice \code{substr(str, start, end)}.
#'
#' @param str A character vector.
#' @param sub A character vector.
#' @param start A numeric vector.
#' @param end A numeric vector.
#'
#' @return A numeric vector. \code{-1} indicates \code{sub} was not found.
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
  return(mapply(pystr_rfind_, str, sub, start, end, USE.NAMES=FALSE))
}

pystr_rfind_ <- function(str, sub, start, end) {
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
