#' Center a string.
#'
#' Return \code{str} centered in a string of length \code{width}.
#'
#' @details Padding is done using the specified \code{fillchar} (default is an ASCII space).
#' The original string is returned if \code{width} is less than or equal to \code{nchar(str)}.
#'
#' @param str A character vector.
#' @param width An integer.
#' @param fillchar A character string.
#'
#' @return A character vector.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.center}
#'
#' @seealso \code{\link{pystr_ljust}}, \code{\link{pystr_rjust}}
#'
#' @examples
#' pystr_center("center me", 15)
#' pystr_center("center me", 15, "*")
#'
#' @export
pystr_center <- function(str, width, fillchar=" ") {
  return(pystr_center_(str, width, fillchar))
}
