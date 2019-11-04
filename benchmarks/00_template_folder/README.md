## An empty template for further benchmarks

The script has the following parts:

- **used libraries**  
Adding need libraries to the script.
  
- **test setup**  
Specify in which *folder* the results are save.  
Give a short *description* of the benchmark.  
Add further *comments* like what parameters did you vary.
  
- **grid setup**  
Define the different setup you want to test. For example the sample size, number of different values, number of columns or rows.

- **benchmark setup**  
This is the main part of the benchmark. The resulting benchmark is saved into `result_list` so that it can be saved and analysed later on. In each iteration the fastest option (by mean timing) is taken and saved within the `best_list`.  
The `microbenchmark` options are not yet standardised, since the repetitions and their timing depend on the used benchmark. Sometimes it is just not feasible to run 1000 repetitions measured in minutes...  
My default settings are `times = 100L`, `control = list(warmup = 10L)` and `unit = "ms"`

- **saving result**  
This part does not need to be changed. It's purpose is to create the standardised overview.
