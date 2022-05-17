library(tidyverse)

personal_data <- read_csv("data/personal_data.csv")


df1_sport <- personal_data %>%
  group_by(Sport) %>%
  count(Sport) %>%
  tally(n)

df1_sport