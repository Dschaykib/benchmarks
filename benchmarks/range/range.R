# used libraries ----------------------------------------------------------

# these are needed
library(microbenchmark)
library(helfRlein)
library(data.table)

source("functions/save_benchmark.R")

# add more here
#
#
#

# test setup --------------------------------------------------------------

# folder for results
folder <- "benchmarks/range/"

# test description
description <- "get range of numeric vector"

# number of repetitions
reps <- 100L

# if there is anything else to say
comments <- "varying size"


start_time <- Sys.time()



# grid setup --------------------------------------------------------------

# if there are different values to test
grid <- as.data.table(expand.grid(
  param_1 = 10^c(2:7)))

result_list <- as.list(rep(NA, dim(grid)[1]))
best_list <- as.list(rep(NA, dim(grid)[1]))

# benchmark setup ---------------------------------------------------------

# create folder for results
helfRlein::checkdir(folder)

# run for each grid possible
N <- 1:1e7

for (i in c(1:nrow(grid))) {
  # i <- 6
  
  i_param_1 <- grid[i, param_1]
  
  # use grid parameters to define tested setup
  x <- sample(N, i_param_1, replace = TRUE)
  
  tmp <- microbenchmark(
    range(x),
    max(x) - min(x),
    times = reps,
    control = list(warmup = 10L),
    unit = "ms")
  
  #tmp <- data.table(summary(tmp), i = grid[i, ])
  result_list[[i]] <- tmp
  
  # select best by mean
  tmp_sum <- summary(tmp)
  best_list[[i]] <- as.character(tmp_sum$expr[tmp_sum$mean == min(tmp_sum$mean)])
  
}



# saving result -----------------------------------------------------------

save_benchmark(result_list = result_list,
               best_list = best_list,
               folder = folder,
               start_time = start_time,
               description = description,
               grid = grid,
               reps = reps,
               comments = comments)
