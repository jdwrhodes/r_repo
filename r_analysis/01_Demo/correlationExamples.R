library(ggplot2)

zillow_data <- read_csv(file = './data/zillow_orange_county_2017.csv')

#plotObject <- ggplot(data = zillow_data, mapping = aes(x=yearbuilt, y=homevalue))

#plotObject + geom_point()

cor(zillow_data['yearbuilt'], zillow_data['homevalue'])

cor(zillow_data['yearbuilt'], zillow_data['finishedsquarefeet'])

corMatrix <- as.matrix(zillow_data[,c('finishedsquarefeet', 'homevalue','taxvaluedollarcnt')])

cor(corMatrix)
