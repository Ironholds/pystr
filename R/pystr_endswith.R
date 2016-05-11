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
pystr_endswith <- function(str, suffix, start=1, end=nchar(str)) {
  return(mapply(pystr_endswith_, str, suffix, start, end, USE.NAMES=FALSE))
}

pystr_endswith_ <- function(str, suffix, start, end) {
  string_to_check = substr(str, start, end)
  start_check = nchar(string_to_check) - nchar(suffix) + 1
  end_check = nchar(string_to_check)
  letters_to_check = substr(string_to_check, start_check, end_check)
  return(letters_to_check == suffix)
}
