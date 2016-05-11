#' Check the prefix of a string.
#'
#' Return \code{TRUE} if the string \code{str} starts with the specified
#' \code{prefix}, otherwise return \code{FALSE}.
#'
#' \code{prefix} can also be a vector or list of prefixes to look for. With optional
#' \code{start}, test string beginning at that position. With optional
#' \code{end}, stop comparing string at that position.
#'
#' @param str A character vector.
#' @param prefix A character vector.
#' @param start A numeric integer.
#' @param end A numeric integer.
#'
#' @return \code{TRUE} or \code{FALSE}
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.startswith}
#'
#' @seealso \code{\link{pystr_endswith}}
#'
#' @examples
#' pystr_startswith("www.example.com", "www.")
#' pystr_startswith("example.com", "www.")
#' pystr_startswith("www.example.com", "example", 5)
#' pystr_startswith("http://example.com", c("http://", "https://"))
#'
#' @export
pystr_startswith <- function(str, prefix, start=1, end=max(nchar(str))) {
  return(vapply(str, function(x) pystr_startswith_(x, prefix, start=start, end=end), logical(1), USE.NAMES = FALSE))
}

pystr_startswith_ <- function(str, prefix, start, end) {
  prefix = as.list(prefix)
  string_to_check = substr(str, start, end)

  for(i in 1:length(prefix)) {
    pref = prefix[[i]]
    start_check = 1
    end_check = nchar(pref)
    letters_to_check = substr(string_to_check, start_check, end_check)

    if(letters_to_check == pref) {
      return(TRUE)
    }
  }

  return(FALSE)
}
