#' Check the suffix of a string.
#'
#' Return \code{TRUE} if the string \code{str} ends with the specified
#' \code{suffix}, otherwise return \code{FALSE}.
#'
#' @details \code{suffix} can also be a list of suffixes to look for.
#' With optional \code{start}, test beginning at that position.
#' With optional \code{end}, stop comparing at that position.
#'
#' @param str A string.
#' @param suffix A string, character vector, or list of strings.
#' @param start An integer.
#' @param end An integer.
#'
#' @return \code{TRUE} or \code{FALSE}
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.endswith}
#'
#' @seealso \code{\link{pystr_startswith}}
#'
#' @examples
#' pystr_endswith("selfie.jpg", ".jpg")
#' pystr_endswith("selfie.jpg", ".png")
#' pystr_endswith("selfie.jpg", c(".jpg", ".png"))
#' pystr_endswith("selfie.jpg", list(".jpg", ".png"))
#' pystr_endswith("hello world", "ello", 1, 5)
#'
#' @export
pystr_endswith <- function(str, suffix, start=1, end=nchar(str)) {
  suffix = if(is.list(suffix)) suffix else as.list(suffix)
  string_to_check = substr(str, start, end)

  for(i in 1:length(suffix)) {
    suf = suffix[[i]]
    start_check = nchar(string_to_check) - nchar(suf) + 1
    end_check = nchar(string_to_check)
    letters_to_check = substr(string_to_check, start_check, end_check)

    if(letters_to_check == suf) {
      return(TRUE)
    }
  }

  return(FALSE)
}
