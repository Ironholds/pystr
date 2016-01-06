#' Titlecase a string.
#'
#' Return a titlecased version of the string where words start with an uppercase character
#' and the remaining characters are lowercase.
#'
#' @param str A character vector.
#'
#' @return A character vector.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.title}
#'
#' @examples
#' pystr_title("make me pretty!")
#'
#' @export
pystr_title <- function(str) {
  return(vapply(str, pystr_title_, character(1), USE.NAMES = FALSE))
}

pystr_title_ <- function(str) {
  titled = ""

  for(i in 1:nchar(str)) {
    letter = substr(str, i, i)

    if(i == 1) {
      titled = paste0(titled, toupper(letter))
    } else {
      previous_char = substr(str, i - 1, i - 1)

      if(!pystr_isalpha(previous_char)) {
        titled = paste0(titled, toupper(letter))
      } else {
        titled = paste0(titled, tolower(letter))
      }
    }
  }

  return(titled)
}
