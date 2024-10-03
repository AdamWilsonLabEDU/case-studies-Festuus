Case Study 05
================
Festus Adegbola
October 1st, 2024

\##LIBRARIES

Install and Load Necessary Packages

``` r
install.packages("sf")
library(sf)
install.packages("spDataLarge")
install.packages('spDataLarge', repos='https://nowosad.github.io/drat/',
type='source')
library(spData)
library(tidyverse)
install.packages("units")
library(units)
library(ggplot2)
install.packages("raster")
library(raster)
install.packages("leaflet")
library(leaflet)
install.packages("htmlwidgets")
library(htmlwidgets)
```

\##DATA

load ‘world’ data from spData package load ‘states’ boundaries from
spData package

``` r
data(world)  
data(us_states)
plot(world[1])  
plot(us_states[1]) 
```

\##STEPS FOR WORLD DATASET

``` r
#Transform the world dataset to the albers equal area projection

albers = "+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=37.5 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"

world_trans <- st_transform(world, crs = albers)

Canada <- world_trans %>% 
          filter( name_long == "Canada")
          
Canada_buffered <- st_buffer(Canada, dist= 10000)
```

\##STEPS FOR US_STATES

``` r
#Transform the world dataset to the albers equal area projection

state_trans <- st_transform(us_states, crs = albers)

NY <- state_trans %>% 
          filter(NAME == "New York")
```

\#STEPS FOR CREATING A BORDER

``` r
border <- st_intersection(NY, Canada_buffered)

area <- st_area(border) %>%
        set_units("km^2") %>%
        signif(4)
        
Borderplot <- ggplot() +
        geom_sf(data=NY) +
        geom_sf(data=border, fill = "red") +
        theme_classic() +
        labs(title = "NY Land within 10sq.km of Canada",
        subtitle= "Area [3495 sq.km]") +
        theme(plot.title = element_text(hjust = 0.5, size = 18, face = "bold"),
        plot.subtitle = element_text(hjust = 0.5, size = 14, face = "bold.italic"))

print(Borderplot)
ggsave(Borderplot, file= "Borderplot.png")
```

\##Build Map on leaflet

``` r
NY_transformed <- st_transform(NY, crs = 4326)
border_transformed <- st_transform(border, crs = 4326)

Leaflet_plot <- leaflet() %>%
 addTiles() %>%
 addPolygons(data = NY_transformed, color = "blue", weight = 2, fillOpacity = 0.5, group = "NY") %>%
 addPolygons(data = border_transformed,  color = "red", fillOpacity = 0.6, group = "Border") %>%
 addLayersControl(
    overlayGroups = c("NY", "Border"),
    options = layersControlOptions(collapsed = FALSE)
  ) %>%
 addControl("<b>NY Land within 10KM of Canada</b><br>Area: 3495 sq.km", position = "topright")
 
saveWidget(Leaflet_plot, file = "leaflet_map.html")
```
