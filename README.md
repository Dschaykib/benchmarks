## Overview of different benchmarks 



This is a collection of benchmark I collected over the years. 
In [this blog post here](https://www.statworx.com/de/blog/) 
I describe what I did and how new benchmarks can be added.
For more results of a benchmark, please have a look in the 
respective folder within [benchmarks](../benchmarks).


- The **DATE** of the last time, the benchmark run.
- A short description **TEST** of the benchmark.
- In the **COMMENTS** I tried to give a hint of what the setups looked like.
- The **BEST** option out of all tested alternatives compared by their mean time.
- The **TIME_FACTOR** presents the mean time that can be saved with the best
    option compared with the mean of the alternatives over all grid setups. 
    **Note:** The time factor can be negative if the best option is not the
    best in the cases where it takes more time. For these cases, have a look at
    the details and dependencies of the grid parameters.
- **BEST_RUNS** is the number of cases were **BEST** solution was actually
    the best one in relation of all different varying setups that were used (e.g. sample size).
- **DURATION** is the time the whole benchmark with all setups took.




|DATE                |TEST                                              |COMMENT                                                 |BEST            |TIME_FACTOR |BEST_RUNS |DETAILS                                   |DURATION |
|:-------------------|:-------------------------------------------------|:-------------------------------------------------------|:---------------|:-----------|:---------|:-----------------------------------------|:--------|
|2019-12-06 10:46:47 |assign with <- or =                               |varying size of vector                                  |arrow sign      |-0.6%       |3/6       |[link](benchmarks/assignment/)            |00:00:02 |
|2019-12-06 10:47:18 |Accsess a colum in a data frame, table or tibble. |varying size of data                                    |$ df            |58%         |4/4       |[link](benchmarks/column_access/)         |00:00:25 |
|2019-12-06 10:47:45 |commented-out code                                |no comments vs. lots of comments                        |No comments     |2.4%        |7/7       |[link](benchmarks/comment_in_function/)   |00:00:03 |
|2019-12-06 10:50:18 |Calculation of the cross product                  |varying number of rows and colums                       |crossprod(S)    |24.3%       |9/10      |[link](benchmarks/crossproduct/)          |00:02:32 |
|2019-12-06 10:50:46 |Creating dummies out of factor variable.          |changing size and number of unique values               |by              |50.6%       |6/12      |[link](benchmarks/dummy_creation/)        |00:00:27 |
|2019-12-06 16:05:41 |Selecting rows by a filter criterion.             |changing the colum type and the number of unique values |DT == &         |-147.7%     |24/40     |[link](benchmarks/filter_selection/)      |00:01:56 |
|2019-12-06 10:52:47 |get range of numeric vector                       |varying size                                            |max(x) - min(x) |49.9%       |6/6       |[link](benchmarks/range/)                 |00:00:15 |
|2019-12-06 10:53:07 |Creating a sample index.                          |varying sample size and range                           |runif           |11.6%       |5/5       |[link](benchmarks/sample_index/)          |00:00:18 |
|2019-12-09 15:02:30 |Subset between values of a vector                 |between vs. <= and >=                                   |dplyr_between   |0.3%        |29/64     |[link](benchmarks/subset_between_values/) |00:00:32 |
|2019-12-06 10:53:15 |get unique levels of factors                      |varying sample size and number of unique value          |unique(x)       |64.6%       |16/16     |[link](benchmarks/unique_values/)         |00:00:07 |
