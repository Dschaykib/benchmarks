
# settings ----------------------------------------------------------------
library(data.table)
library(helfRlein)
library(ggplot2)

# load all functions
sapply(list.files("functions/", full.names = TRUE), source)

# set data.table threads settings to 1
setDTthreads(1)

# get benchmark files ------------------------------------------------------

bench_files <- list.files(path = "benchmarks",
                            pattern = ".R",
                            recursive = TRUE,
                            full.names = TRUE)


bench_files <- bench_files[!grepl("template.R", bench_files)]
#bench_files <- bench_files[!grepl("crossproduct.R", bench_files)]


# run all benchmarks -------------------------------------------------------
i_bench <- bench_files[1]
for (i_bench in bench_files) {
  # i.bench <- bench_files[2]
  cat("------ Benchmark: ", basename(i_bench), "------\n")
  source(file = i_bench, local = TRUE)
}



