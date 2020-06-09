#' Create a regular expression from a character vector or list
#' 
#' @param list A list of characters
#' @param modifier Type of regex. 'single' will break every word into a separate
#' section of the expression. 'multi' will allow phrases to be components of the
#' expression. Defaults to 'single'.
#' @return A regular expression 
#' @export
#' @examples
#' regex_build(c("apple", "banana", "carrot"))
#' regex_build(c("dog treats", "cereal", "Boston baked beans"))

regex_build <- function(list, modifier = "single") {
  if (modifier == "single") {
    custom_left <- "\\b"
    custom_right <- "\\b"
  } else if (modifier == "multi") {
    custom_left <- "\\s*?\\b"
    custom_right <- "\\b\\s*?"
  } else {
    stop("You must define modifier as either 'single' or 'multi'.")
  }
  out <- lapply(list, FUN = function(x) {paste0(custom_left, x, custom_right)})
  # out <- purrr::map(list, ~ paste0(custom_left, .x, custom_right))
  Reduce(function(x, y) {paste(x, y, sep = "|")}, out)
  # reduce(out, ~ paste(.x, .y, sep = "|"))
}