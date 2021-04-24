#' Create data directories
#'
#' @export
#' @examples
#' make_data_dirs()

make_data_dirs <- function() {
  if (!dir.exists("./original_data")) {
    dir.create("./original_data")
  }

  if (!dir.exists("./analysis_data")) {
    dir.create("./analysis_data")
  }
}
