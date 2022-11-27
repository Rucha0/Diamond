
#########################Project on Diamond dataset############################


#Why EDA - To understand the data in graphical form we perform EDA
#We can check the tendancy of the values changing from Day1 to Day2 for e.g. Age

library(datasets)
setwd("C:\\Users\\Rucha\\Desktop\\R\\Project")
diamonds <- read.csv("diamonds.csv")
summary(diamonds)

#To understand the data better so we look sample of the data
head(diamonds)

#GGplot - used for visualization of data

library(ggplot2)
ggplot(data = diamonds) + geom_bar(mapping =  aes(x = cut))


#Calling the function of dplyr

library(dplyr)

# To get the actual numbers of the charts or data distribution
diamonds %>% count(cut)

#Now working on continuous data set carat
#Performing histogram to get the data 

summary(diamonds$carat)
ggplot(data = diamonds) + geom_histogram(mapping = aes(x = carat),binwidth = 0.5)

#From the below statement we will get the exact number of observation 
#From this we can see that there are outliers from 3.25 to 5.25 and more data lies between 0.25 to 0.75
diamonds %>% count(cut_width(carat,0.5))


#Now, we can see the histogram with the cut included in this

ggplot(data = diamonds, mapping = aes(x = carat, colour = cut)) + geom_freqpoly(binwidth = 0.1) 
#freqpoly will give the specific values or exact bin


#Now from the graph we can see that few values are going after 3 carat
#So we have to investigate why it is happening

ggplot(data = diamonds,mapping = aes(x = carat)) + geom_histogram(binwidth = 0.01) 

#From this graph we can see that when the carat value is increasing the buying behaviour is decreasing which is contradictory
#While when the carat value is low then buying behavior is more
#So there is data discrepancy

head(diamonds)

#Performing outliers on columns x, y and z

boxplot(x = diamonds$x)

#Boxplot is univariate analysis that means in boxplot only one column is involved

#SO the outliers are telling us this points are not right or fitting in the existing distribution 




#According to the boxplot any values which is below to Lower Whisker and above the upper whisker 
#so we consider that as outliers
#LW = Q1 - 1.5(IQR)
#UW = Q3 + 1.5(IQR)

