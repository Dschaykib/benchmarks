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
folder <- "benchmarks/sum_na_or_0/"

# test description
description <- "Is it faster to sum over 0's or NA's."

# number of repetitions
reps <- 100L

comments <- "changing the length and the percentage of NA's and 0's"

start_time <- Sys.time()



# grid setup --------------------------------------------------------------

# if there are different values to test
grid <- as.data.table(expand.grid(
  n_rows = 10^c(6),
  percentage = c(0.1, 0.25, 0.5, 0.75, 0.9),
  stringsAsFactors = FALSE))

result_list <- as.list(rep(NA, dim(grid)[1]))
best_list <- as.list(rep(NA, dim(grid)[1]))

# benchmark setup ---------------------------------------------------------

# create folder for results
helfRlein::checkdir(folder)

# run for each grid possible

for (i in c(1:nrow(grid))) {
  # i <- 1
  
  i_n_rows <- grid[i, n_rows]
  i_percentage <- grid[i, percentage]
  
  # use grid parameters to define tested setup
  x_NA <- x_0 <- rep(x = 1, i_n_rows)
  idx <- sample(x = i_n_rows, size = max(1, round(i_percentage / i_n_rows)))
  x_0[idx] <- 0
  x_NA[idx] <- NA
  
  
  tmp <- microbenchmark(
    "sum with 0" = sum(x_0),
    "sum with 0 and check for NA" = sum(x_0, na.rm = TRUE),
    "sum with NA" = sum(x_NA, na.rm = TRUE),
    "max with 0" = max(x_0),
    "max with 0 and check for NA" = max(x_0, na.rm = TRUE),
    "max with NA" = max(x_NA, na.rm = TRUE),
    "min with 0" = min(x_0),
    "min with 0 and check for NA" = min(x_0, na.rm = TRUE),
    "min with NA" = min(x_NA, na.rm = TRUE),
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



