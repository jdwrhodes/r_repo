library(tidyverse)
library(ggplot2)

shapiro.test(mtcars$wt)

used_cars <- read.csv('./01_Demo/data/used_car_data.csv', check.names = F, stringsAsFactors = F) # importing used cars dataset

used_cars_plt <- ggplot(used_cars, aes(x=log10(Miles_Driven))) # creating ggplot object, using the log10() on the Miles_Driven column. We did this because the distribuion of miles is right skewed. Meaning some vehicles have very high mileage. the log10() transformation makes the visualization appear more normal

used_cars_plt + geom_density() # visualizing the plot

# creating a sample dataset using sample_n()

used_car_sample_table <- used_cars %>% sample_n(50) # generating a random sample of 50 from the dataset

used_car_sample_plt <- ggplot(used_car_sample_table, aes(x=log10(Miles_Driven))) # same as above

used_car_sample_plt + geom_density() # visualizing the sample plot

t.test(log10(used_car_sample_table$Miles_Driven), mu=mean(log10(used_cars$Miles_Driven)))
# the above is to test if the sample dataset is statistically similar to the population dataset

# now produce 2 sample sets for the two-sample t-test
car_sample <- used_cars %>% sample_n(50)
car_sample2 <- used_cars %>% sample_n(50)

# now run the 2 sample t-test
t.test(log10(car_sample$Miles_Driven), log10(car_sample2$Miles_Driven))

# now we are looking at paired two-sample t-tests
mpg <- read.csv('./01_Demo/data/mpg_modified.csv', check.names = F, stringsAsFactors = F) # importing used cars dataset

mpg_1999 <- mpg %>% filter(year==1999) # first sample where year is 1999
mpg_2008 <- mpg %>% filter(year==2008) # second sample where year is 2008

# now testing to see if there is a difference between the two samples
t.test(mpg_1999$hwy, mpg_2008$hwy, paired = T)

# ANOVA testing - below we are changing the cyl column from numberical to categorical to run our test
# the test is asking, "if thre any statistical difference in the horsepower of a vehicle based on its engine type

mtcars_filt <- mtcars[,c('hp', 'cyl')] # we are filtering columns from the mtcars dataframe
mtcars_filt$cyl <- factor(mtcars_filt$cyl) # now using the factor() function to convert the numeric column to a categorical one

aov(hp ~ cyl, data = mtcars_filt) # comparing the means across the different cylinder counts, 4,6,8

# to get the p-values, wrap the above in a summary() function
summary(aov(hp~cyl, data = mtcars_filt))
