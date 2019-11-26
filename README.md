## Overview of different benchmarks 



For more details on a benchmark, please have a look in the folder 
[benchmarks](../benchmarks).




|DATE                |TEST                                             |BEST            |TIME_FACTOR |BEST_RUNS |DURATION |ALTERNATIVES                                                                               |COMMENT                                                 |
|:-------------------|:------------------------------------------------|:---------------|:-----------|:---------|:--------|:------------------------------------------------------------------------------------------|:-------------------------------------------------------|
|2019-11-26 16:40:00 |Accsess a colum in a data frame, table or tible. |$ tbl           |67.6%       |4/4       |00:00:06 |<details>$ df, $ DT, [[ df, [[ DT, [[ tbl, [,5] df, name df, dplyr pull, DT [,x]</details> |varying size of data                                    |
|2019-11-26 16:40:02 |assign with <- or =                              |equal sign      |14.6%       |6/6       |00:00:01 |<details>arrow sign</details>                                                              |varying size of vector                                  |
|2019-11-26 16:51:39 |Calculation of the cross product                 |crossprod(S)    |47.9%       |10/10     |00:02:47 |<details>t(S) %*% S</details>                                                              |varying number of rows and colums                       |
|2019-11-26 16:40:32 |Creating dummies out of factor variable.         |by              |53.3%       |8/12      |00:00:29 |<details>lapply, for-loop</details>                                                        |changing size and number of unique values               |
|2019-11-26 16:42:20 |Selection rows by a filter criterion.            |DT %chin%       |19.3%       |10/20     |00:01:46 |<details>DT == &, DT %in%</details>                                                        |changing the colum type and the number of unique values |
|2019-11-26 16:42:36 |get range of numeric vector                      |max(x) - min(x) |49.3%       |6/6       |00:00:15 |<details>range(x)</details>                                                                |varying size                                            |
|2019-11-26 16:42:48 |Creating a sample index.                         |sample          |43.2%       |4/5       |00:00:11 |<details>runif, rdunif</details>                                                           |varying sample size and range                           |
|2019-11-26 16:42:54 |get unique levels of factors                     |unique(x)       |67.8%       |16/16     |00:00:05 |<details>droplevels(x)</details>                                                           |                                                        |
