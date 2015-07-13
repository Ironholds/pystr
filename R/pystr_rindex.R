#' Find the highest index of a substring.
#'
#' Like \code{\link{pystr_rfind}} but raises an error if \code{sub} is not found.
#'
#' @param str A string.
#' @param sub A string.
#'
#' @return An integer.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.rindex}
#'
#' @seealso \code{\link{pystr_index}}
#'
#' @examples
#' pystr_rindex("abcxyzabc", "abc")
#' \dontrun{
#' pystr_rindex("abcxyzabc", "123")
#' }
#'
#' @export
pystr_rindex <- function(str, sub) {
  idx = pystr_rfind(str, sub)

  if(idx < 0) {
    stop("ValueError")
  }

  return(idx)
}
