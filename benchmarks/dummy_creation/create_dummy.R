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
folder <- "benchmarks/dummy_creation/"

# test description
description <- "Creating dummies out of factor variable."

# number of repetitions
reps <- 100L

comments <- "changing size and number of unique values"

start_time <- Sys.time()



# grid setup --------------------------------------------------------------

# if there are different values to test
grid <- as.data.table(expand.grid(
  sample_size = 10^c(2:5), # number of observations
  unique_values = c(5,10,20))) # number of unique values

result_list <- as.list(rep(NA, dim(grid)[1]))
best_list <- as.list(rep(NA, dim(grid)[1]))

# benchmark setup ---------------------------------------------------------

# create folder for results
helfRlein::checkdir(folder)

# run for each grid possible

for (i in c(1:nrow(grid))) {
  # i <- 1
  
  i.sample_size <- grid[i, sample_size]
  i.unique_values <- grid[i, unique_values]
  
  # use grid parameters to define tested setup
  if (exists("DT")) {
    rm(DT)
  }
  DT <- data.table(Var1 = sample(x = letters[1:i.unique_values],
                                 size = i.sample_size,
                                 replace = TRUE))
  all_values <- DT[, unique(Var1)]
  
  tmp <- microbenchmark(
    "lapply" = DT[, (all_values) := lapply(all_values,
                                           function(x) as.numeric(Var1 == x))],
    "for-loop" = {
      for (i.cat in all_values) {
        # i.cat <- 1
        DT[, c(letters[i.cat]) := as.numeric(Var1 == i.cat)]
        }},
    "by" = DT[, c(all_values) := as.list(as.numeric(all_values == unique(Var1))), by = Var1],
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



