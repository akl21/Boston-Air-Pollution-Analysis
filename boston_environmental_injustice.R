#load libraries
library(MASS)
library(ggplot2)

#assign the Boston data set to df
df = Boston

#create a column that shows whether the low socioeconomic status
#percentage is below or above the median
df$lstat.med = ifelse(df$lstat > median(df$lstat), "Above Median",
                      "Below Median")

#make a boxplot of the air pollution by socioeconomic status
ggplot(df)+
  geom_boxplot(aes(x = lstat.med, y = nox), fill = "blue") +
  labs(x = "Low Socioeconomic Status Percentage", 
       y = "Nitrogen Oxide Pollution",
       title = "Boston Air Pollution by Socioeconomic Status")
