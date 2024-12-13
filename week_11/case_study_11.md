Case Study 11
================
Festus Adegbola
Nov 19, 2024

``` r
install.packages("mapview")
library(tidycensus)
library(sf)
library(dplyr)
library(foreach)
library(mapview)
```

``` r
# Step 1: Define the race variables (from the census)
race_vars <- c(
  "Total Population" = "P1_001N",
  "White alone" = "P1_003N",
  "Black or African American alone" = "P1_004N",
  "American Indian and Alaska Native alone" = "P1_005N",
  "Asian alone" = "P1_006N",
  "Native Hawaiian and Other Pacific Islander alone" = "P1_007N",
  "Some Other Race alone" = "P1_008N",
  "Two or More Races" = "P1_009N")

options(tigris_use_cache = TRUE)
erie <- get_decennial(geography = "block", variables = race_vars, year=2020,
                  state = "NY", county = "Erie County", geometry = TRUE,
                  sumfile = "pl", cache_table=T) 
```

``` r

bbox <- st_sfc(
  st_polygon(list(matrix(c(-78.9, 42.888, 
                           -78.85, 42.888, 
                           -78.85, 42.92, 
                           -78.9, 42.92, 
                           -78.9, 42.888), 
                         ncol = 2, byrow = TRUE))),
  crs = st_crs(erie)  # Ensure CRS matches the data
)

erie <- st_intersection(erie, bbox)
erie$variable <- as.factor(erie$variable)  


results_list <- list()
foreach(race = levels(erie$variable), .combine = rbind) %do% {
  # Filter the data for the current race group
  race_data <- erie %>% filter(variable == race)
  random_points <- st_sample(race_data, size = nrow(race_data), type = "random")
  random_points_sf <- st_as_sf(random_points)
  random_points_sf <- random_points_sf %>% mutate(variable = race)
  results_list[[race]] <- random_points_sf
}

latest <- do.call(rbind, results_list)
mapview(latest, zcol = "variable", cex = 3) 
```
