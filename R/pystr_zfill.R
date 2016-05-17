#' Zero-pad a string.
#'
#' Return a copy of the string left filled with ASCII \code{'0'} digits to make
#' a string of length \code{width}.
#'
#' A leading sign prefix (+/-) is handled by inserting the padding after
#' the sign character rather than before. The original string is returned if
#' \code{width} is less than or equal to \code{nchar(str)}.
#'
#' @param str A character vector.
#' @param width An integer.
#'
#' @return A character vector.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.zfill}
#'
#' @examples
#' pystr_zfill("42", 5)
#' pystr_zfill("-42", 5)
#' pystr_zfill("+42", 5)
#'
#' @export
pystr_zfill <- function(str, width) {
  return(pystr_zfill_(str, width))
}
