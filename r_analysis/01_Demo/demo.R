demo_table <-read.csv(file='./data/demo.csv', check.names = F, stringsAsFactors = F)

library(jsonlite)
demo_table2 <- fromJSON(txt = './data/demo.json')
numlist[2]
demo_table[3, 'Year']
demo_list <- demo_table$Vehicle_Class
demo_list2 <- demo_table$'Vehicle_Class'


5 %% 4

newer_cars <- demo_table[demo_table$Year >= 2018,]

filter_table <- demo_table2[demo_table2$price > 10000,]

demo_table3 <- subset(demo_table2, price > 10000 & drive == '4wd' & 'clean' %in% title_status)
#filtering by price, drivetrain, and title status

sample(numlist, size=3)

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
