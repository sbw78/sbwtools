pkgs_install <- c(
  # "conflicted",
  # "dotenv",
  # "targets",
  # "tarchetypes",
  # "performance",
  # "knitr",
  # "kableExtra",
  # "ragg",
  # "labelled",
  # "lmtest",
  # "lmerTest",
  # "modelsummary",
  # "psych",
  # "GPArotation",
  # "RColorBrewer",
  # "here",
  # "haven",
  # "ggplot2",
  # "ggrepel",
  # "ggraph",
  # "tidygraph",
  # "ggstatsplot",
  # "cowplot",
  # "lemon",
  # "dplyr",
  # "tidyr",
  # "stringr",
  # "purrr",
  # "forcats",
  # "tibble",
  # "ggtext",
  # "gt",
  # "jacob-long/interactions",
  # "jacob-long/jtools",
  # "strengejacke/strengejacke",
  # "strengejacke/sjPlot",
  # "modelsummary",
  # "sandwich",
  # "lavaan",
  # "tinytex",
  # "rmdformats",
  # "broom",
  # "broom.mixed",
  # "tictoc",
  # "rmarkdown",
  # "janitor",
  # "emmeans",
  # "effectsize",
  # "easystats/report",
  # "dr-JT/semoutput",
  # "sbw78/fancyCorr",
  # "cocor",
  # "sbw78/sbwtools",
  # "crsh/papaja",
  # "cjvanlissa/tidySEM",
  # "jasonmoy28/psycModel",
  # "gridExtra",
  # "qqplotr",
  # "see",
  # "nFactors"
)

# invisible(
lapply(pkgs_install, function(pkg) {
  y <- unlist(
    lapply(pkg,
           function(x) {
             ifelse(grepl("/", x),
                    unlist(strsplit(x, "/"))[2],
                    x)
           }
    )
  )
  if (!require(y, character.only = TRUE)) renv::install(pkg)
})
# )

rm(pkgs_install)

# conflicted::conflict_prefer("filter", "dplyr", quiet = TRUE)
# conflicted::conflict_prefer("report", "report", quiet = TRUE)
# conflicted::conflict_prefer("to_factor", "labelled", quiet = TRUE)
# conflicted::conflict_prefer("as_factor", "forcats", quiet = TRUE)
# conflicted::conflict_prefer("google_font", "xaringanthemer", quiet = TRUE)
