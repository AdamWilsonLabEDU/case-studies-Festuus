Case Study 12
================
Festus Adegbola
Nov 19, 2024

``` r
library(tidyverse)
library(htmlwidgets)
library(widgetframe)
library(xts)
library(dygraphs)
install.packages("dygraphs")
library(openmeteo)
```

``` r
d<- weather_history(c(43.00923265935055, -78.78494250958327),start = "2023-01-01",end=today(),
                  daily=list("temperature_2m_max","temperature_2m_min","precipitation_sum")) %>% 
mutate(daily_temperature_2m_mean=(daily_temperature_2m_max+daily_temperature_2m_min)/2)
```

``` r
d_xts <- d %>%
  select(date, daily_temperature_2m_max, daily_temperature_2m_min, daily_temperature_2m_mean) %>%
  column_to_rownames("date") %>%
  xts(order.by = as.Date(d$date))

case12 <- dygraph(d_xts, main = "Daily Maximum Temperature in Buffalo, NY") %>%
  dySeries("daily_temperature_2m_max", label = "Max Temperature") %>%
  dySeries("daily_temperature_2m_min", label = "Min Temperature") %>%
  dySeries("daily_temperature_2m_mean", label = "Mean Temperature") %>%
  dyRangeSelector(dateWindow = c("2023-01-01", "2024-10-31")) %>%
  dyOptions(colors = c("red", "blue", "green"))


frameWidget(case12)
```
