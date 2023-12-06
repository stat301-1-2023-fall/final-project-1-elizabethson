# Happiest and Most Productive Country: 

happy_and_productive_countries <- gdp_happiness |> 
  filter(year == 2019) |> 
  filter(happiness_rank < 40) |> 
  slice_max(gdp_ppp_over_labor_force, n = 10) |> 
  mutate(rank = row_number()) |>
  select(rank, everything())

happy_and_productive_countries|> 
  knitr::kable()

# productivity v. happiness by time

## Luxembourg
gdp_happiness |> 
  filter(country == "Luxembourg") |> 
  ggplot(aes(x = year, y = gdp_ppp_over_labor_force, color = happiness_score)) +
  geom_jitter() +
  theme_minimal() +
  geom_smooth(method = lm, se = FALSE) +
  labs(title= "Productivity over Time in Luxembourg", 
       y = "GDP PPP / Labor Force", x = "Year", 
       color = "Happiness Score",
       subtitle = "including happiness score")

## Ireland
gdp_happiness |> 
  filter(country == "Ireland") |> 
  ggplot(aes(x = year, y = gdp_ppp_over_labor_force, color = happiness_score)) +
  geom_jitter() +
  theme_minimal() +
  geom_smooth(method = lm, se = FALSE) +
  labs(title= "Productivity over Time in Ireland", 
       y = "GDP PPP / Labor Force", x = "Year", 
       color = "Happiness Score",
       subtitle = "including happiness score")

## Singapore
gdp_happiness |> 
  filter(country == "Singapore") |> 
  ggplot(aes(x = year, y = gdp_ppp_over_labor_force, color = happiness_score)) +
  geom_jitter() +
  theme_minimal() +
  geom_smooth(method = lm, se = FALSE) +
  labs(title= "Productivity over Time in Singapore", 
       y = "GDP PPP / Labor Force", x = "Year", 
       color = "Happiness Score",
       subtitle = "including happiness score")
