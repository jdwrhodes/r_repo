library(tidyverse)
library(ggpubr)

sprayData <- InsectSprays

ggdensity(sprayData$count, xlab = "Insect Count After Spray - Dependent Variable")

shapiro.test(sprayData$count) # this is a test for normality, a normal distribution

# for the above function:
# Hypothesis: it is a normal distribution
# Null Hypothesis: It is not a normal distribution
# when the p-value is less than 0.05, for this function, you can reject the null hypothesis

populationA <- subset(sprayData, spray == 'A')
populationB <- subset(sprayData, spray == 'B')
populationC <- subset(sprayData, spray == 'C')
populationD <- subset(sprayData, spray == 'D')
populationE <- subset(sprayData, spray == 'E')
populationF <- subset(sprayData, spray == 'F')

shapiro.test(populationA$count)

ggdensity(populationA$count, xlab = "Insect Count After Spray - Dependent Variable")

shapiro.test(populationB$count)

ggdensity(populationB$count, xlab = "Insect Count After Spray - Dependent Variable")

shapiro.test(populationC$count)

ggdensity(populationC$count, xlab = "Insect Count After Spray - Dependent Variable")

shapiro.test(populationD$count)

ggdensity(populationD$count, xlab = "Insect Count After Spray - Dependent Variable")

shapiro.test(populationE$count)

ggdensity(populationE$count, xlab = "Insect Count After Spray - Dependent Variable")

shapiro.test(populationF$count)

ggdensity(populationF$count, xlab = "Insect Count After Spray - Dependent Variable")

cleanData <- c(populationA, populationB, populationE, populationF)

shapiro.test(cleanData$count)

populationMean <- mean(cleanData$count)

populationASample <- populationA %>% sample_n(6)

t.test(populationASample$count, mu=populationMean, alternative = 'two.sided')


