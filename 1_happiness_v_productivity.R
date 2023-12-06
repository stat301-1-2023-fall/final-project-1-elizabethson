# happiness by region
mean_happiness_by_region <- gdp_happiness |> 
  group_by(region) |> 
  summarise(mean_happiness = mean(happiness_score, na.rm = TRUE))

mean_happiness_by_region |> 
  ggplot(aes(x = region, y = mean_happiness)) +
  geom_col() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title="Happiness by Region", 
       x="Region", y= "Average Happiness Score") + 
  theme_minimal()

# productivity by region
mean_productivity_by_region <- gdp_happiness |> 
  group_by(region) |> 
  summarise(mean_gdp_ppp_over_labor_force = mean(gdp_ppp_over_labor_force, na.rm = TRUE))

mean_productivity_by_region |> 
  ggplot(aes(x = region, y = mean_gdp_ppp_over_labor_force)) +
  geom_col() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title="Productivity by Region", 
       x="Region", y= "Average GDP PPP / Labor Force") + 
  theme_minimal()

# happiness_score v. gdp_ppp_over_labor_force by region
gdp_happiness |> 
  ggplot(aes(x = gdp_ppp_over_labor_force, y = happiness_score)) +
  geom_jitter() +
  facet_wrap(vars(region)) +
  geom_smooth(method = lm, se = FALSE) + 
  theme_minimal()
