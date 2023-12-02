library(tidyverse)

## fig 1:
corr <- gdp_happiness |> 
  select(pop:gdp_ppp_over_k_hours_worked_c, happiness_score) |> 
  cor(use = "complete.obs")
ggcorrplot::ggcorrplot(corr)

## fig 2-4:
gdp_happiness |> 
  ggplot(aes(x = gdp_ppp_over_labor_force, y = happiness_score)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE) +
  labs(title="Happiness Score vs. GDP per Person Over Labor Force", 
       x="GDP per Person Over Labor Force", y= "Happiness Score")

gdp_happiness |> 
  ggplot(aes(x = employment_rate, y = happiness_score)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE) +
  labs(title="Happiness Score vs. Employment Rate", 
       x="Employment Rate", y= "Happiness Score")

gdp_happiness |> 
  ggplot(aes(x = hours_per_employed, y = happiness_score)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE) +
  labs(title="Happiness Score vs. Hours Worked per Employed Person", 
       x="Hours Worked per Employed Person", y= "Happiness Score")

## fig 5:
gdp_happiness |> 
  ggplot(aes(region)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

## fig 6:
gdp_happiness |> 
  ggplot(aes(x = hours_per_employed, y = happiness_score)) +
  geom_jitter(color = "tomato3") +
  facet_wrap(vars(region))

