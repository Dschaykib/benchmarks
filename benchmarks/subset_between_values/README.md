## Subset between values of a vector



tested alternatives:

<ul>
DT_between</ul><ul>dplyr_between</ul><ul><=>
</ul>


## used grid settings 

between vs. <= and >=


| length_of_vector|type    |randomized | range| INDEX|
|----------------:|:-------|:----------|-----:|-----:|
|            1e+02|integer |TRUE       |   0.1|     1|
|            1e+03|integer |TRUE       |   0.1|     2|
|            1e+04|integer |TRUE       |   0.1|     3|
|            1e+05|integer |TRUE       |   0.1|     4|
|            1e+02|Date    |TRUE       |   0.1|     5|
|            1e+03|Date    |TRUE       |   0.1|     6|
|            1e+04|Date    |TRUE       |   0.1|     7|
|            1e+05|Date    |TRUE       |   0.1|     8|
|            1e+02|integer |FALSE      |   0.1|     9|
|            1e+03|integer |FALSE      |   0.1|    10|
|            1e+04|integer |FALSE      |   0.1|    11|
|            1e+05|integer |FALSE      |   0.1|    12|
|            1e+02|Date    |FALSE      |   0.1|    13|
|            1e+03|Date    |FALSE      |   0.1|    14|
|            1e+04|Date    |FALSE      |   0.1|    15|
|            1e+05|Date    |FALSE      |   0.1|    16|
|            1e+02|integer |TRUE       |   0.3|    17|
|            1e+03|integer |TRUE       |   0.3|    18|
|            1e+04|integer |TRUE       |   0.3|    19|
|            1e+05|integer |TRUE       |   0.3|    20|
|            1e+02|Date    |TRUE       |   0.3|    21|
|            1e+03|Date    |TRUE       |   0.3|    22|
|            1e+04|Date    |TRUE       |   0.3|    23|
|            1e+05|Date    |TRUE       |   0.3|    24|
|            1e+02|integer |FALSE      |   0.3|    25|
|            1e+03|integer |FALSE      |   0.3|    26|
|            1e+04|integer |FALSE      |   0.3|    27|
|            1e+05|integer |FALSE      |   0.3|    28|
|            1e+02|Date    |FALSE      |   0.3|    29|
|            1e+03|Date    |FALSE      |   0.3|    30|
|            1e+04|Date    |FALSE      |   0.3|    31|
|            1e+05|Date    |FALSE      |   0.3|    32|
|            1e+02|integer |TRUE       |   0.5|    33|
|            1e+03|integer |TRUE       |   0.5|    34|
|            1e+04|integer |TRUE       |   0.5|    35|
|            1e+05|integer |TRUE       |   0.5|    36|
|            1e+02|Date    |TRUE       |   0.5|    37|
|            1e+03|Date    |TRUE       |   0.5|    38|
|            1e+04|Date    |TRUE       |   0.5|    39|
|            1e+05|Date    |TRUE       |   0.5|    40|
|            1e+02|integer |FALSE      |   0.5|    41|
|            1e+03|integer |FALSE      |   0.5|    42|
|            1e+04|integer |FALSE      |   0.5|    43|
|            1e+05|integer |FALSE      |   0.5|    44|
|            1e+02|Date    |FALSE      |   0.5|    45|
|            1e+03|Date    |FALSE      |   0.5|    46|
|            1e+04|Date    |FALSE      |   0.5|    47|
|            1e+05|Date    |FALSE      |   0.5|    48|
|            1e+02|integer |TRUE       |   0.8|    49|
|            1e+03|integer |TRUE       |   0.8|    50|
|            1e+04|integer |TRUE       |   0.8|    51|
|            1e+05|integer |TRUE       |   0.8|    52|
|            1e+02|Date    |TRUE       |   0.8|    53|
|            1e+03|Date    |TRUE       |   0.8|    54|
|            1e+04|Date    |TRUE       |   0.8|    55|
|            1e+05|Date    |TRUE       |   0.8|    56|
|            1e+02|integer |FALSE      |   0.8|    57|
|            1e+03|integer |FALSE      |   0.8|    58|
|            1e+04|integer |FALSE      |   0.8|    59|
|            1e+05|integer |FALSE      |   0.8|    60|
|            1e+02|Date    |FALSE      |   0.8|    61|
|            1e+03|Date    |FALSE      |   0.8|    62|
|            1e+04|Date    |FALSE      |   0.8|    63|
|            1e+05|Date    |FALSE      |   0.8|    64|


## plot per numeric grid parameter 

![](
benchmark_grid_num.png
)

## plot per character grid parameter 

![](
benchmark_grid_char.png
)



##  all result summaries 

#### index 1

|expr          |      min|       lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|--------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.004305| 0.004674| 0.0054743| 0.0050430| 0.0052480| 0.042886|   100|
|dplyr_between | 0.023370| 0.023985| 0.0281231| 0.0247025| 0.0254815| 0.318283|   100|
|<=>           | 0.002009| 0.002173| 0.0025695| 0.0022960| 0.0025420| 0.007626|   100|


#### index 2

|expr          |      min|        lq|      mean|   median|       uq|      max| neval|
|:-------------|--------:|---------:|---------:|--------:|--------:|--------:|-----:|
|DT_between    | 0.007667| 0.0083640| 0.0093562| 0.008610| 0.009225| 0.024354|   100|
|dplyr_between | 0.029930| 0.0310985| 0.0341698| 0.031980| 0.036572| 0.074989|   100|
|<=>           | 0.007544| 0.0083230| 0.0094542| 0.008569| 0.009184| 0.016113|   100|


#### index 3

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.068388| 0.0706020| 0.0753318| 0.0735335| 0.0769160| 0.104919|   100|
|dplyr_between | 0.163385| 0.1673825| 0.1754144| 0.1712160| 0.1769560| 0.252109|   100|
|<=>           | 0.100450| 0.1035660| 0.1100994| 0.1066820| 0.1120735| 0.146534|   100|


#### index 4

|expr          |      min|       lq|      mean|    median|       uq|       max| neval|
|:-------------|--------:|--------:|---------:|---------:|--------:|---------:|-----:|
|DT_between    | 0.716229| 0.838204| 1.3307579| 0.8671295| 0.942631| 41.730661|   100|
|dplyr_between | 0.949396| 1.274260| 1.3761720| 1.3399210| 1.462409|  2.793576|   100|
|<=>           | 0.712826| 0.914464| 0.9984156| 0.9797565| 1.033303|  2.380173|   100|


#### index 5

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.020541| 0.0313035| 0.0399102| 0.0364080| 0.0400160| 0.344646|   100|
|dplyr_between | 0.120458| 0.1662755| 0.1857124| 0.1793135| 0.1912035| 0.687406|   100|
|<=>           | 0.006806| 0.0116850| 0.0158977| 0.0157235| 0.0183680| 0.034522|   100|


#### index 6

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.023124| 0.0267320| 0.0293158| 0.0280030| 0.0297045| 0.086223|   100|
|dplyr_between | 0.090036| 0.0978260| 0.1017632| 0.0994865| 0.1023565| 0.179580|   100|
|<=>           | 0.012710| 0.0151085| 0.0169174| 0.0170150| 0.0184090| 0.026773|   100|


#### index 7

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.111438| 0.1315895| 0.1394193| 0.1358125| 0.1421265| 0.216480|   100|
|dplyr_between | 0.233167| 0.2688985| 0.2813030| 0.2774675| 0.2884555| 0.394502|   100|
|<=>           | 0.094587| 0.1142055| 0.1212792| 0.1188590| 0.1235740| 0.233495|   100|


#### index 8

|expr          |      min|        lq|     mean|    median|       uq|       max| neval|
|:-------------|--------:|---------:|--------:|---------:|--------:|---------:|-----:|
|DT_between    | 0.692654| 0.9258415| 1.029738| 0.9564890| 1.029367|  1.970952|   100|
|dplyr_between | 1.233403| 1.5827845| 2.187439| 1.6563590| 1.800515| 37.710611|   100|
|<=>           | 0.743986| 0.9174570| 1.096143| 0.9486375| 1.036091|  2.033641|   100|


#### index 9

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.004100| 0.0044690| 0.0049975| 0.0047560| 0.0050430| 0.012013|   100|
|dplyr_between | 0.022632| 0.0233495| 0.0250231| 0.0238415| 0.0247435| 0.078843|   100|
|<=>           | 0.002009| 0.0022345| 0.0027806| 0.0023370| 0.0029520| 0.008282|   100|


#### index 10

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.008405| 0.0092045| 0.0130995| 0.0103320| 0.0115825| 0.118449|   100|
|dplyr_between | 0.032636| 0.0352600| 0.0402284| 0.0369205| 0.0386425| 0.125665|   100|
|<=>           | 0.008364| 0.0088560| 0.0112291| 0.0098605| 0.0114185| 0.055719|   100|


#### index 11

|expr          |      min|        lq|      mean|    median|       uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|--------:|--------:|-----:|
|DT_between    | 0.041820| 0.0898515| 0.0894415| 0.0946895| 0.099097| 0.165476|   100|
|dplyr_between | 0.105124| 0.2008180| 0.2218727| 0.2304405| 0.247230| 0.343006|   100|
|<=>           | 0.065887| 0.0846035| 0.1285998| 0.1421880| 0.147231| 0.222876|   100|


#### index 12

|expr          |      min|        lq|      mean|    median|        uq|       max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|---------:|-----:|
|DT_between    | 0.382366| 0.4801305| 0.5554733| 0.5130945| 0.6296575|  1.236355|   100|
|dplyr_between | 0.967641| 1.0861310| 1.7615441| 1.1707755| 1.3783790| 51.553933|   100|
|<=>           | 0.716270| 0.8006275| 0.9046420| 0.8563055| 0.9699780|  1.803344|   100|


#### index 13

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.016154| 0.0169535| 0.0177928| 0.0174045| 0.0181220| 0.037515|   100|
|dplyr_between | 0.079130| 0.0809135| 0.0831890| 0.0822665| 0.0834555| 0.159367|   100|
|<=>           | 0.006396| 0.0067035| 0.0071955| 0.0069700| 0.0072570| 0.016564|   100|


#### index 14

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.023944| 0.0253995| 0.0270948| 0.0261375| 0.0272445| 0.065723|   100|
|dplyr_between | 0.091184| 0.0939720| 0.0963627| 0.0950995| 0.0967395| 0.147313|   100|
|<=>           | 0.012710| 0.0145755| 0.0157907| 0.0152930| 0.0160720| 0.063878|   100|


#### index 15

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.091471| 0.0945665| 0.1021941| 0.0980925| 0.1062720| 0.155431|   100|
|dplyr_between | 0.194996| 0.2001825| 0.2185698| 0.2082800| 0.2428020| 0.283761|   100|
|<=>           | 0.079130| 0.0820000| 0.0893148| 0.0841115| 0.0922295| 0.125706|   100|


#### index 16

|expr          |      min|        lq|      mean|    median|       uq|       max| neval|
|:-------------|--------:|---------:|---------:|---------:|--------:|---------:|-----:|
|DT_between    | 0.708439| 0.8388395| 0.9119790| 0.8605900| 0.999129|  1.125286|   100|
|dplyr_between | 1.263415| 1.3898795| 1.9891310| 1.4339135| 1.741803| 46.584364|   100|
|<=>           | 0.730866| 0.7854165| 0.8610086| 0.8075155| 0.968379|  1.046566|   100|


#### index 17

|expr          |      min|        lq|      mean|    median|       uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|--------:|--------:|-----:|
|DT_between    | 0.003854| 0.0044280| 0.0049155| 0.0046330| 0.004838| 0.024887|   100|
|dplyr_between | 0.022345| 0.0227345| 0.0237324| 0.0229395| 0.023329| 0.067855|   100|
|<=>           | 0.001968| 0.0021320| 0.0023251| 0.0022345| 0.002378| 0.004428|   100|


#### index 18

|expr          |      min|       lq|      mean|   median|       uq|      max| neval|
|:-------------|--------:|--------:|---------:|--------:|--------:|--------:|-----:|
|DT_between    | 0.007913| 0.011767| 0.0140581| 0.015088| 0.016523| 0.024764|   100|
|dplyr_between | 0.031652| 0.043050| 0.0478441| 0.048298| 0.055801| 0.070725|   100|
|<=>           | 0.008159| 0.012587| 0.0176325| 0.016728| 0.024231| 0.037884|   100|


#### index 19

|expr          |      min|        lq|      mean|   median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|--------:|---------:|--------:|-----:|
|DT_between    | 0.064985| 0.0698025| 0.0743465| 0.072939| 0.0762600| 0.103648|   100|
|dplyr_between | 0.119269| 0.1343570| 0.1421864| 0.137596| 0.1448530| 0.211970|   100|
|<=>           | 0.078187| 0.0846035| 0.0882800| 0.086592| 0.0896055| 0.112873|   100|


#### index 20

|expr          |      min|        lq|      mean|    median|        uq|       max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|---------:|-----:|
|DT_between    | 0.593229| 0.6779965| 1.0100346| 0.6898865| 0.7073320| 32.437478|   100|
|dplyr_between | 0.926067| 0.9837950| 1.0174609| 1.0058120| 1.0373820|  1.504536|   100|
|<=>           | 0.706430| 0.7479220| 0.7769828| 0.7678685| 0.7989875|  0.889987|   100|


#### index 21

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.016769| 0.0174455| 0.0189408| 0.0180400| 0.0187370| 0.064616|   100|
|dplyr_between | 0.081262| 0.0835375| 0.0881024| 0.0846650| 0.0865920| 0.151208|   100|
|<=>           | 0.006355| 0.0069085| 0.0082713| 0.0072365| 0.0078105| 0.060762|   100|


#### index 22

|expr          |      min|        lq|      mean|   median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|--------:|---------:|--------:|-----:|
|DT_between    | 0.022263| 0.0228780| 0.0241941| 0.023247| 0.0237800| 0.064001|   100|
|dplyr_between | 0.087084| 0.0888880| 0.0920352| 0.090077| 0.0927625| 0.150183|   100|
|<=>           | 0.012382| 0.0127305| 0.0135062| 0.012956| 0.0134275| 0.019065|   100|


#### index 23

|expr          |      min|       lq|      mean|    median|       uq|      max| neval|
|:-------------|--------:|--------:|---------:|---------:|--------:|--------:|-----:|
|DT_between    | 0.094382| 0.099056| 0.1032737| 0.1016800| 0.104755| 0.140097|   100|
|dplyr_between | 0.197128| 0.208813| 0.2160811| 0.2122365| 0.221277| 0.278677|   100|
|<=>           | 0.080278| 0.084255| 0.0871480| 0.0860180| 0.088560| 0.109552|   100|


#### index 24

|expr          |      min|        lq|      mean|    median|       uq|       max| neval|
|:-------------|--------:|---------:|---------:|---------:|--------:|---------:|-----:|
|DT_between    | 0.620166| 0.7449905| 0.8610180| 0.7757405| 0.890520|  1.246400|   100|
|dplyr_between | 1.016185| 1.2452110| 1.8077474| 1.3038615| 1.573129| 35.235523|   100|
|<=>           | 0.631113| 0.7298000| 0.8129324| 0.7540105| 0.804584|  1.209828|   100|


#### index 25

|expr          |      min|       lq|      mean|   median|        uq|      max| neval|
|:-------------|--------:|--------:|---------:|--------:|---------:|--------:|-----:|
|DT_between    | 0.004182| 0.004510| 0.0049249| 0.004756| 0.0049815| 0.013325|   100|
|dplyr_between | 0.022714| 0.023247| 0.0243585| 0.023452| 0.0237800| 0.074743|   100|
|<=>           | 0.001968| 0.002173| 0.0024498| 0.002296| 0.0025010| 0.008200|   100|


#### index 26

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.008774| 0.0095530| 0.0112758| 0.0101885| 0.0116030| 0.032841|   100|
|dplyr_between | 0.033210| 0.0348705| 0.0391189| 0.0365720| 0.0395240| 0.086100|   100|
|<=>           | 0.008323| 0.0087330| 0.0105989| 0.0091635| 0.0113775| 0.035055|   100|


#### index 27

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.047765| 0.0583840| 0.0610019| 0.0597985| 0.0628530| 0.076096|   100|
|dplyr_between | 0.132922| 0.1379855| 0.1467599| 0.1407940| 0.1476205| 0.228944|   100|
|<=>           | 0.065559| 0.0818975| 0.0851787| 0.0837220| 0.0856080| 0.136571|   100|


#### index 28

|expr          |      min|        lq|      mean|   median|        uq|       max| neval|
|:-------------|--------:|---------:|---------:|--------:|---------:|---------:|-----:|
|DT_between    | 0.485399| 0.5019220| 0.5176168| 0.509302| 0.5265015|  0.643659|   100|
|dplyr_between | 1.000687| 1.0440240| 1.3462494| 1.067989| 1.1058930| 27.669547|   100|
|<=>           | 0.716516| 0.7382255| 0.7669940| 0.752760| 0.7933705|  0.936194|   100|


#### index 29

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.016236| 0.0169535| 0.0176829| 0.0173635| 0.0179785| 0.036121|   100|
|dplyr_between | 0.078392| 0.0798885| 0.0821972| 0.0806265| 0.0818975| 0.163631|   100|
|<=>           | 0.006191| 0.0066010| 0.0072808| 0.0068880| 0.0074825| 0.017425|   100|


#### index 30

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.023001| 0.0239235| 0.0284917| 0.0248050| 0.0323695| 0.064247|   100|
|dplyr_between | 0.089626| 0.0920040| 0.1027210| 0.1035455| 0.1092035| 0.150183|   100|
|<=>           | 0.012423| 0.0130585| 0.0176944| 0.0164615| 0.0215455| 0.029479|   100|


#### index 31

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.096186| 0.1010240| 0.1055242| 0.1034840| 0.1070510| 0.157276|   100|
|dplyr_between | 0.201105| 0.2078700| 0.2155042| 0.2142455| 0.2178740| 0.283228|   100|
|<=>           | 0.079417| 0.0830455| 0.0853312| 0.0846650| 0.0861615| 0.104714|   100|


#### index 32

|expr          |      min|        lq|      mean|    median|        uq|       max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|---------:|-----:|
|DT_between    | 0.707168| 0.8353135| 1.1774179| 0.8463835| 0.8783430| 32.906764|   100|
|dplyr_between | 1.087402| 1.3257145| 1.3703049| 1.3609130| 1.4021590|  1.664231|   100|
|<=>           | 0.656533| 0.7237320| 0.7507366| 0.7358270| 0.7686475|  0.999826|   100|


#### index 33

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.004059| 0.0043460| 0.0048851| 0.0046330| 0.0047970| 0.025748|   100|
|dplyr_between | 0.022468| 0.0229805| 0.0240518| 0.0232675| 0.0236160| 0.073759|   100|
|<=>           | 0.001927| 0.0020910| 0.0023419| 0.0022140| 0.0023575| 0.005781|   100|


#### index 34

|expr          |      min|       lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|--------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.008282| 0.008733| 0.0104587| 0.0090610| 0.0100450| 0.043911|   100|
|dplyr_between | 0.031488| 0.033087| 0.0372895| 0.0343375| 0.0370435| 0.091471|   100|
|<=>           | 0.007954| 0.008692| 0.0094927| 0.0088150| 0.0090815| 0.024887|   100|


#### index 35

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.056252| 0.0641445| 0.0657078| 0.0653335| 0.0667890| 0.075440|   100|
|dplyr_between | 0.098605| 0.1198225| 0.1223887| 0.1219340| 0.1243530| 0.154078|   100|
|<=>           | 0.064288| 0.0775720| 0.0788065| 0.0788020| 0.0803805| 0.100983|   100|


#### index 36

|expr          |      min|        lq|      mean|   median|        uq|       max| neval|
|:-------------|--------:|---------:|---------:|--------:|---------:|---------:|-----:|
|DT_between    | 0.386589| 0.4741650| 0.9601195| 0.523652| 0.6408095| 40.212923|   100|
|dplyr_between | 0.806183| 0.9927945| 1.2041659| 1.093983| 1.3122665|  1.960743|   100|
|<=>           | 0.643003| 0.7667820| 0.9097269| 0.843370| 1.1564255|  1.297363|   100|


#### index 37

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.016113| 0.0167895| 0.0181720| 0.0173840| 0.0182450| 0.057810|   100|
|dplyr_between | 0.078515| 0.0804625| 0.0836527| 0.0817745| 0.0841115| 0.142762|   100|
|<=>           | 0.006273| 0.0066830| 0.0072127| 0.0069905| 0.0074825| 0.013899|   100|


#### index 38

|expr          |      min|        lq|      mean|   median|       uq|      max| neval|
|:-------------|--------:|---------:|---------:|--------:|--------:|--------:|-----:|
|DT_between    | 0.022468| 0.0230420| 0.0243823| 0.023452| 0.023903| 0.067486|   100|
|dplyr_between | 0.088478| 0.0895645| 0.0921770| 0.090364| 0.091676| 0.149199|   100|
|<=>           | 0.012300| 0.0127715| 0.0131175| 0.012997| 0.013284| 0.018778|   100|


#### index 39

|expr          |      min|       lq|      mean|    median|       uq|      max| neval|
|:-------------|--------:|--------:|---------:|---------:|--------:|--------:|-----:|
|DT_between    | 0.077777| 0.091430| 0.0936124| 0.0923935| 0.094915| 0.115989|   100|
|dplyr_between | 0.169084| 0.196308| 0.2002870| 0.1985630| 0.203032| 0.280973|   100|
|<=>           | 0.067773| 0.080770| 0.0828471| 0.0820615| 0.083804| 0.117957|   100|


#### index 40

|expr          |      min|        lq|      mean|    median|        uq|       max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|---------:|-----:|
|DT_between    | 0.627300| 0.7618825| 0.8033233| 0.7987005| 0.8328330|  0.963008|   100|
|dplyr_between | 1.029756| 1.2823570| 1.7895409| 1.3355955| 1.3918680| 45.141656|   100|
|<=>           | 0.617132| 0.7496030| 0.7843911| 0.7804760| 0.8118205|  0.940991|   100|


#### index 41

|expr          |      min|       lq|      mean|   median|        uq|      max| neval|
|:-------------|--------:|--------:|---------:|--------:|---------:|--------:|-----:|
|DT_between    | 0.004264| 0.004633| 0.0049831| 0.004838| 0.0051250| 0.012546|   100|
|dplyr_between | 0.022468| 0.023329| 0.0247160| 0.023862| 0.0244155| 0.080401|   100|
|<=>           | 0.001968| 0.002173| 0.0024075| 0.002255| 0.0024600| 0.006519|   100|


#### index 42

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.008733| 0.0092660| 0.0100524| 0.0097170| 0.0100655| 0.031365|   100|
|dplyr_between | 0.031529| 0.0326770| 0.0353363| 0.0335175| 0.0350345| 0.084009|   100|
|<=>           | 0.007667| 0.0083845| 0.0090003| 0.0085690| 0.0089380| 0.023862|   100|


#### index 43

|expr          |      min|       lq|      mean|   median|        uq|      max| neval|
|:-------------|--------:|--------:|---------:|--------:|---------:|--------:|-----:|
|DT_between    | 0.058425| 0.059655| 0.0633348| 0.060885| 0.0638165| 0.095612|   100|
|dplyr_between | 0.117301| 0.134234| 0.1401700| 0.136161| 0.1399330| 0.206517|   100|
|<=>           | 0.075932| 0.076916| 0.0804494| 0.078064| 0.0812825| 0.105452|   100|


#### index 44

|expr          |      min|        lq|      mean|    median|        uq|       max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|---------:|-----:|
|DT_between    | 0.545669| 0.5640985| 0.5814403| 0.5706995| 0.5890675|  0.675393|   100|
|dplyr_between | 1.061941| 1.1065285| 1.3786467| 1.1206735| 1.1440435| 25.587157|   100|
|<=>           | 0.718484| 0.7419360| 0.7577727| 0.7501360| 0.7641990|  0.888962|   100|


#### index 45

|expr          |      min|       lq|      mean|    median|       uq|      max| neval|
|:-------------|--------:|--------:|---------:|---------:|--------:|--------:|-----:|
|DT_between    | 0.016318| 0.016933| 0.0177579| 0.0173225| 0.017794| 0.035137|   100|
|dplyr_between | 0.078679| 0.080073| 0.0820369| 0.0807290| 0.081508| 0.166173|   100|
|<=>           | 0.006273| 0.006601| 0.0070483| 0.0068060| 0.007011| 0.015498|   100|


#### index 46

|expr          |      min|       lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|--------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.023247| 0.023944| 0.0251560| 0.0242515| 0.0249485| 0.066297|   100|
|dplyr_between | 0.088437| 0.089995| 0.0925784| 0.0908560| 0.0923525| 0.154324|   100|
|<=>           | 0.012464| 0.012792| 0.0132942| 0.0129560| 0.0132430| 0.018942|   100|


#### index 47

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.105329| 0.1092445| 0.1154150| 0.1125655| 0.1162555| 0.177407|   100|
|dplyr_between | 0.191265| 0.2167055| 0.2258497| 0.2234090| 0.2279805| 0.298685|   100|
|<=>           | 0.070397| 0.0831685| 0.0874382| 0.0857515| 0.0881500| 0.139892|   100|


#### index 48

|expr          |      min|        lq|     mean|   median|        uq|       max| neval|
|:-------------|--------:|---------:|--------:|--------:|---------:|---------:|-----:|
|DT_between    | 0.872029| 0.9599945| 1.024011| 0.986788| 1.0361930|  1.764927|   100|
|dplyr_between | 1.325530| 1.4982425| 1.565824| 1.530469| 1.5800375|  2.550118|   100|
|<=>           | 0.639436| 0.7717020| 1.261975| 0.790439| 0.8160845| 47.072633|   100|


#### index 49

|expr          |      min|        lq|      mean|   median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|--------:|---------:|--------:|-----:|
|DT_between    | 0.004141| 0.0043870| 0.0055596| 0.004838| 0.0051250| 0.034071|   100|
|dplyr_between | 0.023206| 0.0240260| 0.0275364| 0.024477| 0.0261375| 0.096145|   100|
|<=>           | 0.001968| 0.0020705| 0.0024100| 0.002214| 0.0023575| 0.007298|   100|


#### index 50

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.007954| 0.0085895| 0.0102709| 0.0089380| 0.0097990| 0.046371|   100|
|dplyr_between | 0.031775| 0.0332100| 0.0371214| 0.0339890| 0.0354445| 0.110823|   100|
|<=>           | 0.008282| 0.0086715| 0.0096161| 0.0088355| 0.0093480| 0.023493|   100|


#### index 51

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.064657| 0.0720165| 0.0749660| 0.0743125| 0.0769980| 0.094587|   100|
|dplyr_between | 0.098031| 0.1274485| 0.1348802| 0.1319175| 0.1373705| 0.191060|   100|
|<=>           | 0.073964| 0.0816720| 0.0863788| 0.0841320| 0.0873095| 0.140999|   100|


#### index 52

|expr          |      min|        lq|     mean|    median|        uq|       max| neval|
|:-------------|--------:|---------:|--------:|---------:|---------:|---------:|-----:|
|DT_between    | 0.791997| 0.8258015| 1.419978| 0.8551985| 0.9329345| 50.702404|   100|
|dplyr_between | 0.827790| 1.0874020| 1.264636| 1.1348800| 1.2066095|  2.306373|   100|
|<=>           | 0.682937| 0.7480655| 0.865467| 0.7911360| 0.8521645|  1.386333|   100|


#### index 53

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.016769| 0.0176505| 0.0200826| 0.0180810| 0.0188805| 0.097375|   100|
|dplyr_between | 0.079868| 0.0833940| 0.0894325| 0.0845215| 0.0863665| 0.190363|   100|
|<=>           | 0.006437| 0.0069085| 0.0073681| 0.0071955| 0.0075440| 0.012013|   100|


#### index 54

|expr          |      min|       lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|--------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.023370| 0.024026| 0.0265254| 0.0246615| 0.0269165| 0.070192|   100|
|dplyr_between | 0.090856| 0.093193| 0.0997620| 0.0945665| 0.0986255| 0.163057|   100|
|<=>           | 0.012628| 0.013079| 0.0150150| 0.0134070| 0.0143705| 0.062443|   100|


#### index 55

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.093521| 0.0976415| 0.1025164| 0.0993225| 0.1020285| 0.139933|   100|
|dplyr_between | 0.184869| 0.2112320| 0.2175661| 0.2136920| 0.2183250| 0.291920|   100|
|<=>           | 0.071176| 0.0868585| 0.0903861| 0.0885190| 0.0906510| 0.126239|   100|


#### index 56

|expr          |      min|        lq|      mean|    median|       uq|       max| neval|
|:-------------|--------:|---------:|---------:|---------:|--------:|---------:|-----:|
|DT_between    | 0.773957| 0.8762315| 0.9241462| 0.9079450| 0.944968|  1.905639|   100|
|dplyr_between | 1.294124| 1.4205885| 1.4870028| 1.4620395| 1.515770|  2.247374|   100|
|<=>           | 0.609055| 0.7666590| 1.2090228| 0.7923045| 0.829553| 40.675526|   100|


#### index 57

|expr          |      min|        lq|      mean|   median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|--------:|---------:|--------:|-----:|
|DT_between    | 0.004264| 0.0047765| 0.0052500| 0.005043| 0.0054325| 0.015334|   100|
|dplyr_between | 0.022591| 0.0236980| 0.0254118| 0.024518| 0.0253790| 0.090036|   100|
|<=>           | 0.001968| 0.0021320| 0.0024071| 0.002296| 0.0025010| 0.004305|   100|


#### index 58

|expr          |      min|       lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|--------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.009635| 0.010209| 0.0110872| 0.0104345| 0.0109675| 0.032841|   100|
|dplyr_between | 0.033087| 0.033866| 0.0354638| 0.0342350| 0.0354445| 0.083517|   100|
|<=>           | 0.007708| 0.008323| 0.0087318| 0.0084870| 0.0087330| 0.013202|   100|


#### index 59

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.066338| 0.0711350| 0.0835892| 0.0822255| 0.0925370| 0.156661|   100|
|dplyr_between | 0.125542| 0.1470465| 0.1673267| 0.1709905| 0.1824295| 0.230584|   100|
|<=>           | 0.076547| 0.0787200| 0.0868573| 0.0817540| 0.0981540| 0.118490|   100|


#### index 60

|expr          |      min|        lq|      mean|   median|       uq|       max| neval|
|:-------------|--------:|---------:|---------:|--------:|--------:|---------:|-----:|
|DT_between    | 0.544603| 0.6482715| 0.6636871| 0.660592| 0.679575|  0.750423|   100|
|dplyr_between | 1.117168| 1.1968515| 1.5528959| 1.213272| 1.258679| 34.028155|   100|
|<=>           | 0.712621| 0.7380205| 0.7586689| 0.754564| 0.778631|  0.854194|   100|


#### index 61

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.016933| 0.0175890| 0.0186017| 0.0179990| 0.0185730| 0.038499|   100|
|dplyr_between | 0.081754| 0.0831890| 0.0866498| 0.0841935| 0.0858540| 0.174496|   100|
|<=>           | 0.006437| 0.0067855| 0.0072718| 0.0070110| 0.0072775| 0.015785|   100|


#### index 62

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.024559| 0.0256045| 0.0285885| 0.0263015| 0.0291920| 0.072775|   100|
|dplyr_between | 0.093193| 0.0955300| 0.1014213| 0.0982975| 0.1034840| 0.164943|   100|
|<=>           | 0.012792| 0.0131610| 0.0148994| 0.0136940| 0.0154775| 0.029643|   100|


#### index 63

|expr          |      min|        lq|      mean|    median|        uq|      max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|--------:|-----:|
|DT_between    | 0.152233| 0.2093050| 0.2153263| 0.2137125| 0.2203545| 0.294421|   100|
|dplyr_between | 0.211970| 0.3698815| 0.3765469| 0.3756830| 0.3875115| 0.434026|   100|
|<=>           | 0.138621| 0.1437870| 0.1461900| 0.1453245| 0.1473540| 0.169658|   100|


#### index 64

|expr          |      min|        lq|      mean|    median|        uq|       max| neval|
|:-------------|--------:|---------:|---------:|---------:|---------:|---------:|-----:|
|DT_between    | 0.968912| 1.0429580| 1.1171381| 1.1064260| 1.1662860|  1.338281|   100|
|dplyr_between | 1.356444| 1.5537360| 2.2475601| 1.6520540| 1.7489575| 60.055160|   100|
|<=>           | 0.704749| 0.7581515| 0.7986025| 0.7884915| 0.8193645|  1.022581|   100|


