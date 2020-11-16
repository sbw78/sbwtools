#' Create default directories I use for projects
#'
#' @export
#' @usage create_default_dirs()

create_default_dirs <- function() {
  dirs <- c("analysis_data",
            "documents",
            "original_data")
  lapply(dirs, usethis::use_directory)
}
