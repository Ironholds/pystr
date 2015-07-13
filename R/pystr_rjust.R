#' Right justify a string.
#'
#' Return \code{str} right justified in a string of length \code{width}.
#' Padding is done using the specified \code{fillchar} (default is an ASCII space).
#' The original string is returned if \code{width} is less than or equal to \code{nchar(str)}.
#'
#' @param str A string.
#' @param width An integer.
#' @param fillchar A character.
#'
#' @return A string.
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
  if(width <= nchar(str)) {
    return(str)
  }

  return(paste0(paste(rep(fillchar, width - nchar(str)), collapse=""), str))
}
