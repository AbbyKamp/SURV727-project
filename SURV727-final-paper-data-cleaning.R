#SURV727 Final Project

#packages to install
library(dplyr)
library(rtweet)

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
  consumer_key = "5cRDeDWFYi05VntBoIqIPcE6s",
  consumer_secret = "bn16jHvC9CaTyruxO1HsJvhdosO25vUyUn3RSZFrmzTHGpDywf",
  access_token = "1181191211186606080-jPCRfVki97q38Eqw8tQclnq08Bjuad",
  access_secret = "MAucp4yoOPX1PX9DFGPlTB0rBjQt5afaQhjJdc6rSEmWR")

#get the token
get_token()

#grabbing Yesto1631 trends
yes_1631 <- search_fullarchive ("#Yesto1631",n = 100, env_name = "SURV727",
                               fromDate ="201810010000",toDate = "201811082359")

#getting yeson1631
yeson1631 <- search_fullarchive ("YesOn1631",n = 100, env_name = "SURV727",
                                fromDate ="201810010000",toDate = "201811082359")

#getting yeson1631, take 2 without a hashtag
yes_nohashtag <- search_fullarchive ("YesOn1631",n = 100, env_name = "SURV727",
                                 fromDate ="201810010000",toDate = "201811082359")

#trying neutral 1631 search
neutral <- search_fullarchive ("Initiative1631", n = 100, env_name = "SURV727",
                                fromDate ="201810010000",toDate = "201811082359")

#this wasn't working
#testing get_trends
trends <- get_trends(bbox = c(-116.55, 45.33, -124.46, 49))