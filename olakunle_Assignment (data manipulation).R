library(tidyverse)
# Number 1
asfis_data <- read_delim("data/ASFIS_sp_2023.txt")
# Rows: 13615 Columns: 14                                                  
# ── Column specification ─────────────────────────────────────────────────
#Delimiter: ","
#chr (13): Taxonomic_Code, Alpha3_Code, Scientific_Name, English_name,...
#dbl  (1): ISSCAAP_Group

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
# A tibble: 13,615 × 14
ISSCAAP_Group Taxonomic_Code Alpha3_Code Scientific_Name  English_name
<dbl> <chr>          <chr>       <chr>            <chr>       
  1            11 140001000101   YCL         Cycleptus elong… Blue sucker 
2            11 140001000201   DEU         Deltistes luxat… Lost River …
3            11 140001000401   ATC         Catostomus cato… Longnose su…
4            11 140001000402   ATO         Catostomus comm… White sucker
5            11 140001000403   ATS         Catostomus lati… Flannelmout…
6            11 140001000404   ATU         Catostomus macr… Largescale …
7            11 140001000405   ATE         Catostomus taho… Tahoe sucker
8            11 140001000601   MOG         Moxostoma conge… Gray redhor…
9            11 140001000602   MOE         Moxostoma eryth… Golden redh…
10            11 140001000603   MOM         Moxostoma macro… Shorthead r…
# ℹ 13,605 more rows
# ℹ 9 more variables: French_name <chr>, Spanish_name <chr>,
#   Arabic_name <chr>, Chinese_name <chr>, Russian_name <chr>,
#   Author <chr>, Family <chr>, Order <chr>, FishStat_Data <chr>
# ℹ Use `print(n = ...)` to see more rows

# Number 1A
# the data has 14 Columns
# Number 1B
#the data has 13615 rows
# number 1C 
asfis_data_family_count <- asfis_data %>% count(Family, sort = TRUE)
A tibble: 1,162 × 2
Family                n
<chr>             <int>
  1 ABYSSOCOTTIDAE        5
2 ACANTHOCHITONIDAE     1
3 ACANTHOGORGIIDAE      1
4 ACANTHURIDAE         37
5 ACARNIDAE             1
6 ACARTIIDAE            3
7 ACCIPITRIDAE          1
8 ACESTRORHYNCHIDAE     4
9 ACHIRIDAE             9
10 ACHIROPSETTIDAE       5
# ℹ 1,152 more rows
# ℹ Use `print(n = ...)` to see more rows
asfis_data_family_count %>% slice(1:10)
A tibble: 10 × 2
Family           n
<chr>        <int>
  1 CYPRINIDAE     512
2 CICHLIDAE      315
3 GOBIIDAE       304
4 SERRANIDAE     236
5 SCIAENIDAE     185
6 CARANGIDAE     152
7 CLUPEIDAE      141
8 SCORPAENIDAE   136
9 PENAEIDAE      134
10 VENERIDAE      132

# Number 1D
asfis_data_family_count %>% slice(-1:-10)
A tibble: 1,152 × 2
Family           n
<chr>        <int>
  1 LABRIDAE       130
2 CHARACIDAE     123
3 MACROURIDAE    123
4 SPARIDAE       112
5 RAJIDAE        103
6 MYCTOPHIDAE    100
7 PALAEMONIDAE   100
8 NA             100
9 LUTJANIDAE      97
10 PIMELODIDAE     97

# Number 2
asfis_data |>
  group_by(Order) |>
  summarize(
    ISSCAAP_Group = length(unique(ISSCAAP_Group)),
    Taxonomic_Code = length(unique(Taxonomic_Code)),
    Alpha3_Code =length(unique(Alpha3_Code))
  ) |>
  arrange(desc(Alpha3_Code))

A tibble: 152 × 4
Order             ISSCAAP_Group Taxonomic_Code Alpha3_Code
<chr>                     <int>          <int>       <int>
  1 PERCOIDEI                     6           2370        2370
2 BIVALVIA                      6            793         793
3 SILURIFORMES                  2            658         658
4 GASTROPODA                    3            646         646
5 CYPRINIFORMES                 1            616         616
6 NATANTIA                      2            491         491
7 SCORPAENIFORMES               3            450         450
8 GOBIOIDEI                     2            368         368
9 PLEURONECTIFORMES             1            320         320
10 CEPHALOPODA                   1            317         317
# ℹ 142 more rows
# ℹ Use `print(n = ...)` to see more rows


# Number 3
asfis_data %>% filter(!is.na(French_name)) %>% count()

A tibble: 1 × 1
n
<int>
  1  5754
#  Number 4
asfis_data %>% select(contains(c("name", "Name")))
%>% drop_na() %>% count()
asfis_data %>% select(contains(c("name", "Name")))
%>% drop_na() %>% +   count()
# A tibble: 1 × 1
n
<int>
  1   111

# Number 5

asfis_data <- asfis_data %>% mutate(order_lower = tolower(Order))

A tibble: 13,615 × 15
ISSCAAP_Group Taxonomic_Code Alpha3_Code Scientific_Name  English_name
<dbl> <chr>          <chr>       <chr>            <chr>       
  1            11 140001000101   YCL         Cycleptus elong… Blue sucker 
2            11 140001000201   DEU         Deltistes luxat… Lost River …
3            11 140001000401   ATC         Catostomus cato… Longnose su…
4            11 140001000402   ATO         Catostomus comm… White sucker
5            11 140001000403   ATS         Catostomus lati… Flannelmout…
6            11 140001000404   ATU         Catostomus macr… Largescale …
7            11 140001000405   ATE         Catostomus taho… Tahoe sucker
8            11 140001000601   MOG         Moxostoma conge… Gray redhor…
9            11 140001000602   MOE         Moxostoma eryth… Golden redh…
10            11 140001000603   MOM         Moxostoma macro… Shorthead r…
# ℹ 13,605 more rows
# ℹ 10 more variables: French_name <chr>, Spanish_name <chr>,
#   Arabic_name <chr>, Chinese_name <chr>, Russian_name <chr>,
#   Author <chr>, Family <chr>, Order <chr>, FishStat_Data <chr>,
#   order_lower <chr>
# ℹ Use `print(n = ...)` to see more rows


# Number 6
asfis_data$order_lower

asfis_data %>% filter(order_lower== "pelecaniformes" & 
                        !is.na(Spanish_name))

# A tibble: 9 × 15
ISSCAAP_Group Taxonomic_Code Alpha3_Code Scientific_Name   English_name
<dbl> <chr>          <chr>       <chr>             <chr>       
  1            NA 562001000501   TWH         Pelecanus thagus  Peruvian pe…
2            NA 562002000101   ISQ         Phalacrocorax at… Imperial sh…
3            NA 562002000102   ISW         Phalacrocorax ar… European sh…
4            NA 562002000103   ISY         Phalacrocorax ca… Great cormo…
5            NA 5620020XXXXX   ITV         Phalacrocoracidae Cormorants …
6            NA 562003000301   MVR         Morus serrator    Australasia…
7            NA 562003000302   MVB         Morus bassanus    Northern ga…
8            NA 562003000303   MWE         Morus capensis    Cape gannet 
9            NA 562003000601   DSQ         Sula dactylatra   Masked booby
# ℹ 10 more variables: French_name <chr>, Spanish_name <chr>,
#   Arabic_name <chr>, Chinese_name <chr>, Russian_name <chr>,
#   Author <chr>, Family <chr>, Order <chr>, FishStat_Data <chr>,
#   order_lower <chr>
# Number 7

asfis_data %>% filter(order_lower %in% 
      c("bryozoa", "squamate")) %>% group_by(Family) %>% 
  summarise(count = n ()) %>% filter(count > 1) %>% 
  arrange(desc(count))

A tibble: 3 × 2
Family        count
<chr>         <int>
  1 FLUSTRIDAE        4
2 SMITTINIDAE       3
3 ALCYONIDIIDAE     2


# Number 8
asfis_data %>% count(Author) %>% arrange(desc(n))

A tibble: 5,630 × 2
Author                       n
<chr>                    <int>
  1 NA                        1050
2 (Linnaeus 1758)            532
3 Linnaeus 1758              190
4 (Hamilton 1822)            108
5 (Forsskål 1775)             94
6 (Bloch & Schneider 1801)    80
7 (Gmelin 1791)               77
8 (Cuvier 1829)               75
9 (Linnaeus 1766)             45
10 (Valenciennes 1840)         44
# ℹ 5,620 more rows
# ℹ Use `print(n = ...)` to see more rows
> 
# Number 9

asfis_data %>% count(Family) %>% filter(n >= 100) %>%  count()
tibble: 1 × 1
n
<int>
  1    18


# Number 10
read the ICESCatchDataset2006-2021.csv dataset and
ensure 0 is imported as NA. Print
a preview of this data.

icesc <- read_csv("data/ICESCatchDataset2006-2021.csv", na = "0")
|> janitor::clean_names()
head(icesc)
read_csv("data/")






