# used libraries ----------------------------------------------------------

# these are needed
library(microbenchmark)
library(helfRlein)
library(data.table)

source("functions/save_benchmark.R")

# add more here
library(dplyr)
#

# test setup --------------------------------------------------------------

# folder for results
folder <- "benchmarks/access a data colum/"

# test description
description <- "Accsess a colum in a data frame, table or tible."

# number of repetitions
reps <- 100L

# if there is anything else to say
comments <- "varying size of data"


start_time <- Sys.time()



# grid setup --------------------------------------------------------------

# if there are different values to test
grid <- as.data.table(expand.grid(
  param_1 = 10^c(2:5)))

result_list <- as.list(rep(NA, dim(grid)[1]))
best_list <- as.list(rep(NA, dim(grid)[1]))


my_check <- function(values) {
  all(sapply(values[-1], function(x) identical(values[[1]], x)))
}


# benchmark setup ---------------------------------------------------------

# create folder for results
helfRlein::checkdir(folder)

# run for each grid possible

for (i in c(1:nrow(grid))) {
  # i <- 1
  
  i_param_1 <- grid[i, param_1]
  
  # use grid parameters to define tested setup
  iris.rep <- rbindlist(rep(list(iris), i_param_1))
  
  iris.df <- as.data.frame(iris.rep)
  iris.dt <- as.data.table(iris.rep)
  iris.tbl <- as_tibble(iris.df)
  
  tmp <- microbenchmark(
    "$ df" = iris.df$Species,
    "$ DT" = iris.dt$Species,
    "$ tbl" = iris.tbl$Species,
    "[[ df" = iris.df[["Species"]],
    "[[ DT" = iris.dt[["Species"]],
    "[[ tbl" = iris.tbl[["Species"]],
    "[,5] df" = iris.df[, 5],
    #"[,5] DT" = iris.dt[, 5], # DT
    #"[,5] tbl" = iris.tbl[, 5], # tbl
    "name df" = iris.df[, "Species"],
    #"name DT" = iris.dt[, "Species"], # DT
    #"name tbl" = iris.tbl[, "Species"], # tbl
    "dplyr pull" = pull(iris.df, Species),
    "DT [,x]" = iris.dt[,Species],
    #"DT .SD" = iris.dt[,.SD, .SDcol = "Species"], # DT
    times = reps,
    check = my_check,
    unit = "ms",
    control = list(warmup = 10))
  
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
