#' @title saving benchmark results
#'
#' @description This functions saves an overview of the benchmark results as
#'   well as appending the logfile
#'
#' @param result_list a list with microbenchmark objects for each grid run
#' @param best_list a list with the best by mean function for each grid run
#' @param folder a folder path were the resutls are stored
#' @param start_time time when the test started
#' @param description the benchmark setup description
#' @param grid a data.table with different setup parameters
#' @param reps an integer with the number of repetitions within microbenchmark
#' @param comments a string with further comments
#'
#' @return
#' @export
#' 
save_benchmark <- function(result_list,
                           best_list,
                           folder,
                           start_time,
                           description,
                           grid,
                           reps,
                           comments) {
  require(ggplot2)
  
  ## saving all data
  saveRDS(object = result_list, file = paste0(folder, "result_list.rds"))
  
  # create time
  used_time <- as.numeric(difftime(Sys.time(), start_time, units = "hours"))
  hours   <- floor(used_time)
  minutes <- floor((used_time - hours) * 60)
  secs    <- floor(((used_time - hours) * 60 - minutes) * 60)
  time_char <- paste0(sprintf("%02d", hours), ":",
                      sprintf("%02d", minutes), ":",
                      sprintf("%02d", secs))
  
  #alternatives <- nrow(summary(result_list[[1]]))
  best <- names(sort(table(unlist(best_list)), decreasing = TRUE)[1])
  best_runs <- as.numeric(sort(table(unlist(best_list)), decreasing = TRUE)[1])
  
  # time saving percent by mean
  get_saving_time <- function(x, best) {
    # x <- result_list[[1]]
    time_dt <- as.data.table(x)
    best_time <- time_dt[expr == best, mean(time)]
    time_saving <- time_dt[expr != best, mean(time),
                           by = expr][, (V1 - best_time) / V1]
    return(mean(time_saving))
  }
  
  time_saving_factor <- mean(sapply(result_list, get_saving_time, best = best))
  time_saving_factor <- paste0(round(time_saving_factor * 100, 1), "%")
  
  # get alternatives
  alternatives <- levels(summary(result_list[[1]])$expr)
  alternatives <- setdiff(alternatives, best)
  alternatives <- paste0(
    "<details>",
    paste0(alternatives, collapse = ", "),
    "</details>")
  
  # details
  details <- paste0("[link](", folder, ")")
  
  # saving last run
  result <- data.table(
    # date with last run
    DATE = Sys.time(),
    # description of the test
    TEST = description,
    # further commentens
    COMMENT = comments,
    # best solution
    BEST = best,
    # percent of mean saved time
    TIME_FACTOR = time_saving_factor,
    # how often was it the best
    BEST_RUNS = paste0(best_runs, "/", nrow(grid)),
    # if different setups are used (eg. variing n)
    #GRID = nrow(grid),
    # number of repetitions
    #REPS = reps,
    # number of tested alternatives
    #ALTERNATIVES = alternatives,
    DETAILS = details,
    # duration of test
    DURATION = time_char
  )
  
  saveRDS(result, file = paste0(folder, "last_result.rds"))
  
  # saving each run into log file
  logfile <- paste0(folder, "log_results.txt")
  append <- file.exists(logfile)
  
  write.table(x = result,
              file = logfile,
              append = append,
              quote = FALSE,
              row.names = FALSE,
              col.names = !append,
              sep = ";",
              dec = ".")
  

# create plots ------------------------------------------------------------
  
  this_unit <- attributes(result_list[[1]])$unit
  
  grid[, INDEX := .I]
  get_mean_time <- function(i.grid, result_list) {
    #i.grid <- 1
    x <- result_list[[i.grid]]
    
    # raw data is in nanoseconds
    time_factor <- switch(this_unit,
                          "ns" = 1e-0, # nanoseconds
                          "us" = 1e-3, # microseconds
                          "ms" = 1e-6, # milliseconds
                          "s"  = 1e-9) # seconds
    
    time_dt <- as.data.table(x)[, list("MEAN_TIME" = mean(time) * time_factor), by = expr]
    time_dt[, INDEX := i.grid]
  }
  mean_dt <- rbindlist(lapply(grid$INDEX, get_mean_time, result_list = result_list),
                       use.names = TRUE,
                       fill = TRUE)
  # merge grid with mean_dt
  grid_mean_dt <- merge(x = grid, y = mean_dt, by = "INDEX", all = TRUE)
  id_vars <- c("INDEX", "expr", "MEAN_TIME")
  measure_vars <- setdiff(names(grid_mean_dt), id_vars)
  measure_vars_class <- grid_mean_dt[, sapply(.SD, class), .SDcol = measure_vars]
  measure_vars_char <- measure_vars[measure_vars_class == "character"]
  measure_vars_num <- measure_vars[measure_vars_class == "numeric"]
  
  grid_mean_dt_long <- melt.data.table(data = grid_mean_dt,
                                       id.vars = c("INDEX", "expr", "MEAN_TIME",
                                                   measure_vars_char),
                                       measure.vars = measure_vars_num,
                                       variable.name = "PARAMETER_NUM",
                                       value.name = "VALUE_NUM")
  grid_mean_dt_long <- melt.data.table(data = grid_mean_dt_long,
                                       id.vars = c("INDEX", "expr", "MEAN_TIME",
                                                   "PARAMETER_NUM",
                                                   "VALUE_NUM"),
                                       measure.vars = measure_vars_char,
                                       variable.name = "PARAMETER_CHAR",
                                       value.name = "VALUE_CHAR")
  
  
  # plot for numerics
  this_picture_num <- this_picture_char <- c()
  if ("VALUE_NUM" %in% names(grid_mean_dt_long)) {
    suppressWarnings(
      ggplot(grid_mean_dt_long, aes(x = VALUE_NUM, y = MEAN_TIME, color = expr)) +
        geom_point() + 
        ylab(paste0("time in ", this_unit)) +
        ggtitle(description) +
        xlab("") +
        stat_summary(aes(group = expr),
                     fun.y = mean, geom = "line") +
        facet_wrap(~PARAMETER_NUM, scales = "free")
    )
    
    this_picture_num <- "benchmark_grid_num.png"
    ggsave(filename = paste0(folder, this_picture_num),
           width = 20,
           height = 8,
           units = "cm")
  }
  
  # plot for characters
  if ("VALUE_CHAR" %in% names(grid_mean_dt_long)) {
    suppressWarnings(
      ggplot(grid_mean_dt_long, aes(x = VALUE_CHAR, y = MEAN_TIME, color = expr)) +
        geom_point() + 
        ylab(paste0("time in ", this_unit)) +
        ggtitle(description) +
        xlab("") +
        stat_summary(aes(group = expr),
                     fun.y = mean, geom = "line") +
        facet_wrap(~PARAMETER_CHAR, scales = "free")
    )
    
    this_picture_char <- "benchmark_grid_char.png"
    ggsave(filename = paste0(folder, this_picture_char),
           width = 20,
           height = 8,
           units = "cm")
  }
  
  
  
# save README -------------------------------------------------------------
  
  readme <- c(
    paste0("## ", description, "\n"),
    "\n",
    "tested alternatives:\n",
    "<ul>",
    paste0(levels(summary(result_list[[1]])$expr), collapse = "</ul><ul>"),
    "</ul>",
    "\n",
    "## used grid settings \n",
    comments,
    "\n",
    knitr::kable(grid, format = "markdown"),
    "\n",
    if (length(this_picture_num) > 0 ) {
      c("## plot per numeric grid parameter \n",
        "![](", this_picture_num,")\n")
    } else {
      c()
    },
    if (length(this_picture_char) > 0 ) {
      c("## plot per character grid parameter \n",
        "![](", this_picture_char,")\n")
    } else {
      c()
    },
    "\n",
    "##  all result summaries \n",
    
    unlist(lapply(seq_len(length(result_list)), function(x) {
      c(paste0("#### index ", x, "\n"),
             knitr::kable(summary(result_list[[x]]), format = "markdown"),
             "\n")
      }
    ))
  )
  
  writeLines(text = readme, con = paste0(folder, "README.md"))
  
  
  # update README -----------------------------------------------------------
  update_bench_overview()
  
}