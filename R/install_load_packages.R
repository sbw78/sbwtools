#' @title Install and load packages
#'
#' This function will check for each package in the user-ddefined and install
#' them if they are missing, and then load them. It also takes a list of github
#' packages and their repos.
#' @author Bryan West
#' @param packages A list of the packages you want to load
#' @param github_packages A list of the github packages and their repos.
#'   `package` = package names, `repo` = package repos
#' @keywords packages, github
#' @export
#' @examples
#' packages <- c("tidyverse", "here", "lubridate")
#'
#' github_packages <- list(package = c("fancyCorr", "report"),
#' repo = c("sbw78/fancyCorr", "easystats/report"))
#'
#' install_load_packages(packages, github_packages)

install_load_packages <- function(packages, github_packages) {

  if (!missing(packages)) {
    installed_packages <- packages %in% rownames(utils::installed.packages())
  } else {
    stop("Missing packages")
  }
  if (missing(github_packages)) {
    github_packages = NULL
  }

    installed_github_packages <-
      github_packages$package %in% rownames(utils::installed.packages())
  if (any(installed_packages == FALSE)) {
    utils::install.packages(packages[!installed_packages])
  } else {
    message("\n ...CRAN packages were already installed.\n")
  }

  if (any(installed_github_packages == FALSE)) {
    devtools::install_github(github_packages$repo[!installed_github_packages])
  } else {
    message("\n ...Github packages were already installed.\n")
  }

  attached <- search()
  attached_packages <- attached[grepl("package", attached)]
  need_to_attach <-
    c(packages[which(!packages %in% gsub("package", "", attached_packages))])
  if (!is.null(github_packages)) {
    need_to_attach <-
      append(need_to_attach,
             github_packages$package[which(!github_packages$package %in% gsub(
               "package", "", attached_packages))])
    packages <- c(packages, github_packages$package)
  }

  if (length(need_to_attach > 0)) {
    invisible(lapply(packages, require, character.only = TRUE))
  } else {
    message("\n ...Packages were already loaded.\n")
  }
  if (exists("packages", envir = globalenv())) {
    rm(packages, envir = globalenv())
  } else if (exists("github_packages", envir = globalenv())) {
    rm(github_packages, envir = globalenv())
  }
}
