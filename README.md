## Overview of different benchmarks 



This is a collection of benchmark I collected over the years. 
In [this blog post here](https://www.statworx.com/de/blog/a-collection-of-benchmarks-in-r/) 
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




|DATE                |TEST                                              |COMMENT                                                 |BEST            |TIME_FACTOR |BEST_RUNS |DETAILS |DURATION |
|:-------------------|:-------------------------------------------------|:-------------------------------------------------------|:---------------|:-----------|:---------|:-------|:--------|
|2024-02-08 20:01:58 |assign with <- or =                               |varying size of vector                                  |arrow sign      |1.2%        |3/6       |[link](benchmarks/assignment/)|00:00:00 |
|2024-02-08 20:02:01 |Accsess a colum in a data frame, table or tibble. |varying size of data                                    |$ df            |76.6%       |4/4       |[link](benchmarks/column_access/)|00:00:02 |
|2024-02-08 20:02:02 |commented-out code                                |no comments vs. lots of comments                        |No comments     |3%          |7/7       |[link](benchmarks/comment_in_function/)|00:00:01 |
|2024-02-08 20:11:29 |Calculation of the cross product                  |varying number of rows and colums                       |crossprod(S)    |16.1%       |7/10      |[link](benchmarks/crossproduct/)|00:01:02 |
|2024-02-08 20:02:13 |Creating dummies out of factor variable.          |changing size and number of unique values               |lapply          |35.1%       |7/12      |[link](benchmarks/dummy_creation/)|00:00:10 |
|2024-02-08 20:03:02 |Selecting rows by a filter criterion.             |changing the colum type and the number of unique values |DT == &         |-205.2%     |22/40     |[link](benchmarks/filter_selection/)|00:00:48 |
|2024-02-08 20:05:11 |Is it faster to intersect or use which.           |changing the length and the percentage of fits          |which           |31%         |39/40     |[link](benchmarks/intersect/)|00:02:08 |
|2024-02-08 20:05:19 |get range of numeric vector                       |varying size                                            |max(x) - min(x) |50.1%       |6/6       |[link](benchmarks/range/)|00:00:07 |
|2024-02-08 20:05:32 |Creating a sample index.                          |varying sample size and range                           |runif           |77.9%       |5/5       |[link](benchmarks/sample_index/)|00:00:12 |
|2024-02-08 20:05:46 |Subset between values of a vector                 |between vs. <= and >=                                   |<=>             |41.7%       |47/64     |[link](benchmarks/subset_between_values/)|00:00:13 |
|2024-02-08 20:06:01 |Is it faster to sum over 0's or NA's.             |changing the length and the percentage of NA's and 0's  |sum with 0      |43.9%       |4/5       |[link](benchmarks/sum_na_or_0/)|00:00:14 |
|2024-02-08 20:06:04 |get unique levels of factors                      |varying sample size and number of unique value          |unique(x)       |67.8%       |16/16     |[link](benchmarks/unique_values/)|00:00:02 |
