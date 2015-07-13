#' Join the elements of a vector or list into a string.
#'
#' Return a string which is the concatenation of the elements in the iterable \code{iterable},
#' where \code{sep} is the separator between elements.
#'
#' @param iterable A vector or list.
#' @param sep A string.
#'
#' @return A string.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.join}
#'
#' @seealso \code{\link{pystr_split}}
#'
#' @examples
#' pystr_join(c("A", "B", "C"))
#' pystr_join(c(1, 2, 3), "+")
#' pystr_join(list("Apples", "Oranges"), ", ")
#'
#' @export
pystr_join <- function(iterable, sep="") {
  return(paste(iterable, collapse=sep))
}
