#' Replace substrings within a string.
#'
#' Return a copy of the string with all occurrences of substring \code{old} replaced by \code{new}.
#'
#' If the optional argument \code{count} is given, only the first \code{count} occurrences are replaced.
#'
#' @param str A character vector.
#' @param old A character vector.
#' @param new A character vector.
#' @param count A numeric vector.
#'
#' @return A character vector.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.replace}
#'
#' @examples
#' pystr_replace("123123123", "2", "two")
#' pystr_replace("123123123", "2", "two", 2)
#'
#' @export
pystr_replace <- function(str, old, new, count=nchar(str) + 2) {
  return(mapply(pystr_replace_, str, old, new, count, USE.NAMES=FALSE))
}

pystr_replace_ <- function(str, old, new, count) {
  if(count == 0) {
    return(str)
  }

  if(old == "") {
    separated = pystr_split(str, "", count - 1)
    joined = paste0(new, pystr_join(separated, new))

    if(count == nchar(str) + 2) {
      return(paste0(joined, new))
    }

    return(joined)
  }

  num_replaces = min(pystr_count(str, old), count)
  cum_replaces = 0
  replaced = ""
  remaining = str

  while(cum_replaces < num_replaces) {
    parts = pystr_split(remaining, old, 1)[[1]]
    replaced = paste0(replaced, parts[1], new)
    remaining = parts[2]
    cum_replaces = cum_replaces + 1
  }

  return(paste0(replaced, remaining))
}
