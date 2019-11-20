#uploading packages
#install.packages("dplyr")
#install.packages("rtweet")
#install.packages("readr")
#install.packages("tidyr")
library(rtweet)
library(dplyr)
library(tidyr)
library(readr)

#setting working directory
setwd("~/Data-cleaning/final-paper/data")

#uploading tweet data
tweets <- read_csv("tweets.csv")

#exploratory analysis
#checking place names
places <-
tweets %>%
  select(status_id, place_name, text) %>%
  group_by(place_name)%>%
  tally()

#pulling data on users from tweet file
 #users <- users_data(tweets)
 #save_as_csv(users, file_name = "twitter-users")
 
#pull twitter users data
 users <- read_csv("twitter-users.csv")
 
 #trying to see where most people are from
 users_location <-
  users %>%
   select(screen_name, location, followers_count, user_id) %>%
   group_by(location) %>%
   tally()
 
#begin cleanin the user data by dropping the NAs and separating into city and state where possible
users2 <-
  users %>%
   select(user_id, location, screen_name) %>%
   drop_na(.)

users3 <- separate(users2, location, into = c("city","state"), sep= (","))

#need to get rid of the white space
users3 <-
users3 %>%
  select(user_id, screen_name, city) %>%
  mutate(city = tolower(trimws(.$city)))

#uploading list of cities in washington to match with user information
cities <- read_csv("washington-cities.csv")

#renaming to match with other
colnames(cities)[1] <- "city"
colnames(cities)[2] <- "county"

#cleaning city data
cities <-
cities %>%
  mutate(city = tolower(trimws(.$city, "l")))

cities$city <- (gsub("\\s", "", cities$city))

str(users3$city)
str(cities$city)

#comparing the locations dataframe
full_location <- merge(users3, cities, by = "city")

#reordering city variables
full_location <-
full_location %>%
  select(user_id, screen_name, city, county)


str(full_location$user_id)
str(tweets$user_id)

#annoyingly full_location has an extra x in the user id so need to remove
full_location$user_id <- gsub("x", "", full_location$user_id)
tweets$user_id <- gsub("x", "", tweets$user_id)

#merge user location with actual tweets
tweets_location <-
  full_location %>% semi_join(tweets, by = "user_id")

#loading and cleaning votes info
votes <- read_csv("1631-county-votes.csv")
votes <-
  votes %>%
  select(County, Race, Candidate, Votes, PercentageOfTotalVotes) %>%
  filter(Race == "State Measures Initiative Measure No. 1639 Initiative Measure No. 1639 concerns firearms.")


sum(votes$Votes)