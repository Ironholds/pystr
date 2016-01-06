#' Right justify a string.
#'
#' Return \code{str} right justified in a string of length \code{width}.
#' Padding is done using the specified \code{fillchar} (default is an ASCII space).
#' The original string is returned if \code{width} is less than or equal to \code{nchar(str)}.
#'
#' @param str A character vector.
#' @param width An integer.
#' @param fillchar A character string.
#'
#' @return A character vector.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.rjust}
#'
#' @seealso \code{\link{pystr_ljust}}
#'
#' @examples
#' pystr_rjust("right", 10)
#' pystr_rjust("right", 10, "*")
#'
#' @export
pystr_rjust <- function(str, width, fillchar=" ") {
  return(vapply(str, function(x) pystr_rjust_(x, width, fillchar=fillchar), character(1), USE.NAMES = FALSE))
}

pystr_rjust_ <- function(str, width, fillchar) {
  if(width <= nchar(str)) {
    return(str)
  }

  return(paste0(paste(rep(fillchar, width - nchar(str)), collapse=""), str))
}
