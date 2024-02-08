# used libraries ----------------------------------------------------------

# these are needed
library(microbenchmark)
library(helfRlein)
library(data.table)

source("functions/save_benchmark.R")
source("functions/update_bench_overview.R")

# add more here
#

# test setup --------------------------------------------------------------

# folder for results
folder <- "benchmarks/subset_between_values/"

# test description
description <- "Subset between values of a vector"

# number of repetitions
reps <- 100L

comments <- "between vs. <= and >="

start_time <- Sys.time()



# grid setup --------------------------------------------------------------

# if there are different values to test
grid <- as.data.table(expand.grid(
  length_of_vector = 10^c(2:5),
  type = c("integer", "Date"),#, "character"),
  randomized = c(TRUE, FALSE),
  range = c(0.1, 0.3, 0.5, 0.8),
  stringsAsFactors = FALSE))

result_list <- as.list(rep(NA, dim(grid)[1]))
best_list <- as.list(rep(NA, dim(grid)[1]))

# benchmark setup ---------------------------------------------------------

# create folder for results
helfRlein::checkdir(folder)

# run for each grid possible

for (i in c(1:nrow(grid))) {
  
  i.nval <- grid[i, length_of_vector]
  i.type <- grid[i, type]
  i.rand <- grid[i, randomized]
  i.range <- grid[i, range]
  
  # use grid parameters to define tested setup
  
  x <- 1:i.nval
  
  if(i.type == "Date"){
    x <- as.Date(x, origin = Sys.Date())
  }
  
  # if(i.type == "character"){
  #   x <- as.character(x)
  # } else if(i.type == "Date"){
  #   x <- as.Date(x, origin = Sys.Date())
  # }
  
  if(i.rand){
    set.seed(2019)
    x <- sample(x)
  }
  
  this.lower <- floor(length(x)*(0.5 - (i.range/2)))
  this.upper <- ceiling(length(x)*(0.5 + (i.range/2)))
  
  # catch 0 index (can happen if nval = 10 and range = 0.8)
  if(this.lower == 0){
    this.lower <- 1
  }
  
  tmp <- microbenchmark(
    "DT_between" = subset(x, data.table::between(x, lower = x[this.lower], upper = x[this.upper])),
    "dplyr_between" = subset(x, dplyr::between(x, left = x[this.lower], right = x[this.upper])),
    "<=>" = subset(x, x <= this.lower & x >= this.upper),
    times = reps,
    control = list(warmup = 10L),
    unit = "ms")
  
  #tmp <- data.table(summary(tmp), i = grid[i, ])
  result_list[[i]] <- tmp
  
  # select best by mean
  tmp_sum <- summary(tmp)
  best_list[[i]] <- as.character(tmp_sum$expr[tmp_sum$mean == min(tmp_sum$mean)])
  
  statusbar(run = i, max.run = nrow(grid))
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
