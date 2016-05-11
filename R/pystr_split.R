#' Split a string.
#'
#' Return a list of character vectors of the words in the string, using \code{sep} as the delimiter string.
#'
#' If \code{maxsplit} is given, at most \code{maxsplit} splits are done
#' (thus, the character vector will have at most \code{maxsplit + 1} elements).
#' If \code{maxsplit} is not specified, then there is no limit on the number of
#' splits (all possible splits are made). If \code{sep} is given, consecutive
#' delimiters are not grouped together and are deemed to delimit empty strings.
#' The \code{sep} argument may consist of multiple characters. If \code{sep} is
#' not specified, any whitespace string is a separator. Splitting an empty
#' string returns an empty string.
#'
#' @param str A character vector.
#' @param sep A character string.
#' @param maxsplit A numeric integer.
#'
#' @return A list of character vectors.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.split}
#'
#' @seealso \code{\link{pystr_join}}, \code{\link{pystr_rsplit}}
#'
#' @examples
#' pystr_split("www.example.com", ".")
#' pystr_split("123123123", "2", 2)
#' pystr_split("1,,2,3", ",")
#' pystr_split("a--b--c", "--")
#'
#' @export
pystr_split <- function(str, sep=" ", maxsplit=nchar(str)-1) {
  return(mapply(pystr_split_, str, sep, maxsplit, SIMPLIFY=FALSE, USE.NAMES=FALSE))
}

pystr_split_ <- function(str, sep, maxsplit) {
  if(maxsplit == 0) {
    return(str)
  }

  if(sep == "") {
    splits = strsplit(str, sep)[[1]]

    if(maxsplit >= nchar(str) - 1) {
      return(splits)
    }

    first = splits[1:maxsplit]
    last = pystr_join(splits[(maxsplit + 1):length(splits)], "")
    return(c(first, last))
  }

  num_splits = min(pystr_count(str, sep), maxsplit)
  cum_splits = 0
  elements = c()
  remaining = str

  while(cum_splits < num_splits) {
    if(remaining == "") {return(elements)}
    parts = pystr_partition(remaining, sep)[[1]]
    elements = c(elements, parts[1])
    remaining = parts[3]
    cum_splits = cum_splits + 1
  }

  return(c(elements, remaining))
}
