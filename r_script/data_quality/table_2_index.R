#| label: tbl-index-summary
#| tbl-cap: "Summary Statistics of the Gender Inequality Index Dataset"

  index_summary <- gender_inequality|>
  summarize(
    observations_number = nrow(gender_inequality),
    variables_number = ncol(gender_inequality),
    numerical_variables_number = sum(
      sapply(gender_inequality, is.numeric)),
    categorical_variables_number = sum(
      sapply(gender_inequality, is.character)),
    missing_values_total_number = sum(
      is.na(gender_inequality)),
    percentage_missing_number = round(
      sum(
        is.na(gender_inequality)) / (nrow(gender_inequality) * ncol(gender_inequality)) 
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


index_summary <- knitr::kable(index_summary)
save(index_summary, file = "figure_data/table_2_index_summary.rda")

# Load the dataframe back into the R environment
#load("figure_data/table_2_index_summary.rda")