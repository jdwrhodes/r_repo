library(tidyverse)

bar_plt <- ggplot(mpg,aes(x=class)) # importing dataset 'mpg' into ggplot2

bar_plt + geom_bar() # here we are adding the geom_bar() to actually plot the plt data in a bar chart. geom_bar() only needs an x value to plot, it generates the y on it's own

count(mpg)

mpg_summary <- mpg %>% group_by(manufacturer) %>% summarize(Vehicle_Count=n(), .groups = 'keep') # creating summary table. n() counts the number of observation occurrences

mpg_plt <- ggplot(mpg_summary, aes(x=manufacturer, y=Vehicle_Count)) # import dataset into ggplot2

# mpg_plt + geom_col() # bar chart of mpg_plt. here using geom_col() takes both the x and y data, setting the value for both.


#mpg_plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") # here we've added labels along the x/y axis

mpg_plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") + 
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

