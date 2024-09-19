## install if needed (do this exactly once):
#install.packages("usethis")

#library(usethis)
#use_git_config(user.name = "Festuus", user.email = "festusad@buffalo.edu")

# gitcreds::gitcreds_set()

#TOPIC <- Data wrangling plus more advanced ggplot

#Load Library to be used for tasts
#install.packages('gapminder')
library(gapminder)
library(ggplot2)
library(dplyr)

#Call, open and explore the gapminder data
data(gapminder)
table(gapminder$country)
max(gapminder$year)
min(gapminder$year)
summary(gapminder)
names(gapminder)

#Filtering the data
#remove Kuwait's data rows
gapminder <- filter(gapminder, country != "Kuwait")

#Do the first plot
case3_first <-  ggplot( data = gapminder, mapping = aes( x = lifeExp, y = gdpPercap, 
                                                         colour = continent, size = pop/100000)) +
  geom_point() +
  facet_wrap( ~ year, nrow = 1 ) +
  scale_y_continuous(transform = "sqrt") +
  theme_bw() +
  labs( title = "Wealth and Life Expectancy through Time", 
        x = "Life Expectancy",
        y = "GDP Per Capita", 
        size = "Population (100k)",
        colour = "Continent") +
  theme(title = element_text(hjust = 0.5, size = 18, face = "bold"))


#Prepare second plot
?group_by()

gapminder_continent <-  gapminder %>% 
  group_by(continent, year) %>%
  summarize(gdpPercapweighted = weighted.mean(x = gdpPercap, w = pop),
            pop = sum(as.numeric(pop)))


#Second Plot
case3 <- ggplot() +
  geom_line(data = gapminder, mapping = aes(x = year, y = gdpPercap, colour = continent,
                                            group = country)) +
  geom_point(data = gapminder, mapping = aes(x = year, y = gdpPercap, colour = continent,
                                             group = country)) +
  geom_line(data =gapminder_continent, mapping = aes(x=year, y=gdpPercapweighted,
  )) +
  geom_point(data =gapminder_continent, mapping = aes(x=year, y=gdpPercapweighted,
                                                      size = pop/100000) ) +
  facet_wrap(~continent, nrow = 1) + 
  theme_bw() +
  labs( x = "Year",
        y = "GDP Per Capita",
        size = "Population (100k)",
        colour = "Continent") 



ggsave(filename = "Plot1.png", case3_first, width = 15, units = "in")
ggsave(filename = "Plot2.png", case3, width = 15, units = "in")





