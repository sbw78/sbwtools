#' @title Create R/packages.R file
#' @param open Logical value, whether to open packages.R for editing
#' @return
#' @author Bryan West
#' @export
use_packages <- function (open = interactive()) {
  usethis::use_directory("R")
  usethis::use_template("packages.R", package = "sbwtools")
  invisible()
}
