#' @title update the main README file
#'
#' @description This function creates the README.md file out of all existing
#'  result files. It creates an overview table with the main take aways for
#'  each benchmark.
#' 
#' 
#' @param path the path to the benchmark folders where the result files are.
#'  Teh default is "benchmarks".
#' @param files the name of the result file. The default is "last_results.rds".
#'
#' @return
#' @export
#'
update_bench_overview <- function(path = "benchmarks",
                                  files = "last_results.rds") {
  require(helfRlein)
  require(knitr)

  # load selected files with results
  results_files <- list.files(path = path,
                              pattern = files,
                              recursive = TRUE,
                              full.names = TRUE)
  
  results_overview <- read_files(results_files, readRDS)
  
  # create README.md
  readme <- c(
    "## Overview of different benchmarks \n",
    "\n",
    "For more details on a benchmark, please have a look in the folder ",
    "[benchmarks](../benchmarks).",
    "\n",
    "\n",
    knitr::kable(results_overview, format = "markdown")
  )
  
  # write README.md
  writeLines(text = readme, con = "README.md")
  
}
