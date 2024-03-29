# used libraries ----------------------------------------------------------

# these are needed
library(microbenchmark)
library(helfRlein)
library(data.table)

source("functions/save_benchmark.R")

# add more here
#

# test setup --------------------------------------------------------------

# folder for results
folder <- "benchmarks/00_template_folder/"

# test description
description <- "A short description of what is tested."

# number of repetitions
reps <- 100L

comments <- "what parameters changed"

start_time <- Sys.time()



# grid setup --------------------------------------------------------------

# if there are different values to test
grid <- as.data.table(expand.grid(
  param_1 = 10^c(2:3),
  param_2 = c(5,10,20),
  stringsAsFactors = FALSE))

result_list <- as.list(rep(NA, dim(grid)[1]))
best_list <- as.list(rep(NA, dim(grid)[1]))

# benchmark setup ---------------------------------------------------------

# create folder for results
helfRlein::checkdir(folder)

# run for each grid possible

for (i in c(1:nrow(grid))) {
  # i <- 1
  
  i_param_1 <- grid[i, param_1]
  i_param_2 <- grid[i, param_2]
  
  # use grid parameters to define tested setup
  
  x <- rnorm(n = i_param_1, mean = i_param_2)
  
  tmp <- microbenchmark(
    "Alternative 1" = mean(x),
    "Alternative 2" = sum(x) / length(x),
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

## saving all data
save_benchmark(result_list = result_list,
               best_list = best_list,
               folder = folder,
               start_time = start_time,
               description = description,
               grid = grid,
               reps = reps,
               comments = comments)



