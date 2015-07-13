#' Create a character map.
#'
#' Create a list of character mappings usable for \code{\link{pystr_translate}}.
#'
#' The two arguments must be strings of equal length, and in the resulting
#' dictionary, each character in \code{x} will be mapped to the character at the
#' same position in \code{y}.
#'
#' @param x A string.
#' @param y A string.
#'
#' @return A list of character mappings for use in \code{\link{pystr_translate}}.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.maketrans}
#'
#' @seealso \code{\link{pystr_translate}}
#'
#' @examples
#' map = pystr_maketrans("abc", "123")
#' pystr_translate("a blue cat", map)
#'
#' @export
pystr_maketrans <- function(x, y) {
  if(nchar(x) != nchar(y)) {
    stop("x and y have inequal lengths.")
  }

  map = list()

  for(i in 1:nchar(x)) {
    xletter = substr(x, i, i)
    yletter = substr(y, i, i)
    map[xletter] = yletter
  }

  return(map)
}
