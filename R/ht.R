#' Get first 10 and last 10 rows of a data frame
#' 
#' @param d A data frame
#' @export
#' @examples 
#' ht(d)

ht <- function(d) {
  rbind(utils::head(d,10), utils::tail(d,10))
}