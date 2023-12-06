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
  ggplot(aes(x = gdp_ppp_over_labor_force, y = unemployment_r)) +
  geom_jitter() +
  theme_minimal() +
  facet_wrap(vars(region)) +
  geom_smooth(method = lm, se = FALSE) +
  labs(title="Unemployment Rate v. Productivity", 
       x="GDP PPP / Labor Force", y= "Unemployment Rate",
       subtitle = "by Region")

# 3-var plot by region
gdp_happiness |> 
  ggplot(aes(x = gdp_ppp_over_labor_force, y = unemployment_r, size = happiness_score)) +
  geom_jitter()
