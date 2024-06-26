# R Code 2019 Bikeshare Cleaning
# Analysis on 2019 Bikeshare Data using R Code


# Organizing the Data

install.packages(“tidyverse”)
library(tidyverse)
bikeshare19 <- X2019_Bikeshare_Data
sum(!complete.cases(bikeshare19$usertype)) 

# Note: count rows with missing values from trips and change the column name. Filter out NA values, select only useful data columns. We are trying to see what months most riders use the Bikeshare App.


# Split the ride start time away from the date

bikeshare19 <- separate(bikeshare19, col=start_time, into=c(‘Date’, ‘ride_start’), sep= ” “)


# Separating the end time

bikeshare19 <- separate(bikeshare19, col=end_time, into=c(‘Date’, ‘ride_end’), sep= ” “) glimpse(bikeshare19)


# Split the year from the month, then the month from the day

bikeshare19 <- separate(bikeshare19, col=Date, into=c(‘year’, ‘month’, ‘day’), sep=‘-’)


# Select only the month for the next analysis

bikeshare19 <- bikeshare19 %>% select(bikeid, trip_id, month, usertype, gender, from_station_name) %>%
arrange(month)


# Find relationships between months and usertypes

# Casual riders:

library(ggplot2) bikeshare19_casual <- filter(bikeshare19, usertype==‘Customer’)
ggplot(data=bikeshare19_casual) + geom_bar(mapping=aes(x=month), fill=‘purple’) + labs(x=“Month”, y=“Casual
Riders”, title=“Monthly Casual Rider Usage”, subtitle=“Jan-Jun 2019”) View(bikeshare19_casual)

# Member riders:

bikeshare19_memb <- filter(bikeshare19, usertype==‘Subscriber’)
ggplot(data=bikeshare19_memb) + geom_bar(mapping=aes(x=month), fill=‘lightblue’) + labs(x=“Month”,
y=“Membership Riders”, title=“Monthly Membership Rider Usage”, subtitle=“Jan-Jun 2019”)
View(bikeshare19_casual)
