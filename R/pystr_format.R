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
#' If \code{...} is a single argument of a \code{data.frame}-like object, \code{pystr_format} will
#' return an \code{nrow()}-length character vector using the column names of the data.frame for
#' the named \code{\{placeholder\}}s.
#'
#' @param str A character vector.
#' @param ... Parameter values. See details and examples
#'
#' @return A character vector.
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
#'
#' ## Pass in a whole data frame, matching by column names
#'
#' my_cars <- data.frame(car=rownames(mtcars), mtcars)
#' head(pystr_format("The {car} gets {mpg} mpg (hwy) despite having {cyl} cylinders.", my_cars))
#'
#' supers <- data.frame(first=c("Bruce", "Hal", "Clark", "Diana"),
#'                      last=c("Wayne", "Jordan", "Kent", "Prince"),
#'                      is=c("Batman", "Green Lantern", "Superman", "Wonder Woman"))
#' pystr_format("{first} {last} is really {is} but you shouldn't call them {first} in public.", supers)
#'
#' @export
pystr_format <- function(str, ...) {
  args = list(...)
  return(sapply(str, function(x) pystr_format_(x, args), USE.NAMES = FALSE))
}

pystr_format_ <- function(str, args) {
  # if nothing was passed in besides 'str'
  if(length(args) == 0) {
    return(str)
  }

  params = args

  if(length(args) == 1) {

    if (inherits(args[[1]], "data.frame")) {

      # convert whatever else it may be besides a data.frame to a data.frame
      # to avoid return type issues with tbl_'s and with= nonsense with data.table
      df <- data.frame(args[[1]], stringsAsFactors=FALSE, check.names=FALSE)

      pat <-  "\\{[[:alnum:]]+\\}"
      looking_for <- gsub("[\\{\\}]", "", regmatches(str, gregexpr(pat, str))[[1]])
      has <- colnames(df)
      will_replace <- intersect(looking_for, has)
      if (length(will_replace) > 0) {
        sapply(1:nrow(df), function(i) {
          res <- str
          for(repl in will_replace) res <- gsub(sprintf("\\{%s\\}", repl), df[i, repl], res)
          res
        }) -> out
        return(out)

      }

    }

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
