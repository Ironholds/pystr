#' Check the suffix of a string.
#'
#' Return \code{TRUE} if the string \code{str} ends with the specified
#' \code{suffix}, otherwise return \code{FALSE}.
#'
#' @details
#' With optional \code{start}, test beginning at that position.
#' With optional \code{end}, stop comparing at that position.
#'
#' @param str A character vector.
#' @param suffix A character vector.
#' @param start A numeric vector.
#' @param end A numeric vector.
#'
#' @return A logical vector.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.endswith}
#'
#' @seealso \code{\link{pystr_startswith}}
#'
#' @examples
#' pystr_endswith("selfie.jpg", ".jpg")
#' pystr_endswith("selfie.jpg", ".png")
#' pystr_endswith("hello world", "ello", 1, 5)
#'
#' @export
pystr_endswith <- function(str, suffix, start=NULL, end=NULL) {
  #return(mapply(pystr_endswith_, str, suffix, start, end, USE.NAMES=FALSE))
  if (is.null(start) && is.null(end)) {
    return(pystr_endswith_1(str, suffix))
  } else if (is.null(start)) {
    return(pystr_endswith_2(str, suffix, end))
  } else if (is.null(end)) {
    return(pystr_endswith_3(str, suffix, start))
  } else {
    return(pystr_endswith_4(str, suffix, start, end))
  }
}
