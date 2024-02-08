# used libraries ----------------------------------------------------------

# these are needed
library(microbenchmark)
library(helfRlein)
library(data.table)

sapply(list.files("functions/", full.names = TRUE), source)
# add more here
#
#
#

# test setup --------------------------------------------------------------

# folder for results
folder <- "benchmarks/crossproduct/"

# test description
description <- "Calculation of the cross product"

# number of repetitions
reps <- 50L

comments <- "varying number of rows and colums"

start_time <- Sys.time()



# grid setup --------------------------------------------------------------

# if there are different values to test
grid <- as.data.table(expand.grid(
  # number of rows
  row_num = 10^c(1:5),
  # number of columns
  col_num = 10^c(1:2)))

result_list <- as.list(rep(NA, dim(grid)[1]))
best_list <- as.list(rep(NA, dim(grid)[1]))

# benchmark setup ---------------------------------------------------------

# create folder for results
helfRlein::checkdir(folder)

# run for each grid possible

for (i in c(1:nrow(grid))) {
  # i <- 10
  
  i.row_num <- grid[i, row_num]
  i.col_num <- grid[i, col_num]
  
  # use grid parameters to define tested setup
  
  S <- matrix(runif(i.row_num * i.col_num),
              nrow = i.row_num,
              ncol = i.col_num)
  
  
  tmp <- microbenchmark(
    crossprod(S),
    t(S) %*% S,
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



