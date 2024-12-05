#| label: tbl-china-pop-summary
#| tbl-cap: "Summary Statistics of the China Population by Gender and Urban/Rural Dataset"

china_pop_summary <- china_population|>
  summarize(
    observations_number = nrow(china_population),
    variables_number = ncol(china_population),
    numerical_variables_number = sum(
      sapply(china_population, is.numeric)),
    categorical_variables_number = sum(
      sapply(china_population, is.character)),
    missing_values_total_number = sum(
      is.na(china_population)),
    percentage_missing_number = round(
      sum(
        is.na(china_population)) / (nrow(china_population) * ncol(china_population)) 
      * 100)
  )|>
  rename(
    "Observation" = observations_number,
    "Variables" = variables_number,
    "Numerical variables" =  numerical_variables_number,
    "Categorical variables" =  categorical_variables_number,
    "Missing values" =  missing_values_total_number,
    "Missing values percentage" = percentage_missing_number
  )|>
  pivot_longer(
    cols = everything(),
    names_to = "Metric",
    values_to = "Number"
  )|>
  mutate(
    Number = as.integer(Number)
  )


china_pop_summary <- knitr::kable(china_pop_summary)
save(china_pop_summary, file = "figure_data/table_6_china_pop_summary.rda")

# Load the dataframe back into the R environment
#load("figure_data/table_6_china_pop_summary.rda")