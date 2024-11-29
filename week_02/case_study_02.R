#Install and Call Library 
#install.packages("tidyverse")
library(tidyverse)

#Download data from NASA GISS website with R
# define the link to the data - you can try this in your browser too.  Note that the URL ends in .txt.
dataurl="https://data.giss.nasa.gov/tmp/gistemp/STATIONS_v4/tmp_USW00014733_14_0_1/station.csv"

#the next line tells the NASA site to create the temporary file
httr::GET("https://data.giss.nasa.gov/cgi-bin/gistemp/stdata_show_v4.cgi?id=USW00014733&ds=14&dt=1")


# the next lines download the data
temp=read_csv(dataurl, 
              na="999.90", # tell R that 999.90 means missing in this dataset
              skip=1, # we will use our own column names as below so we'll skip the first row
              col_names = c("YEAR","JAN","FEB","MAR", # define column names 
                            "APR","MAY","JUN","JUL",  
                            "AUG","SEP","OCT","NOV",  
                            "DEC","DJF","MAM","JJA",  
                            "SON","metANN"))

# renaming is necessary because they used dashes ("-")
# in the column names and R doesn't like that.

#Data Exploration
summary(temp)
head(temp)
names(temp)
glimpse(temp)

#Generate Mean Trend
#For less than 1,000 observations, use loess as method for smoth curve
ggplot(data = temp, aes( x = YEAR, y = JJA)) +
  geom_line() +
  geom_point(color = "red") +  
  geom_smooth(color = "green", method = "loess", linewidth = 5)

#Trying a linear regression smoothing
ggplot(temp, aes(YEAR, JJA)) +
  geom_line() + 
  # geom_point(color = "red") +  
  geom_smooth(color = "green", method = "lm", linewidth = 1)

#For more than 1,000 observations, use geom_smoth(method = "gam"), 
#note that changes to formula

ggplot(temp, aes(YEAR, JJA)) +
  geom_line() +
  # geom_point(color = "red") +  
  geom_smooth(color = "green", method = "gam", linewidth = 2)

#Detailed Plot
p <- ggplot(data = temp, aes( x = YEAR, y = JJA)) +
  geom_line() +
  geom_point(color = "red") +  
  geom_smooth(color = "red", method = "loess", linewidth = 1, se = TRUE) + #se here adds the confidence interval. default is TRUE
  scale_x_continuous(breaks = seq(min(temp$YEAR), max(temp$YEAR), by = 20)) +
  labs(title = "Buffalo Summer Mean Temperatures",
       subtitle = "1883 - 2024\nHere",
       caption = "Data from Global Historical Climate Network",
       x = "YEAR",
       y = "Summer Mean Temp (°C)") +
  #theme_minimal() + 
  theme(plot.title = element_text(face = "bold", size = 22, hjust = 0.5, color = "black"),
        plot.background = element_rect(colour = "black", fill = "gray80"),
        plot.subtitle = element_text(face = "bold", size = 20, hjust = 0.5),
        plot.caption = element_text(face = "bold.italic"),
        axis.title.x = element_text(face = "bold", size = 16),
        axis.title.y = element_text(face = "bold", size = 16),
        axis.text.x = element_text(face = "bold", colour = "black", size = 13),
        axis.text.y = element_text(face = "bold", colour = "black", size = 13)) 
p
ggsave("Buffalo_Temp.png", p, dpi = 300)
















