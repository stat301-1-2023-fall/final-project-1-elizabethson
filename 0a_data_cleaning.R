library(readr)
library(tidyverse)
library(janitor)

# read in data
gdp_hours_worked <- read_csv("data/raw/gdp_over_hours_worked.csv")
happy_2015 <- read_csv("data/raw/2015.csv")
happy_2016 <- read_csv("data/raw/2016.csv")
happy_2017 <- read_csv("data/raw/2017.csv")
happy_2018 <- read_csv("data/raw/2018.csv")
happy_2019 <- read_csv("data/raw/2019.csv")

# make year adding function 
add_year <- function(data, year){
  data |> 
    mutate(year = {{year}}) |> 
    clean_names()
}

# add years
happy_2015_yr <- add_year(happy_2015, 2015)
happy_2016_yr <- add_year(happy_2016, 2016)
happy_2017_yr <- add_year(happy_2016, 2017)
happy_2018_yr <- add_year(happy_2016, 2018)
happy_2019_yr <- add_year(happy_2016, 2019)

# join data sets
joined_happiness <- bind_rows (happy_2015_yr, happy_2016_yr, happy_2017_yr, happy_2018_yr, happy_2019_yr)

# check that the primary key(s) uniquely identifies each observation
gdp_hours_worked |>
  count(country, year) |>
  filter(n > 1)

# check for missing values in primary key(s)
gdp_hours_worked |>
  filter(is.na(country) | is.na(year))

# edit gdp_hours_worked
gdp_hours_worked_renamed <- gdp_hours_worked |>
  mutate(country = ifelse(country == "Venezuela, RB", "Venezuela", country)) |> 
  mutate(country = ifelse(country == "Czechia", "Czech Republic", country)) |> 
  mutate(country = ifelse(country == "Slovak Republic", "Slovakia", country)) |> 
  mutate(country = ifelse(country == "Egypt, Arab Rep.", "Egypt", country)) |> 
  mutate(country = ifelse(country == "Yemen, Rep.", "Yemen", country)) |> 
  mutate(country = ifelse(country == "Iran, Islamic Rep.", "Iran", country)) |> 
  mutate(country = ifelse(country == "Lao PDR", "Laos", country)) |> 
  mutate(country = ifelse(country == "Syrian Arab Republic", "Syria", country)) |> 
  mutate(country = ifelse(country == "Turkiye", "Turkey", country)) |> 
  mutate(country = ifelse(country == "North Macedonia", "Macedonia", country)) |> 
  mutate(country = ifelse(country == "Cote d'Ivoire", "Ivory Coast", country)) |> 
  mutate(country = ifelse(country == "Kyrgyz Republic", "Kyrgyzstan", country)) |> 
  mutate(country = ifelse(country == "Hong Kong SAR, China", "Hong Kong", country)) |> 
  mutate(country = ifelse(country == "Russian Federation", "Russia", country)) |> 
  mutate(country = ifelse(country == "Korea, Rep.", "South Korea", country)) |> 
  mutate(country = ifelse(country == "Somaliland region", "Somalia", country))

# join
gdp_happiness <- gdp_hours_worked_renamed |> 
  full_join(joined_happiness, by = c("year", "country")) |> 
  filter(!is.na(happiness_rank))

# change region to factors
gdp_happiness <- gdp_happiness |> 
  mutate(region = factor(region))

# save
write_rds(gdp_happiness, "data/gdp_happiness.rds")

# read
gdp_happiness <- read_rds("data/gdp_happiness.rds")
