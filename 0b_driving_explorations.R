library(tidyverse)
# The following figures were used in Progress Memo 2: 

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

# The following was created for the Final Project

## missingness in hours_worked
# count NA values for each column
library(dplyr)
gdp_happiness |> 
  summarise(across(everything(), ~ sum(is.na(.)))) |> 
  pivot_longer(everything(), names_to = "variable", values_to = "na_count") |> 
  slice_max(na_count, n = 15) |> 
  knitr::kable()

# why so many missing gdp_ppp_over_k_hours_worked_c
gdp_happiness |> 
  mutate(missing_hours_worked = is.na(hours_worked),
         missing_total_hours = is.na(total_hours),
         missing_hours_per_employed = is.na(hours_per_employed),
         missing_gdp_ppp_over_k_hours_worked = is.na(gdp_ppp_over_k_hours_worked),
         missing_gdp_ppp_over_k_hours_worked_c = is.na(gdp_ppp_over_k_hours_worked_c)) |> 
  count(missing_hours_worked, missing_total_hours, missing_hours_per_employed, missing_gdp_ppp_over_k_hours_worked, missing_gdp_ppp_over_k_hours_worked_c) |> 
  knitr::kable()

## new corrplot with relevant variables
corr <- gdp_happiness |> 
  select(pop:employment_rate, employed, gdp_over_pop:gdp_over_pop_c, happiness_score) |> 
  cor(use = "complete.obs")
ggcorrplot::ggcorrplot(corr)
