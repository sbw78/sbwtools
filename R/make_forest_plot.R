#' Create a forest plot
#'
#' @return A ggplot plot
#' @seealso \code{\link[tidyr]{pivot_longer}}, \code{\link[ggplot2]{ggplot}}
#' @param d A data frame in long format that has boundary values for a confidence interval
#' @param .measure_var Numeric variable to be plotted on the x-axis
#' @param .group_var Factor or character variable to differentiate plots
#' @param xlab Label for x-axis
#' @param ylab Label for y-axis
#' @param ci_low Minimum confidence interval variable. Defaults to `ci_low`
#' @param ci_high Maximum confidence interval variable Defaults to `ci_high`
#' @param xintercept Value of x-intercept for vertical dotted line
#' @export
#' @examples
#' forest_plot

make_forest_plot <- function(d, .measure_var, .group_var,
                        xlab = NULL, ylab = NULL,
                        ci_low = ci_low,
                        ci_high = ci_high,
                        xintercept = NULL) {
  require(ggplot2)
  require(dplyr)
  require(jtools)
  # x = measure_var
  # xmin = ci_low
  # xmax = ci_high
  # y = group_var
  require(ggplot2)
  # check for inputs ====
  if (missing(.measure_var)) {
    stop("Must provide argument for '.measure_var'")
  } else if (missing(.group_var)) {
    stop("Must provide at least one argument for '.group_var'")
  }

  # get function args ----
  measure_var <- dplyr::enquo(.measure_var)
  group_var <- dplyr::enquo(.group_var)
  ci_low <- dplyr::enquo(ci_low)
  ci_high <- dplyr::enquo(ci_high)

  # build plot  ----
  p <- ggplot2::ggplot(
    d, aes(x = {{ measure_var }}, y = {{ group_var }},
           xmin = {{ ci_low }}, xmax = {{ ci_high }})) + # uses default colnames from ci_df
    ggplot2::geom_pointrange(shape = 18) +
    ggplot2::geom_vline(lty=2, xintercept = xintercept) +
    ggplot2::ylab(ylab) +
    ggplot2::xlab(xlab) +
    jtools::theme_apa() +
    ggplot2::theme(text = ggplot2::element_text(family = "Helvetica"),
                   plot.subtitle = ggplot2::element_text(face = "italic"),
                   plot.title = ggplot2::element_text(size = 12))

  return(p)
}
