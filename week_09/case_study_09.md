Case Study 09
================
Festus Adegbola
Nov 18, 2024

Load libraries

``` r
library(sf)
library(tidyverse)
library(ggmap)
library(spData)
library(lubridate)
library(dplyr)
library(viridis)
```

Load Data

``` r
data(world)
data(us_states)
```

``` r
 # Download a csv from noaa with storm track information
dataurl="https://www.ncei.noaa.gov/data/international-best-track-archive-for-climate-stewardship-ibtracs/v04r01/access/csv/ibtracs.NA.list.v04r01.csv"

storm_data <- read_csv(dataurl)

storm <- storm_data %>% 
  mutate(year = year(ISO_TIME))


storm <-  storm %>%
 filter(year >= 1950) %>%
 mutate_if(is.numeric, function(x) ifelse(x==-999.0,NA,x)) %>%
 mutate(decade=(floor(year/10)*10)) %>%
 st_as_sf(coords=c("LON","LAT"),crs=4326) 
 
region <- st_bbox(storm)


casestudy9_plot <- ggplot(world) +
geom_sf(fill = "gray", color = "white") +
facet_wrap(~ decade) +
stat_bin2d(data=storm, aes(y=st_coordinates(storm)[,2], x=st_coordinates(storm)[,1]),bins=100) +
scale_fill_distiller(palette="YlOrRd", trans="log", direction=-1, breaks = c(1,10,100,1000)) +
coord_sf(ylim=region[c(2,4)], xlim=region[c(1,3)])

print(casestudy9_plot)

ggsave(casestudy9_plot, filename = "casestudy9_plot.png")

us_states <- st_transform(us_states, st_crs(storm))
us_states <- us_states %>% 
  select(state = NAME)
storm_states <- st_join(storm, us_states, join = st_intersects, left = FALSE)
storm_count <- storm_states %>% 
  group_by(state) %>% 
  summarize(storms = length(unique(NAME))) %>% 
  arrange(desc(storms)) %>% 
  slice(1:5)

print(storm_count)
```
