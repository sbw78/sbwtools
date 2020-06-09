#' A function to get the standard error
#'
#' @param x A numeric vector
#' @param na.rm Remove NAs? Defaults to FALSE.
#' @export
#' @examples
#' se(iris$Sepal.Length)

se <- function(x, na.rm = FALSE) {
  stdev <- stats::sd(x, na.rm = na.rm)
  if (na.rm) {
    n <- length(x[!is.na(x)])
  } else {
    n <- length(x)
  }
  stdev / sqrt(n)
}
