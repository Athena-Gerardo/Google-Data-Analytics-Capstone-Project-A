# 2020 Bikeshare Cleaning
# Analysis on 2020 Bikeshare Data using R Code 


# Organizing the Data

install.packages(“tidyverse”)
library(tidyverse)
bikeshare20 <- Bikeshare.2020.Data...Bikeshare.2020.Data
class(bikeshare20$ride_length)
sum(!complete.cases(bikeshare20$started_at)) 

# Note: Count rows with missing values from trips change the column name


# Find weekday usage

bikeshare20 <- bikeshare20 %>% select(ride_length, ride_id, member_casual, weekday, month)
library(ggplot2)
ggplot(data=bikeshare20) + geom_bar(mapping=aes(x=weekday, fill=member_casual)) +
facet_wrap(~member_casual)


# The members graph makes it hard to see the weekday casual riders
# Create a filter for only casual riders:

bikeshare20_casual <- bikeshare20 %>% filter(member_casual==‘casual’)
number_ticks <- function(n) {function(limits) pretty(limits, n)}#makes all ticks show on graph
ggplot(data=bikeshare20_casual) + geom_bar(mapping=aes(x=weekday), fill=“purple”) + labs(x=“Day of the Week
(1=Sunday)”, y=“Casual Riders”, title=“Casual Use by Weekday”, subtitle = “Jan-Mar 2020”) +
scale_x_continuous(breaks=number_ticks(7))


# For comparison, find weekly member riders:
bikeshare20_memb <- bikeshare20 %>% filter(member_casual==‘member’)
ggplot(data=bikeshare20_memb) + geom_bar(mapping=aes(x=weekday), fill=“lightblue”) + labs(x=“Day of the
Week (1=Sunday)”, y=“Membership Riders”, title=“Membership Use by Weekday”, subtitle = “Jan-Mar 2020”) +
scale_x_continuous(breaks=number_ticks(7))
