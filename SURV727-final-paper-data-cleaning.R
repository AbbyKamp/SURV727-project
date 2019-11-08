#SURV727 Final Project

#inital install
install.packages("'rjson'")

#packages to install
library(dplyr)
library(rtweet)
library(rjson)
library(readTwe)

#uploading washington-state data
wash_data <- read_csv("~/Data-cleaning/final-paper/data/washington-2018-results.csv")
head(wash_data)

#filtering results to only keep intiative 1631
results <-
wash_data %>%
  select(County, Race, Candidate, Votes, PercentageOfTotalVotes) %>%
  filter(Race == "State Measures Initiative Measure No. 1639 Initiative Measure No. 1639 concerns firearms.")
  
# Abby's Twitter API tokes
create_token(
  app = "SURV727",
  consumer_key = "",
  consumer_secret = "",
  access_token = "",
  access_secret = " ")

#get the token
get_token()

##TESTING PULLS##
#grabbing Yesto1631 trends
#only results in 3 tweets
yes_1631 <- search_fullarchive ("#Yesto1631",n = 100, env_name = "SURV727",
                               fromDate ="201810010000",toDate = "201811082359")

#getting yeson1631
yeson1631 <- search_fullarchive ("YesOn1631",n = 100, env_name = "SURV727",
                                fromDate ="201810010000",toDate = "201811082359")

#getting yeson1631, take 2 without a hashtag
yes_nohashtag <- search_fullarchive ("YesOn1631",n = 100, env_name = "SURV727",
                                 fromDate ="201810010000",toDate = "201811082359")

#trying neutral 1631 search
neutral <- search_fullarchive("Initiative1631", n = 100, env_name = "SURV727",
                                fromDate ="201810010000",toDate = "201811082359")

neutral2 <- search_fullarchive("Initiative1631", n = 100, env_name = "SURV727",
                                fromDate ="201810010000",toDate = "201811082359")


##PULLING YES TWEETS##
yes_week1 <- search_fullarchive("YesOn1631 OR Yesto1631", n = 100, env_name = "SURV727",
                                fromDate ="201810090000",toDate = "201810152359")

yes_week2 <- search_fullarchive("YesOn1631 OR Yesto1631", n = 100, env_name = "SURV727",
                                fromDate ="201810160000",toDate = "201810222359")

yes_week3 <- search_fullarchive("YesOn1631 OR Yesto1631", n = 250, env_name = "SURV727",
                                fromDate ="201810230000",toDate = "201810292359")

yes_week4 <- search_fullarchive("YesOn1631 OR Yesto1631", n = 250, env_name = "SURV727",
                                fromDate ="201810300000",toDate = "201811062359")

#merging the four yes objects and saving to one file
yes_4_weeks <- do.call("rbind", list(yes_week1, yes_week2, yes_week3, yes_week4))

##Pulling NEUTRAL Tweet"
neutral_week1 <- search_fullarchive("#initiative1631 OR (initiative 1631)", n = 100, 
                                    env_name = "SURV727", fromDate ="201810090000", toDate = "201810152359")

neutral_week2 <- search_fullarchive("#initiative1631 OR (initiative 1631)", n = 100, env_name = "SURV727",
                                fromDate ="201810160000",toDate = "201810222359")

neutral_week3 <- search_fullarchive("#initiative1631 OR (initiative 1631)", n = 250, env_name = "SURV727",
                                    fromDate ="201810230000",toDate = "201810292359")

neutral_week4 <- search_fullarchive("#initiative1631 OR (initiative 1631)", n = 250, env_name = "SURV727",
                                fromDate ="201810300000",toDate = "201811062359")
#merging the neutral weeks
netural_4_weeks <- do.call("rbind", list(neutral_week1, neutral_week2, neutral_week3, neutral_week4))

