#Code line to fetch pilot data 
data("iris")

#View Data Head
head(iris)

#Code to calc mean length of IrisPetal
petal_length_mean <- mean(iris$Petal.Length)

#Print the mean length 
petal_length_mean

#Produce a Histogram of Petal length
hist(iris$Sepal.Length)

#Using Geom function instead of Hist

#Install the package
#install.packages("ggplot2")

#Load ggplot2 library
library(ggplot2)

#Use ggplot to make plot
m <- ggplot(iris, aes(Petal.Length, fill = Species)) +
  geom_histogram()

#print the plot
print(m)

#Save file to working directory
ggsave("case_plot.pdf", m, dpi = 300)


#Summary for Each Column
summary(iris$Sepal.Length)
summary(iris$Sepal.Width)
summary(iris$Petal.Length)
summary(iris$Petal.Width)
summary(iris$Species)


#Other methods
#I.E BoxPlot
boxplot(iris)
plot(iris)

