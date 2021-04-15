library(tidyverse)

zillow_data <- read_csv(file = './data/zillow_orange_county_2017.csv')

zillow_data <- zillow_data %>% mutate(acres=lotsizesquarefeet/43560)

regionzip <- zillow_data %>% group_by(regionidzip) %>% summarize(Mean_Home_Value=mean(homevalue), .groups = 'keep')

group_by_zip <- zillow_data %>% group_by(regionidzip) %>% summarize(Count=n(), .groups = 'keep')

group_by_year <- zillow_data %>% group_by(yearbuilt) %>% 
  summarize(Count=n(), Mean_Home_Value=mean(homevalue))

