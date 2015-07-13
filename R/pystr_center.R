#' Center a string.
#'
#' Return \code{str} centered in a string of length \code{width}.
#'
#' @details Padding is done using the specified \code{fillchar} (default is an ASCII space).
#' The original string is returned if \code{width} is less than or equal to \code{nchar(str)}.
#'
#' @param str A string.
#' @param width An integer.
#' @param fillchar A character.
#'
#' @return A string.
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
  if(width <= nchar(str)) {
    return(str)
  }

  spaces_to_fill = width - nchar(str)

  rightsize = ceiling(spaces_to_fill / 2)
  leftsize = spaces_to_fill - rightsize

  rightfill = paste0(rep(fillchar, rightsize), collapse="")
  leftfill = paste0(rep(fillchar, leftsize), collapse="")

  return(paste0(leftfill, str, rightfill))
}
