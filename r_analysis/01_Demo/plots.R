library(tidyverse)

mpg <- mpg

bar_plt <- ggplot(mpg,aes(x=class)) # importing dataset 'mpg' into ggplot2

bar_plt + geom_bar() # here we are adding the geom_bar() to actually plot the plt data in a bar chart. geom_bar() only needs an x value to plot, it generates the y on it's own

count(mpg)

#mpg_summary <- mpg %>% group_by(manufacturer) %>% summarize(Vehicle_Count=n(), .groups = 'keep') # creating summary table. n() counts the number of observation occurrences

#mpg_plt <- ggplot(mpg_summary, aes(x=manufacturer, y=Vehicle_Count)) # import dataset into ggplot2

# mpg_plt + geom_col() # bar chart of mpg_plt. here using geom_col() takes both the x and y data, setting the value for both.


#mpg_plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") # here we've added labels along the x/y axis

#mpg_plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") + 
  theme (axis.text.x=element_text(angle=45, hjust=1))#adding + continues to the  next line. also the last function rotates the text on the x axis

hwy_mpg_summary <- subset(mpg, manufacturer=="toyota") %>% group_by(cyl) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep')
#The above creates a summary table

hwy_mpg_plt <- ggplot(hwy_mpg_summary,aes(x=cyl, y=Mean_Hwy)) # imports the above dataset and creates a ggplot object

#hwy_mpg_plt + geom_line()

hwy_mpg_plt + geom_line() + scale_x_discrete(limits=c(4,6,8)) + scale_y_continuous(breaks = c(15:30)) 
# the above modifies the ticks for the x and y axis

# cty_displ_plt <- ggplot(mpg, aes(x=displ, y=cty)) # importing dataset into ggplot2

# cty_displ_plt + geom_point() + xlab("Engine Size (L)") + ylab("City Fuel-Efficiency (MPG)") # here we create a scatter plot

# cty_displ_plt <- ggplot(mpg, aes(x=displ, y=cty, color=class)) # here we are assigning the Color column from mpg as the color

# cty_displ_plt + geom_point() + labs(x="Engine Size (L)", y = "City Fuel Efficiency (MPG)", color="Vehicle Class")
# again, assigning color to another variable within the dataset. Here this adds a title to the legend that is auto generated

cty_displ_plt <- ggplot(mpg,aes(x=displ,y=cty,color=class,shape=drv)) #import dataset into ggplot2

cty_displ_plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class",shape="Type of Drive") 
#add scatter plot with multiple aesthetics

#box_plt <- ggplot(mpg, aes(y=hwy)) # importing and creating the ggplot object

#box_plt + geom_boxplot() # boxplot 

box_plt <- ggplot(mpg,aes(x=manufacturer,y=hwy)) #import dataset into ggplot2, this also compares hwy mpg across manufacturers

box_plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1)) #add boxplot and rotate x-axis labels 45 degrees

# Heat maps

mpg_summary <- mpg %>% group_by(class, year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') # creates summary table

mpg_summary_plt <- ggplot(mpg_summary, aes(x=class, y=factor(year), fill=Mean_Hwy))

mpg_summary_plt + geom_tile() + labs(x="Vehicle Class", y="Vehicle Year", fill="Mean Highway (MPG)") # creates heatmap with labels

# heatmaps by model

mpg_model_summary <- mpg %>% group_by(model, year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') # again creating the summary table

mpg_model_summary_plt <- ggplot(mpg_model_summary, aes(x=model, y=factor(year), fill=Mean_Hwy)) # creating a ggplot object

mpg_model_summary_plt + geom_tile() + labs(x='Model', y='Vehicle Year', fill='Mean Highway (MPG)') +
  theme(axis.text.x = element_text(angle=90, hjust = 1, vjust = .5)) # specifies the style of the labels
# you may need to adjust the above hjust/vjust to have the labels line up with the ticks

# adding additional layers/context to visualizations
plt <- ggplot(mpg,aes(x=manufacturer, y=hwy)) #importing dataset into ggplot2

plt + geom_boxplot() + # this is the boxplot
  theme(axis.text.x = element_text(angle=45, hjust = 1)) + #rotating axis labels
  geom_point() #overpaying scatter plot on top

# more practice for adding additional layers
mpg_displ_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ), .groups='keep') # another summary table

mpg_displ_plt <- ggplot(mpg_displ_summary, aes(x=class, y=Mean_Engine)) # creating the ggplot object with the previous dataset

mpg_displ_plt + geom_point(size=4) + labs(x='Vehicle Class', y='Mean Engine Size') # adding scatter plot

# adding std deviation to the above
mpg_std_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ),SD_Engine=sd(displ), .groups = 'keep')

std_dev_plt <- ggplot(mpg_std_summary, aes(x=class, y=Mean_Engine))

std_dev_plt + geom_point(size=4) + labs(x='Vehicle Class', y='Mean Engine Size') +
  geom_errorbar(aes(ymin=Mean_Engine-SD_Engine, ymax=Mean_Engine+SD_Engine)) # here we create the overlay with std dev using error bars

# converting to long format to illustrate faceting()
mpg_long <- mpg %>% gather(key="MPG_Type",value="Rating",c(cty,hwy)) #convert to long format
head(mpg_long)

# visualize different mpg ratings by manufacturer using the mpg_long
plt_long <- ggplot(mpg_long, aes(x=manufacturer, y=Rating, color=MPG_Type))
plt_long + geom_boxplot() + theme(axis.text = element_text(angle=45, hjust=1))

# now using facet_wrap() to split the categorical data into 2 visualizations
plt_facet <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type)) #import dataset into ggplot2

plt_facet + geom_boxplot() + facet_wrap(vars(MPG_Type)) + #create multiple boxplots, one for each MPG type. vars() is a required argument for facet_wrap as it provides the list of grouping variables. in this case, MPG_Type to split the viz into cty and hwy
theme(axis.text.x=element_text(angle=45,hjust=1),legend.position = "none") + xlab("Manufacturer") #rotate x-axis labels

ggplot(mtcars, aes(x=wt)) + geom_density() # visualizing the distribution