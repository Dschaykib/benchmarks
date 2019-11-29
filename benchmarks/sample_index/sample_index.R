# used libraries ----------------------------------------------------------

# these are needed
library(microbenchmark)
library(helfRlein)
library(data.table)

source("functions/save_benchmark.R")

# add more here
library(purrr)
#
#

# test setup --------------------------------------------------------------

# folder for results
folder <- "benchmarks/sample_index/"

# test description
description <- "Creating a sample index."

# number of repetitions
reps <- 100L

# if there is anything else to say
comments <- "varying sample size and range"

start_time <- Sys.time()



# grid setup --------------------------------------------------------------

# if there are different values to test
grid <- as.data.table(expand.grid(
  # sample size
  sample_size = 10^c(2:6),
  # population size
  population_size = c(10000)))

result_list <- as.list(rep(NA, dim(grid)[1]))
best_list <- as.list(rep(NA, dim(grid)[1]))

# benchmark setup ---------------------------------------------------------

# create folder for results
helfRlein::checkdir(folder)

# run for each grid possible

for (i in c(1:nrow(grid))) {
  # i <- 1
  
  # use grid parameters to define tested setup
  i.sample_size <- grid[i, sample_size]
  i.population_size <- grid[i, population_size]
  
  
  tmp <- microbenchmark(
    "runif" = round(runif(i.sample_size, min = 1, max = i.population_size)),
    "sample" = sample(1:i.population_size, i.sample_size, replace = TRUE),
    "rdunif" = rdunif(i.sample_size, i.population_size, 1),
    times = reps,
    setup = set.seed(i),
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



