# used libraries ----------------------------------------------------------

# these are needed
library(microbenchmark)
library(helfRlein)
library(data.table)

sapply(list.files("functions/", full.names = TRUE), source)

# add more here
#

# test setup --------------------------------------------------------------

# folder for results
folder <- "benchmarks/intersect/"

# test description
description <- "Is it faster to intersect or use which."

# number of repetitions
reps <- 100L

comments <- "changing the length and the percentage of fits"

start_time <- Sys.time()



# grid setup --------------------------------------------------------------

# if there are different values to test
grid <- as.data.table(expand.grid(
  n_rows = 10^c(3:6),
  percentage = c(0.1, 0.25, 0.5, 0.75, 0.9),
  var_type = c("numeric", "character"),
  stringsAsFactors = FALSE))
grid <- grid[order(n_rows, decreasing = TRUE)]

result_list <- as.list(rep(NA, dim(grid)[1]))
best_list <- as.list(rep(NA, dim(grid)[1]))

# benchmark setup ---------------------------------------------------------

# create folder for results
helfRlein::checkdir(folder)

# run for each grid possible

i <- 1
for (i in c(1:nrow(grid))) {
  helfRlein::statusbar(run = i, max.run = nrow(grid))
  i_n_rows <- grid[i, n_rows]
  i_percentage <- grid[i, percentage]
  i_var_type <- grid[i, var_type]
  
  # use grid parameters to define tested setup
  x_0 <- seq_len(i_n_rows)
  x_1 <- seq_len(i_n_rows) + round(i_n_rows * (1-i_percentage))
  x_0 <- as.vector(x = x_0, mode = i_var_type)
  x_1 <- as.vector(x = x_0, mode = i_var_type)
  
  
  
  tmp <- microbenchmark(
    "intersect" = intersect(x_0, x_1),
    "which" = x_0[which(x_0 %in% x_1)],
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



