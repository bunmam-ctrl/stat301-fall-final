#| label: tbl-violence-summary
#| tbl-cap: "Summary Statistics of the Domestic Violence Against Women Dataset"

violence_summary <- violence|>
  summarize(
    observations_number = nrow(violence),
    variables_number = ncol(violence),
    numerical_variables_number = sum(
      sapply(violence, is.numeric)),
    categorical_variables_number = sum(
      sapply(violence, is.character)),
    missing_values_total_number = sum(
      is.na(violence)),
    percentage_missing_number = round(
      sum(
        is.na(violence)) / (nrow(violence) * ncol(abortion)) 
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


violence_summary <- knitr::kable(violence_summary)
save(violence_summary, file = "figure_data/table_3_violence_summary.rda")

# Load the dataframe back into the R environment
#load("figure_data/table_3_violence_summary.rda")