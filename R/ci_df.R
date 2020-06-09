#' Calculate mean with confidence intervals.
#'
#' @seealso \code{\link[Hmisc]{smean.cl.normal}} which this function utilizes
#' @return A data frame with variables `mean`, `ci_low`, `ci_high`, `sd`, `n`.
#' If the data frame is grouped, grouping variable will also be listed.
#' @inheritParams ci_boot_df
#' @importFrom Hmisc smean.cl.normal
#' @export
#' @examples
#' ci_df(mtcars, mpg, cyl, gear)

ci_df <- function(.data, .summary_var, ..., ci = 0.95, groups_col = FALSE) {

  # check function args ----
  df <- .data
  if (missing(.summary_var)) {
    stop("No numeric variable defined")
  }

  if (!is.logical(groups_col)) {
    groups_col <- FALSE
  }

  if (!missing(...)) {
    group_vars <- dplyr::enquos(..., .named = TRUE)
    groups_nm <- paste0(names(group_vars), collapse = ":")
    df <- dplyr::group_by(df, ...)
  }
  # create function variables ----
  summary_var <- dplyr::enquo(.summary_var)
  summary_nm <- paste0("mean_", dplyr::quo_name(summary_var))

  # build final df ----
  conf_df <- dplyr::summarize(df,
                              ci_out = Hmisc::smean.cl.normal({{ summary_var }},
                                                              conf.int = ci),
                              conf = c(paste0(summary_nm), "ci_low", "ci_high"),
                              sd = stats::sd({{ summary_var }}, na.rm = TRUE),
                              n = dplyr::n())
  conf_df <- dplyr::ungroup(conf_df)
  conf_df <- tidyr::pivot_wider(conf_df, names_from = .data$conf, values_from = .data$ci_out)
  conf_df <- dplyr::relocate(conf_df, sd, .after = .data$ci_high)

  # create groups_col ----
  if (groups_col == TRUE) {
    tidyr::unite(data = conf_df, col = "group",
                 c(...), remove = TRUE)
  } else {
    conf_df
  }
}
