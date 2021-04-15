demo_table <-read.csv(file='./data/demo.csv', check.names = F, stringsAsFactors = F)

library(tidyverse)
library(jsonlite)
demo_table2 <- fromJSON(txt = './data/demo.json')

demo_table[3, 'Year']
demo_list <- demo_table$Vehicle_Class
demo_list2 <- demo_table$'Vehicle_Class'


5 %% 4

newer_cars <- demo_table[demo_table$Year >= 2018,]

filter_table <- demo_table2[demo_table2$price > 10000,]

demo_table3 <- subset(demo_table2, price > 10000 & drive == '4wd' & 'clean' %in% title_status)
#filtering by price, drivetrain, and title status

num_rows <- nrow(demo_table2)

sample_rows <- sample(num_rows, 3)

sample_table <- demo_table2[sample_rows,]

y <- nrow(demo_table2)


demo_table <- demo_table %>% mutate(Mileage_per_Year=Total_Miles/(2020-Year), IsActive=TRUE)

summarize_demo2 <- demo_table2 %>% 
  group_by(condition) %>% 
  summarize(Mean_Mileage=mean(odometer), .groups = 'keep')

summarize_demo3 <- demo_table2 %>% group_by(condition) %>% 
  summarize(Mean_Mileage=mean(odometer),Maximum_Price=max(price),Num_Vehicles=n(), .groups = 'keep') 
#create summary table with multiple columns

demo_table3 <- read.csv('./data/demo2.csv', check.names = F, stringsAsFactors = F)

long_tables <- gather(demo_table3, key="Metric", value="Score", buying_price:popularity)
# the above is used to create a new table with only the vehicle number, safety rating, Metric showing "Buying price" along with that value

wide_table <- spread(long_tables, key='Metric', value = "Score")
