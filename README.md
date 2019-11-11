##Overview of different benchmarks 



For more details on a benchmark, please have a look in the folder 
[benchmarks](../benchmarks).




|DATE                |TEST                                             |BEST            |TIME_FACTOR | BEST_RUNS| GRID|DURATION |ALTERNATIVES                                                                               |COMMENT                                                 | REPS|
|:-------------------|:------------------------------------------------|:---------------|:-----------|---------:|----:|:--------|:------------------------------------------------------------------------------------------|:-------------------------------------------------------|----:|
|2019-11-11 16:47:44 |Accsess a colum in a data frame, table or tible. |$ tbl           |67%         |         3|    4|00:00:06 |<details>$ df, $ DT, [[ df, [[ DT, [[ tbl, [,5] df, name df, dplyr pull, DT [,x]</details> |varying size of data                                    |   NA|
|2019-11-11 16:47:46 |assign with <- or =                              |equal sign      |8.3%        |         5|    6|00:00:01 |<details>arrow sign</details>                                                              |varying size of vector                                  |   NA|
|2019-10-31 11:49:28 |Calculation of the cross product                 |crossprod(S)    |49.5%       |        10|   10|00:02:38 |<details>t(S) %*% S</details>                                                              |varying number of rows and colums                       |  100|
|2019-11-11 16:48:15 |Creating dummies out of factor variable.         |by              |50.8%       |         7|   12|00:00:28 |<details>lapply, for-loop</details>                                                        |changing size and number of unique values               |   NA|
|2019-11-11 16:50:02 |Selection rows by a filter criterion.            |DT %in%         |21.7%       |        13|   20|00:01:45 |<details>DT == &, DT %chin%</details>                                                      |changing the colum type and the number of unique values |   NA|
|2019-11-11 16:50:19 |get range of numeric vector                      |max(x) - min(x) |57.1%       |         6|    6|00:00:16 |<details>range(x)</details>                                                                |varying size                                            |   NA|
|2019-11-11 16:50:31 |Creating a sample index.                         |sample          |40%         |         3|    5|00:00:11 |<details>runif, rdunif</details>                                                           |varying sample size and range                           |   NA|
|2019-11-11 16:50:39 |get unique levels of factors                     |unique(x)       |67.4%       |        16|   16|00:00:06 |<details>droplevels(x)</details>                                                           |                                                        |   NA|
