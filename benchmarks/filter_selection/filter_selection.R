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
folder <- "benchmarks/filter_selection/"

# test description
description <- "Selection rows by a filter criterion."

# number of repetitions
reps <- 100L

comments <- "changing the colum type and the number of unique values"

start_time <- Sys.time()



# grid setup --------------------------------------------------------------

# if there are different values to test
grid <- as.data.table(expand.grid(
  n_rows = 10^c(5,6), # number of rows
  k_values = c(5,10,20,100,1000), # number of unique values
  var_type = c("numeric", "character"),
  stringsAsFactors = FALSE)) # type of column

result_list <- as.list(rep(NA, dim(grid)[1]))
best_list <- as.list(rep(NA, dim(grid)[1]))

# benchmark setup ---------------------------------------------------------

# create folder for results
helfRlein::checkdir(folder)

# run for each grid possible

for (i in c(1:nrow(grid))) {
  # i <- 40
  set.seed(1234)
  
  n_rows <- grid[i, n_rows]
  k_values <- grid[i, k_values]
  var_type <- grid[i, var_type]
  
  # use grid parameters to define tested setup
  # set sample values and data
  this_values <- as.vector(x = 1:k_values, mode = var_type)
  this_var <- sample(x = this_values, size = n_rows, replace = TRUE)
  
  data_dt <- data.table(Var1 = this_var)
  #data_df <- data.frame(Var1 = this_var)
  
  tmp <- microbenchmark(
    "DT == &" = data_dt[Var1 == this_values[1] | Var1 == this_values[2] |Var1 == this_values[3],],
    "DT %in%" = data_dt[Var1 %in% this_values[1:3],],
    "DT %chin%"  = data_dt[Var1 %chin% this_values[1:3],],
    times = reps,
    control = list(warmup = 10L),
    unit = "ms")
  
  #tmp <- data.table(summary(tmp), i = grid[i, ])
  result_list[[i]] <- tmp
  
  # select best by mean
  tmp_sum <- summary(tmp)
  best_list[[i]] <- as.character(tmp_sum$expr[tmp_sum$mean == min(tmp_sum$mean)])
  
  # progress
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



