# Get the Data

# Read in with tidytuesdayR package 
# Install from CRAN via: install.packages("tidytuesdayR")
# This loads the readme and all the datasets for the week of interest

# Either ISO-8601 date or year/week works!

tuesdata <- tidytuesdayR::tt_load('2021-08-10')
tuesdata <- tidytuesdayR::tt_load(2021, week = 33)

investment <- tuesdata$investment
ipd <- tuesdata$ipd
