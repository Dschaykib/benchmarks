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
folder <- "benchmarks/assignment/"

# test description
description <- "assign with <- or = "

# number of repetitions
reps <- 100L

# if there is anything else to say
comments <- "varying size of vector"

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


for (i in c(1:nrow(grid))) {
  # i <- 1
  
  i_param_1 <- grid[i, param_1]
  
  # use grid parameters to define tested setup
  set.seed(i)
  x <- runif(i_param_1)
  b <- c()
  
  tmp <- microbenchmark(
    "arrow sign" = {b <- x},
    "equal sign" = {b = x},
    times = reps,
    setup = {b <- c()},
    control = list(warmup = 10L),
    unit = "us")
  
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
