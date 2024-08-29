## Number 1
## A package is a collection of R functions that can easily be installed
##and loaded into R to extend its functionality

##  NUmber 2
## we can use the install.package function

#3. Afterinstallation,whataretwowaystousepackagesinR

# we have to (1) install the package and (2) load the package
# by using the librarary() function

#4. Installthefollowingpackages:
#a. tidyverse b. readxl c. googlesheets4 d. readODS
install.packages("tidyverse")
install.packages("readxl")
install.packages("googlesheets4")
install.packages("readODS")


#Number 5. Whatpackage(s)canyouusetoimportdatafromIBMSPSS,andStata.
# we can use the haven package

##File extension
#A. Microsoft excel = ".xlsx"
#B. Libreoffice Calc = ".ods"
#C. Stata = ".dta"
#D IBM SPSS = ".sav"
#E Google sheets = ".gsheet"

#2. I guess it is because it is a web based application

#3. txt files are plain text files that contain unformatted data
#with no specific structure, and can be used for storing simple text
#or logs
# csv files are also plain text files but that contains formatted data
#and their values are separated by commas


# 4
library("tidyverse")
My_Ass <- read_delim("data/fao_wood_data.csv")

Column specification ─────────────────────────────────────────────────
Delimiter: ","
chr  (5): Area Code (M49), Area, Item, Element, Unit
dbl (65): Area Code, Item Code, Element Code, Y1961, Y1962, Y1963, Y1...

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
> My_Ass
# A tibble: 76,529 × 70
`Area Code` `Area Code (M49)` Area    `Item Code` Item  `Element Code`
<dbl> <chr>             <chr>         <dbl> <chr>          <dbl>
  1           2 '004              Afghan…        1877 Fore…           5622
 2           2 '004              Afghan…        1877 Fore…           5922
3           2 '004              Afghan…        1861 Roun…           5516
 4           2 '004              Afghan…        1861 Roun…           5616
5           2 '004              Afghan…        1861 Roun…           5622
 6           2 '004              Afghan…        1861 Roun…           5916
7           2 '004              Afghan…        1861 Roun…           5922
 8           2 '004              Afghan…        1862 Roun…           5516
9           2 '004              Afghan…        1862 Roun…           5616
10           2 '004              Afghan…        1862 Roun…           5622
# ℹ 76,519 more rows
# ℹ 64 more variables: Element <chr>, Unit <chr>, Y1961 <dbl>,
#   Y1962 <dbl>, Y1963 <dbl>, Y1964 <dbl>, Y1965 <dbl>, Y1966 <dbl>,
#   Y1967 <dbl>, Y1968 <dbl>, Y1969 <dbl>, Y1970 <dbl>, Y1971 <dbl>,
#   Y1972 <dbl>, Y1973 <dbl>, Y1974 <dbl>, Y1975 <dbl>, Y1976 <dbl>,
#   Y1977 <dbl>, Y1978 <dbl>, Y1979 <dbl>, Y1980 <dbl>, Y1981 <dbl>,
#   Y1982 <dbl>, Y1983 <dbl>, Y1984 <dbl>, Y1985 <dbl>, Y1986 <dbl>, …
# ℹ Use `print(n = ...)` to see more rows
> 

#A the file extension is "csv"
#B 
head (My_Ass, 6)  
# ℹ 76,519 more rows
> # ℹ 64 more variables: Element <chr>, Unit <chr>, Y1961 <dbl>,
  > #   Y1962 <dbl>, Y1963 <dbl>, Y1964 <dbl>, Y1965 <dbl>, Y1966 <dbl>,
  > #   Y1967 <dbl>, Y1968 <dbl>, Y1969 <dbl>, Y1970 <dbl>, Y1971 <dbl>,
  > #   Y1972 <dbl>, Y1973 <dbl>, Y1974 <dbl>, Y1975 <dbl>, Y1976 <dbl>,
  > #   Y1977 <dbl>, Y1978 <dbl>, Y1979 <dbl>, Y1980 <dbl>, Y1981 <dbl>,
  > #   Y1982 <dbl>, Y1983 <dbl>, Y1984 <dbl>, Y1985 <dbl>, Y1986 <dbl>, …
  > # ℹ Use `print(n = ...)` to see more rows
  > > 
names(My_Ass)
select(My_Ass, Area, Item, Element, Unit, Y1961:Y2022)
My_Ass %>% select(Area, Item, Element, Unit, Y1961:Y2022) %>%
  pivot_longer(cols = Y1961:Y2022, names_to = "Years", 
               values_to =  "values")
# 4c the delimeter is a comma
My_Ass %>% tail(6)
# 4c the delimeter is a comma
> My_Ass %>% tail(6)
# A tibble: 6 × 70
`Area Code` `Area Code (M49)` Area     `Item Code` Item  `Element Code`
<dbl> <chr>             <chr>          <dbl> <chr>          <dbl>
  1        5817 '902              Net Foo…        1622 Othe…           5922
2        5817 '902              Net Foo…        1683 Othe…           5510
3        5817 '902              Net Foo…        1683 Othe…           5610
4        5817 '902              Net Foo…        1683 Othe…           5622
5        5817 '902              Net Foo…        1683 Othe…           5910
6        5817 '902              Net Foo…        1683 Othe…           5922
# ℹ 64 more variables: Element <chr>, Unit <chr>, Y1961 <dbl>,
#   Y1962 <dbl>, Y1963 <dbl>, Y1964 <dbl>, Y1965 <dbl>, Y1966 <dbl>,
#   Y1967 <dbl>, Y1968 <dbl>, Y1969 <dbl>, Y1970 <dbl>, Y1971 <dbl>,
#   Y1972 <dbl>, Y1973 <dbl>, Y1974 <dbl>, Y1975 <dbl>, Y1976 <dbl>,
#   Y1977 <dbl>, Y1978 <dbl>, Y1979 <dbl>, Y1980 <dbl>, Y1981 <dbl>,
#   Y1982 <dbl>, Y1983 <dbl>, Y1984 <dbl>, Y1985 <dbl>, Y1986 <dbl>,
#   Y1987 <dbl>, Y1988 <dbl>, Y1989 <dbl>, Y1990 <dbl>, Y1991 <dbl>, …
> 
  ### Number 5
library(readxl)

sheet_2 <- read_excel("data/Versions_log.xlsx", sheet = 2)
read_excel("data/Versions_log.xlsx", sheet = 2)
# A tibble: 46,686 × 20                                                
Species Area   Units Country `2021` `2020` `2019` `2018` `2017` `2016`
<chr>   <chr>  <chr> <chr>   <chr>  <chr>  <chr>  <chr>  <chr>  <chr> 
  1 AAS     27     TLW   DK      0      0      0      0      0      0.03  
2 AAS     27.3   TLW   DK      0      0      0      0      0      0     
3 AAS     27.3.… TLW   DK      0      0      0      0      0      0     
4 AAS     27.4   TLW   DK      0      0      0      0      0      0.03  
5 AAS     27.4.b TLW   DK      0      0      0      0      0      0.03  
6 ABK     27     TLW   DK      0      0      0      0      0      0.03  
7 ABK     27     TLW   EE      27.20… 35.248 34.959 36.706 31.96  29.26 
8 ABK     27     TLW   LT      0.024  1.357  0      0      0.34   0.02  
9 ABK     27     TLW   LV      1.7    0.57   0.88   0.37   0.16   0.15  
10 ABK     27     TLW   NL      0      0      0      0      0      0     
# ℹ 46,676 more rows
# ℹ 10 more variables: `2015` <chr>, `2014` <chr>, `2013` <chr>,
#   `2012` <chr>, `2011` <chr>, `2010` <chr>, `2009` <chr>,
#   `2008` <chr>, `2007` <chr>, `2006` <chr>
# ℹ Use `print(n = ...)` to see more rows
> 

# Number 5A (first 6 observation)
head(sheet_2, 6)
head(sheet_2, 6)
# A tibble: 6 × 20
Species Area    Units Country `2021` `2020` `2019` `2018` `2017` `2016`
<chr>   <chr>   <chr> <chr>   <chr>  <chr>  <chr>  <chr>  <chr>  <chr> 
  1 AAS     27      TLW   DK      0      0      0      0      0      0.03  
2 AAS     27.3    TLW   DK      0      0      0      0      0      0     
3 AAS     27.3.c… TLW   DK      0      0      0      0      0      0     
4 AAS     27.4    TLW   DK      0      0      0      0      0      0.03  
5 AAS     27.4.b  TLW   DK      0      0      0      0      0      0.03  
6 ABK     27      TLW   DK      0      0      0      0      0      0.03  
# ℹ 10 more variables: `2015` <chr>, `2014` <chr>, `2013` <chr>,
#   `2012` <chr>, `2011` <chr>, `2010` <chr>, `2009` <chr>,
#   `2008` <chr>, `2007` <chr>, `2006` <chr> 

# Number 5B (last 6 observation)
sheet_2 %>% tail(6)
sheet_2 %>% tail(6)
# A tibble: 6 × 20
Species Area   Units Country `2021` `2020` `2019` `2018` `2017` `2016`
<chr>   <chr>  <chr> <chr>   <chr>  <chr>  <chr>  <chr>  <chr>  <chr> 
  1 ZGP     27.8.c TLW   ES      0.04   0.03   0      0      0      0     
2 ZGP     27.9   TLW   ES      0.69   0.51   0.73   0.58   0.31   0.35  
3 ZGP     27.9.a TLW   ES      0.69   0.51   0.73   0.58   0.31   0.35  
4 ZGS     27     TLW   ES      1.41   4.08   3.43   0.54   0      0     
5 ZGS     27.9   TLW   ES      1.41   4.08   3.43   0.54   0      0     
6 ZGS     27.9.a TLW   ES      1.41   4.08   3.43   0.54   0      0     
# ℹ 10 more variables: `2015` <chr>, `2014` <chr>, `2013` <chr>,
#   `2012` <chr>, `2011` <chr>, `2010` <chr>, `2009` <chr>,
#   `2008` <chr>, `2007` <chr>, `2006` <chr>

# Number 5C (10 random observation)
sample(sheet_2, 10)
sample(sheet_2, 10)
# A tibble: 46,686 × 10
`2013` `2019` Species `2020` `2011` `2006` `2016` `2012` `2017` `2018`
<chr>  <chr>  <chr>   <chr>  <chr>  <chr>  <chr>  <chr>  <chr>  <chr> 
  1 0.23   0      AAS     0      0      0      0.03   0      0      0     
2 0.23   0      AAS     0      0      0      0      0      0      0     
3 0.23   0      AAS     0      0      0      0      0      0      0     
4 0      0      AAS     0      0      0      0.03   0      0      0     
5 0      0      AAS     0      0      0      0.03   0      0      0     
6 0      0      ABK     0      0      0      0.03   0      0      0     
7 0      34.959 ABK     35.248 0      0      29.26  0      31.96  36.706
8 0.12   0      ABK     1.357  0      0      0.02   0      0.34   0     
9 0.49   0.88   ABK     0.57   1.71   0      0.15   0.47   0.16   0.37  
10 0      0      ABK     0      2      0      0      0      0      0     
# ℹ 46,676 more rows
# ℹ Use `print(n = ...)` to see more rows

# Number 6

Sheet_4 <- read_excel("data/Versions_log.xlsx", sheet = 4)
read_excel("data/Versions_log.xlsx", sheet = 4)
# A tibble: 11,563 × 5                                                 
FAO_code `Latin species name`      English             Spanish  French
<chr>    <chr>                     <chr>               <chr>    <chr> 
  1 AAA      Acipenser naccarii        Adriatic sturgeon   Esturió… Estur…
2 AAB      Acanthopagrus bifasciatus Twobar seabream     Sargo d… Pagre…
3 AAC      Amia calva                Bowfin              NA       NA    
4 AAD      Acipenser dabryanus       Yangtze sturgeon    NA       NA    
5 AAE      Antennarius analis        Tailjet frogfish    NA       NA    
6 AAF      Acipenser fulvescens      Lake sturgeon       NA       NA    
7 AAG      Anguilla bengalensis      Indian mottled eel  NA       NA    
8 AAH      Acipenser schrenckii      Amur sturgeon       NA       NA    
9 AAI      Acipenser sinensis        Chinese sturgeon    NA       NA    
10 AAJ      Anguilla mossambica       African longfin eel NA       NA    
# ℹ 11,553 more rows
# ℹ Use `print(n = ...)` to see more rows

read_excel("data/Versions_log.xlsx", sheet = 4)
# A tibble: 11,563 × 5                                                 
FAO_code `Latin species name`      English             Spanish  French
<chr>    <chr>                     <chr>               <chr>    <chr> 
  1 AAA      Acipenser naccarii        Adriatic sturgeon   Esturió… Estur…
2 AAB      Acanthopagrus bifasciatus Twobar seabream     Sargo d… Pagre…
3 AAC      Amia calva                Bowfin              NA       NA    
4 AAD      Acipenser dabryanus       Yangtze sturgeon    NA       NA    
5 AAE      Antennarius analis        Tailjet frogfish    NA       NA    
6 AAF      Acipenser fulvescens      Lake sturgeon       NA       NA    
7 AAG      Anguilla bengalensis      Indian mottled eel  NA       NA    
8 AAH      Acipenser schrenckii      Amur sturgeon       NA       NA    
9 AAI      Acipenser sinensis        Chinese sturgeon    NA       NA    
10 AAJ      Anguilla mossambica       African longfin eel NA       NA    
# ℹ 11,553 more rows
# ℹ Use `print(n = ...)` to see more rows

# first 6 observation
head(Sheet_4, 6)
> head(Sheet_4, 6)
# A tibble: 6 × 5
FAO_code `Latin species name`      English           Spanish     French
<chr>    <chr>                     <chr>             <chr>       <chr> 
  1 AAA      Acipenser naccarii        Adriatic sturgeon Esturión d… Estur…
2 AAB      Acanthopagrus bifasciatus Twobar seabream   Sargo de d… Pagre…
3 AAC      Amia calva                Bowfin            NA          NA    
4 AAD      Acipenser dabryanus       Yangtze sturgeon  NA          NA    
5 AAE      Antennarius analis        Tailjet frogfish  NA          NA    
6 AAF      Acipenser fulvescens      Lake sturgeon     NA          NA    
> 
sheet_5 <- read_excel("data/Versions_log.xlsx", sheet = 5)

read_excel("data/Versions_log.xlsx", sheet = 5)
# A tibble: 37 × 2                                                     
Code  Country                    
<chr> <chr>                      
  1 BE    Belgium                    
2 BG    Bulgaria                   
3 CN    China (including Hong Kong)
4 CV    Cape Verde                 
5 DE    Germany                    
6 DK    Denmark                    
7 EE    Estonia                    
8 ES    Spain                      
9 FI    Finland                    
10 FO    Faeroe Islands             
# ℹ 27 more rows
# ℹ Use `print(n = ...)` to see more rows
> 
  # First 6 observation
head(sheet_5, 6)
head(sheet_5, 6)
# A tibble: 6 × 2
Code  Country                    
<chr> <chr>                      
  1 BE    Belgium                    
2 BG    Bulgaria                   
3 CN    China (including Hong Kong)
4 CV    Cape Verde                 
5 DE    Germany                    
6 DK    Denmark     

# Number 7
library(readODS)
My_Ass_ODS <- read_ods("data/Ch2_Timber.ods", sheet = 3)

My_Ass_ODS
# A tibble: 14 × 4
`Table 2.1a: Softwood production, UK, 2013 to 2022`  ...2  ...3  ...4 
<chr>                                                <chr> <chr> <chr>
  1 Source:  Forestry England, Forest and Land Scotland… NA    NA    NA   
2 This worksheet contains one table.                   NA    NA    NA   
3 Information: Units are in thousands of green tonnes  NA    NA    NA   
4 Year                                                 FE/F… Priv… Tota…
5 2013                                                 5084  5852  10936
6 2014                                                 4900  6627  11527
7 2015                                                 4691  5968  10659
8 2016                                                 5011  5734  10745
9 2017                                                 4641  6075  10717
10 2018                                                 4395  6827  11223
11 2019                                                 3842  5884  9726 
12 2020                                                 4504  5437  9940 
13 2021                                                 3888  6407  10295
14 2022 

# Number 7b
sheet_7b_ods <- read_ods("data/Ch2_Timber.ods", sheet = "Table_2_7
sheet_7b_ods
# A tibble: 14 × 3
   `Table 2.7b: Production by sawmills, UK, 2013 to 2022` ...2      ...3 
   <chr>                                                  <chr>     <chr>
 1 Source: Sawmill Survey                                 NA        NA   
 2 This worksheet contains one table.                     NA        NA   
 3 Information: Units are thousand cubic metres           NA        NA   
 4 Year                                                   Softwood… Hard…
 5 2013                                                   3539      45   
 6 2014                                                   3719      47   
 7 2015                                                   3454      45   
 8 2016                                                   3627      46   
 9 2017                                                   3727      41   
10 2018                                                   3625      41   
11 2019                                                   3416      46   
12 2020                                                   3311      37   
13 2021                                                   3574      37   
14 2022 

# Number 7c

Ass_txt_file <- read.delim('data/plot_11_tvol.txt')
Ass_txt_file
   site plot nr height       dbh
1  1012   11  2    126 155.46061
2  1012   11  3    106 129.93845
3  1012   11  4     NA 163.32789
4  1012   11  6     NA 158.99686
5  1012   11  7    111  93.43447
6  1012   11  8    122 156.48003
7  1012   11 10    120 162.98773
8  1012   11 11     NA 139.49194
9  1012   11 12     NA 160.46183
10 1012   11 13    118 128.99612
11 1012   11 14     NA 128.49903
12 1012   11 15     NA 142.49912
13 1012   11 16    119 139.49194
14 1012   11 17     NA 168.97337
15 1012   11 20     NA  87.46428
16 1012   11 21     NA 130.93892
17 1012   11 24     NA 102.48902
18 1012   11 27    109 116.47317
19 1012   11 28     NA 127.96484
20 1012   11 30    128 188.93385
21 1012   11 31     NA 101.98039
22 1012   11 32     NA 187.95744
23 1012   11 34     NA 114.49017
24 1012   11 35     NA 142.99650
25 1012   11 36     NA 115.44696
26 1012   11 37     NA 119.99583
27 1012   11 38    117 149.99667
28 1012   11 39     NA 145.47852
29 1012   11 40     NA 152.49918
30 1012   11 41     NA 163.97256
31 1012   11 42    113 119.99583
32 1012   11 44    114 155.46061
33 1012   11 45     NA 123.47469
34 1012   11 46    128 158.48028
35 1012   11 47    103 155.49920
36 1012   11 48    108  78.46018
37 1012   11 49     NA 136.98540
38 1012   11 50     NA 156.94904
39 1012   11 54     NA 151.99671
40 1012   11 55     NA 122.98374
41 1012   11 56     NA 133.49157
42 1012   11 57     NA 183.48297
43 1012   11 58     NA 114.98261
44 1012   11 59    131 189.42017
45 1012   11 60    117 162.97239
46 1012   11 61     NA 157.97152
47 1012   11 63     NA 150.47923
48 1012   11 64     NA 201.44975
49 1012   11 66     NA 129.49903
50 1012   11 67    106  94.99474
51 1012   11 69    118  93.91486
52 1012   11 72     NA 113.96052
53 1012   11 73     NA 106.49883
54 1012   11 74    126 149.87995
55 1012   11 75    119 148.49242
56 1012   11 76     NA 129.49903
57 1012   11 77     NA 157.21323
58 1012   11 79     NA 145.99658
59 1012   11 80    104 144.99655
60 1012   11 82     NA 199.96000
61 1012   11 83     NA  92.99462
62 1012   11 84     NA  82.97590
> 
Distinct_site <- unique(Ass_txt_file$site)
length(Distinct_site)

#the distinct site = 1 (1012)

Distinct_plot <- unique(Ass_txt_file$plot)
length(Distinct_plot)
#The distinct plot = 1 (11)

# Number 7d
anyNA(Ass_txt_file)
True

# Number 8
library(googlesheets4)
gs4_auth()
google_sheet <- https://docs.google.com/spreadsheets/
  d/1l7COp-Ps5Zy8X0nnw0grnWgB1o79uwRmK1ncqtm56AE/
  edit?gid=1166502060#gid=1166502060

google_sheet <- paste0("https://docs.google.com/spreadsheets/", 
       "d/1l7COp-Ps5Zy8X0nnw0grnWgB1o79uwRmK1ncqtm56AE/", 
       "edit?gid=1166502060#gid=1166502060")
black_cherry_trees <- read_sheet(google_sheet)
black_cherry_trees <- read_sheet("1l7COp-Ps5Zy8X0nnw0grnWgB1o79uwRmK1ncqtm56AE")
head(black_cherry_trees, 6)

head(black_cherry_trees, 6)
# A tibble: 6 × 3
Girth Height Volume
<dbl>  <dbl>  <dbl>
  1   8.3     70   10.3
2   8.6     65   10.3
3   8.8     63   10.2
4  10.5     72   16.4
5  10.7     81   18.8
6  10.8     83   19.7

head(black_cherry_trees, 10)
head(black_cherry_trees, 15)


# Olakunle you are doing well with git and git hub
