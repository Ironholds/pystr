#' Join the elements of a character vector or list into a string.
#'
#' Return a string which is the concatenation of the elements in the iterable \code{iterable},
#' where \code{sep} is the separator between elements.
#'
#' @param iterable A character vector.
#' @param sep A character string.
#'
#' @return A character vector or list.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.join}
#'
#' @seealso \code{\link{pystr_split}}
#'
#' @examples
#' pystr_join(c("A", "B", "C"))
#' pystr_join(c(1, 2, 3), "+")
#' pystr_join(list(c(1, 2, 3), c(4, 5, 6)), ", ")
#'
#' @export
pystr_join <- function(iterable, sep="") {
  if (is.list(iterable)) {
    return(pystr_join_(unlist(iterable), sep))
  }
  return(pystr_join_(iterable,  sep))
}
