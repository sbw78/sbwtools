#' Format p-value
#' 
#' @param p One or more p-values as either a numeric vector or numeric variable in a data frame.
#' @param digits How many digits to round to? Defaults to 3.
#' @return A character vector of rounded p-values. Any p-values less than .001 are shown as "< .001"
#' @export
#' @examples
#' format_pval(p.value)

format_pval <- function(p, digits = 3) {
  pvalue_chr <- as.character(round(p, digits = digits))
  if (digits == 3)
    pformat <- ifelse(p < 0.001, "< .001", pvalue_chr)
  else if (digits == 2)
    pformat <- ifelse(p < 0.01, "< .01", pvalue_chr)
  pformat
}