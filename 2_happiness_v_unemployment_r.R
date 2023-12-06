# happiness_score v. unemployment_r
gdp_happiness |> 
  ggplot(aes(x = unemployment_r, y = happiness_score)) +
  geom_jitter() +
  theme_minimal() +
  geom_smooth(method = lm, se = FALSE) +
  labs(title="Happiness Score v. Unemployment Rate", 
       x = "Unemployment Rate", y= "Happiness Score")

# unemployment_r by region
mean_unemployment_r_by_region <- gdp_happiness |> 
  group_by(region) |> 
  summarise(mean_unemployment_r = mean(unemployment_r, na.rm = TRUE))

mean_unemployment_r_by_region |> 
  ggplot(aes(x = region, y = mean_unemployment_r)) +
  geom_col() +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title="Unemployment Rate by Region", 
       x="Region", y= "Average Unemployment Rate")

# happiness_score v. unemployment_r by region
gdp_happiness |> 
  ggplot(aes(x = unemployment_r, y = happiness_score)) +
  geom_jitter() +
  theme_minimal() +
  facet_wrap(vars(region)) +
  geom_smooth(method = lm, se = FALSE) +
  labs(title="Happiness Score v. Unemployment Rate", 
       x="Unemployment Rate", y= "Happiness Score",
       subtitle = "by Region")

