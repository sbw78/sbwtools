#' Format p-value
#'
#' This function was designed with formatting p-values, but it can be used to
#' format any double to a desired number of decimal places, returning it as a
#' character vector.
#'
#' @param p One or more p-values as either a numeric vector or numeric variable
#' in a data frame.
#' @param digits How many digits to round to? Defaults to 3.
#' @param zero Include 0 before decimal point? Default is FALSE
#' @return A character vector of rounded p-values. Any p-values less than .001
#' are shown as "< .001"
#' @export
#' @examples
#' p.value <- c(.01, .005, .00024)
#' format_pval(p.value)
#' format_pval(p.value, zero = TRUE)

format_pval <- function(p, digits = 3, zero = FALSE) {
  pvalue_chr <- sprintf("%.*f", digits, p)
  pbase <- 10^-digits
  if (isFALSE(zero)) {
    pformat <- ifelse(abs(p) < pbase, paste("<", pbase), pvalue_chr)
    pformat <- gsub("0\\.", "\\.", pformat)
  } else {
    pformat <- ifelse(abs(p) < pbase, paste("<", pbase), pvalue_chr)
  }
  pformat
}
