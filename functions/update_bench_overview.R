#' @title update the main README file
#'
#' @description This function creates the README.md file out of all existing
#'  result files. It creates an overview table with the main take aways for
#'  each benchmark. The "00_template_folder" is ignored.
#' 
#' 
#' @param path the path to the benchmark folders where the result files are.
#'  Teh default is "benchmarks".
#' @param files the name of the result file. The default is "last_result.rds".
#'
#' @return
#' @export
#'
update_bench_overview <- function(path = "benchmarks/",
                                  files = "last_result.rds") {
  require(helfRlein)
  require(knitr)

  # load selected files with results
  results_files <- list.files(path = path,
                              pattern = files,
                              recursive = TRUE,
                              full.names = TRUE)
  
  # remove template
  results_files <- results_files[!grepl("00_template_folder", results_files)]
  
  results_overview <- read_files(results_files, readRDS)
  
  # create README.md
  readme <- c(
    "## Overview of different benchmarks \n",
    "\n",
    "This is a collection of benchmark I collected over the years. ",
    "In [this blog post here](https://www.statworx.com/de/blog/) ",
    "I describe what I did and how new benchmarks can be added.",
    "For more results of a benchmark, please have a look in the ",
    "respective folder within [benchmarks](../benchmarks).",
    "\n",
    "- The **DATE** of the last time, the benchmark run.",
    "- A short description **TEST** of the benchmark.",
    "- In the **COMMENTS** I tried to give a hint of what the setups looked like.",
    "- The **BEST** option out of all tested alternatives compared by their mean time.",
    "- The **TIME_FACTOR** presents the mean time that can be saved with the best
    option compared with the mean of the alternatives over all grid setups. 
    **Note:** The time factor can be negative if the best option is not the
    best in the cases where it takes more time. For these cases, have a look at
    the details and dependencies of the grid parameters.",
    "- **BEST_RUNS** is the number of cases were **BEST** solution was actually
    the best one in relation of all different varying setups that were used (e.g. sample size).",
    "- **DURATION** is the time the whole benchmark with all setups took.",
    "\n",
    "\n",
    knitr::kable(results_overview, format = "markdown")
  )
  
  # write README.md
  writeLines(text = readme, con = "README.md")
  
}
