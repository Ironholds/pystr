#' Left justify a string.
#'
#' Return \code{str} left justified in a string of length \code{width}.
#' Padding is done using the specified \code{fillchar} (default is an ASCII space).
#' The original string is returned if \code{width} is less than or equal to \code{nchar(str)}.
#'
#' @param str A string.
#' @param width An integer.
#' @param fillchar A character.
#'
#' @return A string.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.ljust}
#'
#' @seealso \code{\link{pystr_rjust}}
#'
#' @examples
#' pystr_ljust("left", 10)
#' pystr_ljust("left", 10, "*")
#'
#' @export
pystr_ljust <- function(str, width, fillchar=" ") {
  if(width <= nchar(str)) {
    return(str)
  }

  return(paste0(str, paste(rep(fillchar, width - nchar(str)), collapse="")))
}
