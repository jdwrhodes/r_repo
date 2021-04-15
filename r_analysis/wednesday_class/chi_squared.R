#dinoData <- data.frame(
#  categories = c('Omni', 'Carni','Herbi'),
#  observed_values = c(220,55,25)
#)

#chisq.test(dinoData[['observed_values']])

cars <- mtcars

cars

table(cars$cyl)

prop.table(table(cars$cyl))
