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

