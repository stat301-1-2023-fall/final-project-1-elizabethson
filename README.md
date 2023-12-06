## Happiness- A Sacrifice for Productivity?: an EDA

This repository is for an analysis of data on happiness and GDP variables for countries from the years 2015 to 2019.

The repository is broken into four sections: Data, R Scripts, Progress Memos, and Final Files. The `Data` section was created first to make analyses in the `R Scripts` and presented in the `Final Files`.

## What is in the repo:

### Data:
- `/data`: joined dataset and raw data
  - `gdp_happiness.rds`: joined dataset of raw data
  - `/raw`: raw data

### R Scripts:
- `0a_data_cleaning.R`: updated country names, joined datasets, added `year` variable, changed `region` to a factor. 
- `0b_driving_explorations.R`: initial explorations used for `Son_Elizabeth_Progress_Memo_2.qmd`; also includes analysis on missingness in variables, explored further in `Son_Elizabeth_Final_Report.qmd` Appendix section
- `1_happiness_v_productivity.R`: bivariate analyses on happiness and productivity, faceted by region
- `2_happiness_v_unemployment.R`: bivariate analyses on happiness and unemployment, faceted by region
- `3_multivar_analysis.R`: multivariate analyses on happiness, unemployment, and productivity, faceted by region 
- `4_time_trends.R`: ranking of countries based on happpiness and productivity; happiness and productivity over time for the top 3 countries

### Progress Memos:
- `Son_Elizabeth_Progress_Memo_1.qmd`: Progress Memo 1 with initial project guideline, data quality and complexity check, and potential data issues
- `Son_Elizabeth_Progress_Memo_2.qmd`: Progress Memo 2 with initial data cleaning and joining, correlation plot, exploratory graphs, initial conclusions, and next steps

### Final Files:
- `Son_Elizabeth_Final_Report.qmd`: Final Report with project description, approach, and all conclusions
- `Son_Elizabeth_Executive_Summary.qmd`: Executive Summary with project description, approach, and key conclusions