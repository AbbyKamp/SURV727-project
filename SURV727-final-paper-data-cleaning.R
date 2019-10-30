#SURV727 Final Project

#packages to install
library(dplyr)

#uploading washington-state data
wash_data <- read_csv("~/Data-cleaning/final-paper/data/washington-2018-results.csv")
head(wash_data)

#filtering results to only keep intiative 1631
results <-
wash_data %>%
  select(County, Race, Candidate, Votes, PercentageOfTotalVotes) %>%
  filter(Race == "State Measures Initiative Measure No. 1639 Initiative Measure No. 1639 concerns firearms.")
  
# Twitter API
create_token(
  app = "Project727",
  consumer_key = "9QNMbZyUIoD0PhIX8ucEqqILp",
  consumer_secret = "qBoORiu2VgDJAXHqceq24XJzmLyfq5ktwXXAI06n98uhQ3HJCk",
  access_token = "1188871434740862976-JhfoMtGIvOs0S7WcnLov0A5VgzlUle",
  access_secret = "VriQtJZRAeWi2x8m6WrZoEAxpCWn5ROoNqInujL4M379d"
)


