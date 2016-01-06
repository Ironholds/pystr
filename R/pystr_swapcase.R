#' Swap the case of a string.
#'
#' Return a copy of the string with uppercase characters converted to lowercase and vice versa.
#'
#' @param str A string.
#'
#' @return A string.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.swapcase}
#'
#' @examples
#' pystr_swapcase("Swap Me!")
#'
#' @export
pystr_swapcase <- function(str) {
  return(vapply(str, pystr_swapcase_, character(1), USE.NAMES = FALSE))
}

pystr_swapcase_ <- function(str) {
  swapped = ""

  for(i in 1:nchar(str)) {
    letter = substr(str, i, i)

    if(pystr_isupper(letter)) {
      swapped = paste0(swapped, pystr_lower(letter))
    } else if(pystr_islower(letter)) {
      swapped = paste0(swapped, pystr_upper(letter))
    } else {
      swapped = paste0(swapped, letter)
    }
  }

  return(swapped)
}
