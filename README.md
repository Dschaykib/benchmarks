##Overview of different benchmarks 



For more details on a benchmark, please have a look in the folder 
[benchmarks](../benchmarks).




|DATE                |TEST                                             |BEST            |TIME_FACTOR | BEST_RUNS| GRID|DURATION | REPS|ALTERNATIVES                                                                               |COMMENT                           |
|:-------------------|:------------------------------------------------|:---------------|:-----------|---------:|----:|:--------|----:|:------------------------------------------------------------------------------------------|:---------------------------------|
|2019-10-31 11:25:49 |Accsess a colum in a data frame, table or tible. |$ tbl           |67.5%       |         2|    2|00:00:04 |  100|<details>$ df, $ DT, [[ df, [[ DT, [[ tbl, [,5] df, name df, dplyr pull, DT [,x]</details> |varying size of data              |
|2019-10-31 11:44:58 |assign anything with <- or =                     |equal sign      |1.9%        |         5|    6|00:00:08 |  100|<details>arrow sign</details>                                                              |varying size of vector            |
|2019-10-31 11:49:28 |Calculation of the cross product                 |crossprod(S)    |49.5%       |        10|   10|00:02:38 |  100|<details>t(S) %*% S</details>                                                              |varying number of rows and colums |
|2019-10-31 11:26:06 |get range of numeric vector                      |max(x) - min(x) |49.1%       |         6|    6|00:00:14 |  100|<details>range(x)</details>                                                                |varying size                      |
|2019-10-31 11:26:17 |Creating a sample index.                         |sample          |40.9%       |         3|    5|00:00:11 |  100|<details>runif, rdunif</details>                                                           |varying sample size and range     |
|2019-10-31 11:26:23 |get unique levels of factors                     |unique(x)       |67%         |        16|   16|00:00:05 |  100|<details>droplevels(x)</details>                                                           |                                  |
