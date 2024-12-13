Case Study 04
================
Festus Adegbola
Sept 24, 2024

``` r
options(repos = c(CRAN = "https://cloud.r-project.org"))
```

``` r
install.packages("tidyverse")
```

    ## Installing package into '/Users/festusad/Library/R/x86_64/4.4/library'
    ## (as 'lib' is unspecified)

    ## 
    ## The downloaded binary packages are in
    ##  /var/folders/sg/c54f1pj10tv3khlfqztczzk15xhmjr/T//Rtmpxle1HE/downloaded_packages

``` r
install.packages("nycflights13")
```

    ## Installing package into '/Users/festusad/Library/R/x86_64/4.4/library'
    ## (as 'lib' is unspecified)

    ## 
    ## The downloaded binary packages are in
    ##  /var/folders/sg/c54f1pj10tv3khlfqztczzk15xhmjr/T//Rtmpxle1HE/downloaded_packages

``` r
library(tidyverse)
```

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.1
    ## ✔ ggplot2   3.5.1     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.3     ✔ tidyr     1.3.1
    ## ✔ purrr     1.0.2

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

``` r
library(nycflights13)
library(dplyr)
```

## \#View the different datasets

Comments

``` r
#View the different datasets
View(flights)
View(airports)
```

``` r
# Join flights data with airports data to get full airport names
flights_airports <- flights %>%
  left_join(airports, by = c("dest" = "faa")) #keeps the rows left of the airports column...like adding the full name and airports dest 
```

``` r
# Find the farthest destination and get the full airport name
farthest_airport <- flights_airports %>%
  filter(!is.na(distance)) %>% #to ignore the distance that are invalid
  arrange(desc(distance)) %>% #arrange in distance descending order to find highest easily
  slice(1) %>% #take only the top result
  pull(name) #extract airport name. can also use select 

# show the result
farthest_airport
```

    ## [1] "Honolulu Intl"
