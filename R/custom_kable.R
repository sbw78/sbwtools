#' custom_kable: A customized format using for printing tables
#'
#' This function uses `knitr::kable()` and `kableExtra::kable_styling` to build
#' a customized table that, in my opinion, looks better than the default.
#'
#' @param data A data frame or tibble. Matrices usually work, except when they don't.
#' @inherit knitr::kable
#' @seealso See \code{\link[knitr]{kable}} and \code{\link[kableExtra]{kable_styling}}
#' @export
#' @examples custom_kable(mtcars, caption = "A kable of mtcars")

custom_kable <- function(data, digits = 3, caption = NA, col.names = NA, row.names = NA, format = NULL, escape = TRUE, format.args = list()) {
  out_table <- knitr::kable(data,
                            escape = escape,
                            format = format,
                            booktabs = TRUE,
                            digits = digits,
                            format.args = format.args,
                            caption = caption,
                            col.names = col.names,
                            row.names = row.names)

  kableExtra::kable_styling(out_table, latex_options = c("HOLD_position"),
                            position = "left",
                            full_width = F)
}
