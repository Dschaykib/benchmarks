
# settings ----------------------------------------------------------------

library(helfRlein)
library(knitr)


# get results -------------------------------------------------------------

results_files <- list.files(path = "benchmarks",
                            pattern = "last_result.rds",
                            recursive = TRUE,
                            full.names = TRUE)

results_overview <- read_files(results_files, readRDS)


# save as README ----------------------------------------------------------

readme <- c(
  "##Overview of different benchmarks \n",
  "\n",
  "For more details on a benchmark, please have a look in the folder ",
  "[benchmarks](../benchmarks).",
  "\n",
  "\n",
  knitr::kable(results_overview, format = "markdown")
)

writeLines(text = readme, con = "README.md")
