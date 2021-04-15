library(tidyverse)

zillow_data <- read_csv(file = './data/zillow_orange_county_2017.csv')

someFunction <- function(x,y,z) {
  result <- x + y + z
  return (result)
} 

functionResult <- someFunction(1,2,3)

sqft_gt_filter <- function (data, sqft) {
  filteredData <- zillow_data[deframe(data['finishedsquarefeet']) > sqft,]
  return (filteredData)
}

zillow_1500sqft <- sqft_gt_filter(zillow_data, 1500)

