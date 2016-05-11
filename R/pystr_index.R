#' Find the lowest index of a substring.
#'
#' Like \code{\link{pystr_find}} but raises an error if \code{sub} is not found.
#'
#' @param str A character vector.
#' @param sub A character vector.
#' @param start A numeric vector.
#' @param end A numeric vector.
#'
#' @return A numeric vector.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.index}
#'
#' @seealso \code{\link{pystr_rindex}}
#'
#' @examples
#' pystr_index("abcxyzabc", "abc")
#' pystr_index("abcxyzabc", "abc", 4)
#' \dontrun{
#' pystr_index("abcxyzabc", "123")
#' }
#'
#' @export
pystr_index <- function(str, sub, start=1, end=nchar(str)) {
  return(mapply(pystr_index_, str, sub, start, end, USE.NAMES=FALSE))
}

pystr_index_ <- function(str, sub, start, end) {
  idx = pystr_find(str, sub, start, end)

  if(idx < 0) {
    stop("ValueError")
  }

  return(idx)
}
