#' Find the lowest index of a substring.
#'
#' Like \code{\link{pystr_find}} but raises an error if \code{sub} is not found.
#'
#' @param str A character vector.
#' @param sub A character string.
#' @param start An integer.
#' @param end An integer.
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
  return(vapply(str, function(x) pystr_index_(x, sub, start=start, end=end), numeric(1), USE.NAMES = FALSE))
}

pystr_index_ <- function(str, sub, start, end) {
  idx = pystr_find(str, sub)

  if(idx < 0) {
    stop("ValueError")
  }

  return(idx)
}
