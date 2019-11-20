#uploading packages
library(rtweet)
library(dplyr)
library(tidyr)
library(readr)

#uploading new data
tweets <- read_csv("tweets.csv")

#checking number of observations
NROW(tweets)

#checking place names
places <-
tweets %>%
  select(status_id, place_name, text) %>%
  group_by(place_name)%>%
  tally()

places

#checking quotes locations
quote_places <-
  tweets %>%
  select(status_id, quoted_location, text) %>%
  group_by(quoted_location) %>%
  tally()
  
quote_places

#pulling data on users from tweet file
 users <- users_data(tweets)
 save_as_csv(users, file_name = "twitter-users")
 
 #trying to see where most people are from
 users_location <-
  users %>%
   select(screen_name, location, followers_count) %>%
   group_by(location) %>%
   tally()