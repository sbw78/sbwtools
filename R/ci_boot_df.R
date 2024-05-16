#' Calculate mean with confidence intervals from boostrapped samples.
#'
#' @seealso [Hmisc::smean.cl.boot()] which this function utilizes
#' @return A data frame with variables `mean_{{.summary_var}}`, `ci_low`, `ci_high`, `sd`, `n`.
#' If the data frame is grouped, grouping variable will also be listed.
#' @param .data A data frame
#' @param .summary_var Variable that is being summarized
#' @param ... Grouping variable(s)
#' @param ci Confidence interval. Defaults to 0.95
#' @param groups_col List grouping variable under column named 'group'. Defaults
#' to FALSE.
#' @param B Number of bootstrap resamples. Defaults to 1000.
#' @importFrom rlang .data
#' @importFrom stats sd
#' @importFrom Hmisc smean.cl.boot
#' @export
#' @examples
#' ci_boot_df(mtcars, mpg, cyl, gear)

ci_boot_df <- function(.data, .summary_var, ..., ci = 0.95, groups_col = FALSE,
                       B = 1000) {
  # check function args ----
  df <- .data
  if (missing(.summary_var)) {
    stop("No numeric variable defined")
  }
  if (!is.logical(groups_col)) {
    groups_col <- FALSE
  }

  if(!missing(...)) {
    group_vars <- dplyr::enquos(..., .named = TRUE)
    groups_nm <- paste0(names(group_vars), collapse = ":")
    df <- dplyr::group_by(df, ...)
  }
  if (is.null(B)) {
    B <- 1000
  }
  # Create function variables ----
  summary_var <- dplyr::enquo(.summary_var)
  summary_nm <- paste0("mean_", dplyr::quo_name(summary_var))

  # Build output df ----
  boot_df <- dplyr::reframe(df,
                            ci_out = Hmisc::smean.cl.boot({{ summary_var }},
                                                          conf.int = ci,
                                                          B = 1000),
                            conf = c(paste0(summary_nm), "ci_low", "ci_high"),
                            sd = stats::sd({{ summary_var }}, na.rm = TRUE),
                            n = dplyr::n())
  boot_df <- tidyr::pivot_wider(boot_df, names_from = "conf", values_from = "ci_out")
  boot_df <- dplyr::relocate(boot_df, sd, .after = "ci_high")

  # create groups_col ----
  if (groups_col) {
    tidyr::unite(data = boot_df, col = "group",
                 c(...), remove = TRUE)
  } else {
    boot_df
  }
}
