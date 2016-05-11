#' Find the highest index of a substring.
#'
#' Like \code{\link{pystr_rfind}} but raises an error if \code{sub} is not found.
#'
#' @param str A character vector.
#' @param sub A character vector.
#' @param start A numeric vector.
#' @param end A numeric vector.
#'
#' @return A numeric vector.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.rindex}
#'
#' @seealso \code{\link{pystr_index}}
#'
#' @examples
#' pystr_rindex("abcxyzabc", "abc")
#' pystr_rindex("12121212", "12", 4, 6)
#' \dontrun{
#' pystr_rindex("abcxyzabc", "123")
#' }
#'
#' @export
pystr_rindex <- function(str, sub, start=1, end=nchar(str)) {
  return(mapply(pystr_rindex_, str, sub, start, end, USE.NAMES=FALSE))
}

pystr_rindex_ <- function(str, sub, start, end) {
  idx = pystr_rfind(str, sub, start, end)

  if(any(idx < 0)) {
    stop("ValueError")
  }

  return(idx)
}
