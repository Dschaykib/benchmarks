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
folder <- "benchmarks/comment_in_function/"

# test description
description <- "commented-out code"

# number of repetitions
reps <- 100L

comments <- "no comments vs. lots of comments"

start_time <- Sys.time()



# grid setup --------------------------------------------------------------

# if there are different values to test
grid <- as.data.table(expand.grid(
  lines_of_comments = c(10, 25, 50, 100, 250, 500, 1000)))

result_list <- as.list(rep(NA, dim(grid)[1]))
best_list <- as.list(rep(NA, dim(grid)[1]))

# benchmark setup ---------------------------------------------------------

# create folder for results
helfRlein::checkdir(folder)

# run for each grid possible

for (i in c(1:nrow(grid))) {
  # i <- 1
  
  i.lines_of_comments <- grid[i, lines_of_comments]
  
  # use grid parameters to define tested setup
  set.seed(i)
  
  no_comments <- function(x = 1){
    y <- rnorm(10000)
  }
  
  if(exists("with_comments")){
    rm("with_comments")
  }
  
  func <- paste0(c("with_comments <- function(x = 1) {",
                   rep("# comment", i.lines_of_comments),
                   "y <- rnorm(10000)",
                   "}"),
                 collapse = "\n")
  eval(parse(text = func))
  
  tmp <- microbenchmark(
    "No comments" = no_comments(),
    "With comments" = with_comments(),
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



