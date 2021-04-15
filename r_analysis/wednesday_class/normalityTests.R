#mpg_avg_ctyByMfg <- mpg %>% group_by(manufacturer) %>% summarize(avgCity = mean(cty))

#mtcars_mpg_avg <- mtcars %>% group_by(cyl) %>% summarize(avgMPG = mean(mpg))

library(tidyverse)
library(ggpubr)

toothData <-  ToothGrowth
ggdensity(toothData$len,
          xlab="Tooth Length - Dependent Variable")
shapiro.test(toothData$len)

populationMean <- mean(toothData$len)

samplePopulation <- toothData %>% sample_n(30)

t.test(samplePopulation$len, mu=populationMean, alternative = 'two.sided')

