#' Split a string at linebreaks.
#'
#' Return a list of the lines in the string, breaking at line boundaries.
#'
#' Line breaks are not included in the resulting list unless \code{keepends} is
#' \code{TRUE}. Line breaks include \code{"\n"}, \code{"\r"}, and \code{"\r\n"}.
#'
#' @param str A string.
#' @param keepends \code{TRUE} or \code{FALSE}
#'
#' @return A character vector.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.splitlines}
#'
#' @seealso \code{\link{pystr_split}}
#'
#' @examples
#' pystr_splitlines("First\nSecond\rThird\r\n")
#' pystr_splitlines("First\nSecond\rThird\r\n", TRUE)
#'
#' @export
pystr_splitlines <- function(str, keepends=FALSE) {
  linebreaks = c("\r\n", "\r", "\n")
  splits = c()
  remaining = str

  repeat {
    if(remaining == "") {
      return(splits)
    }

    idx = sapply(linebreaks, function(x) pystr_find(remaining, x))

    if(all(idx < 0)) {
      return(c(splits, remaining))
    }

    idx = idx[sapply(idx, function(x) x > 0)]

    if(!is.na(idx["\r\n"]) && idx["\r\n"] == min(idx)) {
      parts = pystr_partition(remaining, "\r\n")
    } else {
      parts = pystr_partition(remaining, names(sort(idx)[1]))
    }

    if(keepends) {
      splits = c(splits, paste0(parts[1], parts[2]))
    } else {
      splits = c(splits, parts[1])
    }

    remaining = parts[3]
  }
}
