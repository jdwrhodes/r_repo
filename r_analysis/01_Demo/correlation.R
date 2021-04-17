library(tidyverse)
library(ggplot2)

mpg <-  read.csv('./01_Demo/data/mpg_modified.csv', check.names = F, stringsAsFactors = F)

mtcars <-  mtcars

# testing correlation between hp and qmile times by creating a scatter plot
plt_prac <- ggplot(mtcars, aes(x=hp, y=qsec))

plt_prac + geom_point()

# here we are generating the correlation coeffecient, r
cor(mtcars$hp, mtcars$qsec)

# another example
used_cars <- read.csv('./01_Demo/data/used_car_data.csv',stringsAsFactors = F) #read in dataset
head(used_cars)

used_plt <- ggplot(used_cars,aes(x=Miles_Driven,y=Selling_Price)) #import dataset into ggplot2

used_plt + geom_point()

# now the correlation calc
cor(used_cars$Miles_Driven, used_cars$Selling_Price)

# to compare multiple different correlations at once, convert to matrix, then create correlation matrix
used_matrix <- as.matrix(used_cars[c('Selling_Price', "Present_Price", 'Miles_Driven')])

cor(used_matrix)

# creating a linear model to try and predict qsec times given a hp value
lm(qsec ~ hp, mtcars)

# to determine the p-value and r^2 value, thus getting the linear model
summary(lm(qsec ~ hp, mtcars))

# now to create the actual linear model 
model <- lm(qsec ~ hp, mtcars)
yvals <- model$coefficients['hp']*mtcars$hp + model$coefficients['(Intercept)'] # this last is retrieving the y-axis values from the linear model


# and now plotting the actual line
lm_plt <- ggplot(mtcars,aes(x=hp, y=qsec)) # creating the ggplot object
lm_plt + geom_point() + geom_line(aes(y=yvals), color = 'red')

# now we're doing multiple linear regression analysis by adding additional independent variables
lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars) #generate multiple linear regression model

summary(lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars)) #generate summary statistics

# chi-squared test
# first we are going to create a contingency table, also called a frequency table
# it's used for calculating frequencies across different factors
# For example, if we want to test whether there is a statistical difference in the distributions of vehicle class across 1999 and 2008 from our mpg dataset, we would first need to build our contingency table as follows:


tbl <- table(mpg$class, mpg$year) #generating the contingency table

chisq.test(tbl) # compares categorical distributions using the chi=squared test
