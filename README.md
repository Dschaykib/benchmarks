## Overview of different benchmarks 



This is a collection of benchmark I collected over the years. 
In [this blog post here](https://www.statworx.com/de/blog/) 
I describe what I did and how new benchmarks can be added.
For more results of a benchmark, please have a look in the 
respective folder within [benchmarks](../benchmarks).


- The **DATE** of the last time, the benchmark run.
- A short description **TEST** of the benchmark.
- The **BEST** option out of all tested alternatives compared by their mean time.
- The **TIME_FACTOR** presents the mean time that can be saved with the best option compared with the mean of the alternatives over all grid setups.
- **BEST_RUNS** is the number of cases were **BEST** solution was actually the best one in relation of all different varying setups that were used (e.g. sample size).
- **DURATION** is the time the whole benchmark with all setups took.
- In the **COMMENTS** I tried to give a hint of what the setups looked like.




|DATE                |TEST                                              |COMMENT                                                 |BEST            |TIME_FACTOR |BEST_RUNS |DETAILS                                 |DURATION |
|:-------------------|:-------------------------------------------------|:-------------------------------------------------------|:---------------|:-----------|:---------|:---------------------------------------|:--------|
|2019-11-29 08:53:33 |Accsess a colum in a data frame, table or tibble. |varying size of data                                    |$ tbl           |66.9%       |4/4       |[link](benchmarks/access a data colum/) |00:00:06 |
|2019-11-29 08:53:36 |assign with <- or =                               |varying size of vector                                  |equal sign      |27.4%       |6/6       |[link](benchmarks/assignment/)          |00:00:01 |
|2019-11-29 08:56:19 |Calculation of the cross product                  |varying number of rows and colums                       |crossprod(S)    |12.1%       |9/10      |[link](benchmarks/crossproduct/)        |00:02:42 |
|2019-11-29 08:56:49 |Creating dummies out of factor variable.          |changing size and number of unique values               |by              |49.8%       |7/12      |[link](benchmarks/dummy_creation/)      |00:00:29 |
|2019-11-29 08:58:35 |Selection rows by a filter criterion.             |changing the colum type and the number of unique values |DT %in%         |21.4%       |12/20     |[link](benchmarks/filter_selection/)    |00:01:45 |
|2019-11-29 08:58:51 |get range of numeric vector                       |varying size                                            |max(x) - min(x) |48.4%       |6/6       |[link](benchmarks/range/)               |00:00:14 |
|2019-11-29 08:59:04 |Creating a sample index.                          |varying sample size and range                           |sample          |41.5%       |3/5       |[link](benchmarks/sample index/)        |00:00:12 |
|2019-11-29 08:59:10 |get unique levels of factors                      |varying sample size and number of unique value          |unique(x)       |68.4%       |16/16     |[link](benchmarks/unique_values/)       |00:00:06 |
