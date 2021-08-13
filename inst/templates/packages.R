# Packages to install ----

{
  unlist(
    list(
      ## Utilities ----
      c(
        # "conflicted",
        # "tictoc",
        # "here",
        # "ragg",
        # "sbw78/sbwtools"
      ),
      ## Data manipulation ----
      c(
        # "tidyverse",
        # "labelled",
        # "haven",
        # "lubridate",
        # "janitor"
      ),
      ## Correlations ----
      c(
        # "sbw78/fancyCorr",
        # "cocor"
      ),
      ## Modeling ----
      c(
        # "lmtest",
        # "lmerTest"
      ),
      ### SEM / Factor Analysis
      c(
        # "lavaan",
        # "cjvanlissa/tidySEM",
        # "nFactors",
      ),

      ### Model Analysis
      c(
        # "emmeans",
        # "performance",
        # "modelsummary",
        # "jacob-long/interactions",
        # "jacob-long/jtools",
        # "strengejacke/strengejacke",
        # "modelsummary",
        # "effectsize",
        # "easystats/report",
        # "sandwich"
      ),

      ### Summarizing model data / tidying
      c(
        # "broom",
        # "broom.mixed",
        # "gt"
      ),

      ## Project workflow (targets/drake) ----
      c(
        # "dotenv",
        # "targets",
        # "tarchetypes",
      ),

      ## RMarkdown / document production ----
      c(
        # "rmarkdown",
        # "knitr",
        # "kableExtra",
        # "rmdformats"
        # "tinytex",
        # "crsh/papaja"
      ),

      ## Psychology-related ----
      c(
        # "psych",
        # "GPArotation",
        # "jasonmoy28/psycModel"
      ),
      ## Data visualization ----
      c(
        # "ggplot2",
        # "RColorBrewer",
        # "ggrepel",
        # "ggraph",
        # "tidygraph",
        # "ggstatsplot",
        # "cowplot",
        # "lemon",
        # "ggtext",
        # "strengejacke/sjPlot",
        # "dr-JT/semoutput",
        # "gridExtra",
        # "qqplotr",
        # "see"
      )
      ## End of package list ----
    )
  )
} -> pkgs_install

# Install and load packages ----
# invisible(
lapply(
  pkgs_install,
  FUN = function(pkg) {
    y <- unlist(
      lapply(pkg,
             function(x) {
               ifelse(grepl("/", x),
                      unlist(strsplit(x, "/"))[2],
                      x)
             }
      )
    )
    if (!require(y, character.only = TRUE)) {
      renv::install(pkg)
    }
    library(y, character.only = TRUE)
  }
)
# )

rm(pkgs_install)

#
conflicted::conflict_prefer("filter", "dplyr", quiet = TRUE)
# conflicted::conflict_prefer("report", "report", quiet = TRUE)
conflicted::conflict_prefer("to_factor", "labelled", quiet = TRUE)
conflicted::conflict_prefer("as_factor", "forcats", quiet = TRUE)
# conflicted::conflict_prefer("google_font", "xaringanthemer", quiet = TRUE)
