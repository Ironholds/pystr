#' Translate a string.
#'
#' Return a copy of \code{str} where all characters have been mapped through
#' \code{map}, where \code{map} can be created with \code{\link{pystr_maketrans}}.
#'
#' @param str A character vector.
#' @param map A list of character mappings.
#'
#' @return A character vector.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.translate}
#'
#' @seealso \code{\link{pystr_maketrans}}
#'
#' @examples
#' map = pystr_maketrans("abc", "123")
#' pystr_translate("a blue cat", map)
#'
#' @export
pystr_translate <- function(str, map) {
  return(vapply(str, function(x) pystr_translate_(x, map), character(1), USE.NAMES = FALSE))
}

pystr_translate_ <- function(str, map) {
  translated = str

  for(i in 1:length(map)) {
    translated = pystr_replace(translated, names(map[i]), map[[i]])
  }

  return(translated)
}
