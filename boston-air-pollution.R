#load libraries
library(MASS)
library(ggplot2)

#assign the Boston data set to df
df = Boston

#create a column that shows whether the low socioeconomic status
#percentage is below or above the median
df$lstat.med = ifelse(df$lstat > median(df$lstat), "Above Median",
                      "Below Median")

#make a box plot of the air pollution by socioeconomic status
ggplot(df)+
  geom_boxplot(aes(x = lstat.med, y = nox, fill = lstat.med)) +
  labs(x = "Low Socioeconomic Status Percentage", 
       y = "Nitrogen Oxide Pollution",
       title = "Boston Air Pollution by Socioeconomic Status Box Plot") +
  theme(legend.position = "none")

#compare mean air pollution by socioeconomic status category of 
#below or above median
mean(df$nox[df$lstat.med == "Above Median"])
mean(df$nox[df$lstat.med == "Below Median"])

#conduct t-test of the two groups
t.test(nox ~ lstat.med, data = df)
#t test is highly significant

#make a scatter plot of air pollution by socioeconomic status
ggplot(df) +
  geom_point(aes(x = lstat, y = nox), color = "blue") + 
  labs(x = "Low Socioeconomic Status Percentage",
       y = "Nitrogen Oxide Pollution Concentration", 
       title = "Boston Air Pollution by Socioeconomic Status Scatter Plot")
