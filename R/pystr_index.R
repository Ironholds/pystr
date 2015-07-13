#' Find the lowest index of a substring.
#'
#' Like \code{\link{pystr_find}} but raises an error if \code{sub} is not found.
#'
#' @param str A string.
#' @param sub A string.
#'
#' @return An integer.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.index}
#'
#' @seealso \code{\link{pystr_rindex}}
#'
#' @examples
#' pystr_index("abcxyzabc", "abc")
#' \dontrun{
#' pystr_index("abcxyzabc", "123")
#' }
#'
#' @export
pystr_index <- function(str, sub) {
  idx = pystr_find(str, sub)

  if(idx < 0) {
    stop("ValueError")
  }

  return(idx)
}
