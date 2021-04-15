library(tidyverse)

zillow_data <- read_csv(file = './data/zillow_orange_county_2017.csv')

zillow_data[1,1]

zillow_data[1, 'parcelid']

zillow_data[1:2, 1:14]

# queries

zillow_data[c(1,10,42), c('parcelid', 'bathroomcnt', 'bedroomcnt')]

finished_apts_2000sf <- zillow_data[deframe(zillow_data['finishedsquarefeet']) > 2000,]

