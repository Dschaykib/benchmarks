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
  
  
  # saving last run
  result <- data.table(
    # date with last run
    DATE = Sys.time(),
    # description of the test
    TEST = description,
    # best solution
    BEST = best,
    # percent of mean saved time
    TIME_FACTOR = time_saving_factor,
    # how often was it the best
    BEST_RUNS = best_runs,
    # if different setups are used (eg. variing n)
    GRID = nrow(grid),
    # duration of test
    DURATION = time_char,
    # number of repetitions
    #REPS = reps,
    # number of tested alternatives
    ALTERNATIVES = alternatives,
    # further commentens
    COMMENT = comments
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
  
}