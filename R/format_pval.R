#' Format p-value
#'
#' @param p One or more p-values as either a numeric vector or numeric variable
#' in a data frame.
#' @param digits How many digits to round to? Defaults to 3.
#' @param leading_zero Include 0 before decimal point? Default is FALSE
#' @return A character vector of rounded p-values. Any p-values less than .001
#' are shown as "< .001"
#' @export
#' @examples
#' p.value <- c(.01, .005, .00024)
#' format_pval(p.value)
#' format_pval(p.value, leading_zero = TRUE)

format_pval <- function(p, digits = 3, leading_zero = FALSE) {
  pvalue_chr <- sprintf("%.*f", digits, p)
  if (isFALSE(leading_zero)) {
    pvalue_chr <- gsub("0\\.", "\\.", pvalue_chr)
    if (digits == 3)
      pformat <- ifelse(p < 0.001, "< .001", pvalue_chr)
    else if (digits == 2)
      pformat <- ifelse(p < 0.01, "< .01", pvalue_chr)
  } else {
    if (digits == 3)
      pformat <- ifelse(p < 0.001, "< 0.001", pvalue_chr)
    else if (digits == 2)
      pformat <- ifelse(p < 0.01, "< 0.01", pvalue_chr)
  }
  pformat
}
