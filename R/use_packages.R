#' @title Create R/packages.R file
#' @param open Logical value, whether to open packages.R for editing
#' @return
#' @author Bryan West
#' @export
use_packages <- function (open = interactive()) {
  usethis::use_directory("R")
  scripts <- c(file.path("packages.R"))
  for (script in scripts) {
    usethis::use_template(file.path("usepackages", script),
                          save_as = file.path("R", script), package = "sbwtools", open = open)
  }
  invisible()
}
