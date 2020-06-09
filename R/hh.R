#' Get first 5 rows and first 5 columns of a data frame or matrix
#'
#' @param d A data frame or matrix
#' @export
#' @examples
#' hh(mtcars)

hh <- function(d) {
  d[1:5,1:5]
}
