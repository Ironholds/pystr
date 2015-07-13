#' Format a string.
#'
#' Perform a string formatting operation.
#'
#' The string on which this method is called can contain
#' literal text or replacement fields delimited by braces \code{\{\}}. Each replacement field contains
#' either the numeric index of a positional argument, or the name of a keyword argument. Returns
#' a copy of the string where each replacement field is replaced with the string value of the
#' corresponding argument.
#'
#' @param str A string.
#' @param ... Parameter values. See details and examples
#'
#' @return A formatted string.
#'
#' @references \url{https://docs.python.org/3/library/stdtypes.html#str.format}
#'
#' @examples
#' # Numeric placeholders
#'
#' pystr_format("Hello {1}, my name is {2}.", "World", "Nicole")
#' pystr_format("Hello {1}, my name is {2}.", c("World", "Nicole"))
#' pystr_format("Hello {1}, my name is {2}.", list("World", "Nicole"))
#'
#' # Named placeholders
#'
#' pystr_format("Hello {thing}, my name is {name}.", thing="World", name="Nicole")
#' pystr_format("Hello {thing}, my name is {name}.", c(thing="World", name="Nicole"))
#' pystr_format("Hello {thing}, my name is {name}.", list(thing="World", name="Nicole"))
#'
#' # Pass in characters and numbers
#'
#' pystr_format("Hello {name}, you have {n} new notifications!", name="Nicole", n=2)
#'
#' ## Placeholders can be used more than once
#'
#' pystr_format("The name is {last}. {first} {last}.", last="Bond", first="James")

#' @export
pystr_format <- function(str, ...) {
  args = list(...)

  if(length(args) == 0) {
    return(str)
  }

  params = args

  if(length(args) == 1) {
    if(is.null(names(args))) {
      params = args[[1]]
    }
  }

  if(length(params) == 0) {
    return(str)
  }

  if(is.null(names(params))) {
    names(params) = 1:length(params)
  }

  for(i in 1:length(params)) {
    str = gsub(paste0("\\{", names(params[i]), "\\}"), params[[i]], str)
  }

  return(str)
}
