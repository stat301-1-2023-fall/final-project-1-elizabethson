# happiness_score v. gdp_ppp_over_labor_force by region
gdp_happiness |> 
  ggplot(aes(x = gdp_ppp_over_labor_force, y = happiness_score)) +
  geom_jitter() +
  facet_wrap(vars(region)) +
  geom_smooth(method = lm, se = FALSE)

# happiness by region
gdp_happiness |> 
  ggplot(aes(x = region, y = happiness_score)) +
  geom_col() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title="Happiness by Region", 
       x="Region", y= "Happiness Score")

# productivity by region
gdp_happiness |> 
  ggplot(aes(x = region, y = gdp_ppp_over_labor_force)) +
  geom_col() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title="Productivity by Region", 
       x="Region", y= "GDP PPP / Labor Force")
