#' My standard customized kable format using kableExtra
#'
#' @seealso [knitr::kable()] and [kableExtra::kable_styling()]
#' @inheritParams knitr::kable

custom_kable <- function(data,
                         digits = 3,
                         caption = NA,
                         col.names = NA,
                         row.names = NA,
                         format = NULL,
                         escape = TRUE,
                         format.args = list()) {
  require(knitr)
  require(kableExtra)


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
