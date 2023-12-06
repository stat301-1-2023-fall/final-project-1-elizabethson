library(tidyverse)
gdp_happiness <- read_rds("data/gdp_happiness.rds")

# unemployment_r v. gdp_ppp_over_labor_force
gdp_happiness |> 
  ggplot(aes(x = gdp_ppp_over_labor_force, y = unemployment_r)) +
  geom_jitter() +
  theme_minimal() +
  geom_smooth(method = lm, se = FALSE) +
  labs(title="Unemployment Rate v. Productivity", 
       x="GDP PPP / Labor Force", y= "Unemployment Rate")

# Unemployment Rate v. gdp_ppp_over_labor_force by region
gdp_happiness |> 
  ggplot(aes(x = unemployment_r, y = gdp_ppp_over_labor_force, color = happiness_score)) +
  geom_jitter() +
  theme_minimal() +
  facet_wrap(vars(region)) +
  geom_smooth(method = lm, se = FALSE, color = "gray") +
  labs(title="Productivity v. Unemployment Rate", 
       x="Unemployment Rate", y= "GDP PPP / Labor Force",
       color = "Happiness Score",
       subtitle = "by Region and including Happiness Score")

# table: metrics by region 
table_by_region <- gdp_happiness |>
  group_by(region) |>
  summarise(
    mean_gdp_ppp_over_labor_force = mean(gdp_ppp_over_labor_force, na.rm = TRUE),
    mean_happiness = mean(happiness_score, na.rm = TRUE),
    mean_unemployment_r = mean(unemployment_r, na.rm = TRUE)
  )

table_by_region |> 
  knitr::kable()
