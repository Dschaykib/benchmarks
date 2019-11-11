
# settings ----------------------------------------------------------------
library(data.table)
library(helfRlein)
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
  source(file = i.bench, local = TRUE)
  statusbar(run = i.bench, max.run = bench_files, info = basename(i.bench))
}



# update README -----------------------------------------------------------

source(file = "bench_overview.R")


