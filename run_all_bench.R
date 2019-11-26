
# settings ----------------------------------------------------------------
library(data.table)
library(helfRlein)
library(ggplot2)
source("functions/save_benchmark.R")
setDTthreads(1)

# get benchmark files ------------------------------------------------------

bench_files <- list.files(path = "benchmarks",
                            pattern = ".R",
                            recursive = TRUE,
                            full.names = TRUE)


bench_files <- bench_files[!grepl("template.R", bench_files)]
bench_files <- bench_files[!grepl("crossproduct.R", bench_files)]


# run all benchmarks -------------------------------------------------------

for (i.bench in bench_files) {
  # i.bench <- bench_files[2]
  print(basename(i.bench))
  source(file = i.bench, local = TRUE)
}



# update README -----------------------------------------------------------

source(file = "bench_overview.R")


