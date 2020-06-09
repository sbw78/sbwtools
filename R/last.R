#' Get last element of a vector or list
#' 
#' @param x A vector or list
#' @export
#' @examples
#' last(x)
 
last <- function(x) {
  x[length(x)]
}