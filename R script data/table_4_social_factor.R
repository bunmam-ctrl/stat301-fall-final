#| label: tbl-social-factor-summary
#| tbl-cap: "Summary Statistics of the Gender Social Factors Dataset"

  social_factor_summary <- gender_social_factor|>
  summarize(
    observations_number = nrow(gender_social_factor),
    variables_number = ncol(gender_social_factor),
    numerical_variables_number = sum(
      sapply(gender_social_factor, is.numeric)
    ),
    categorical_variables_number = sum(
      sapply(gender_social_factor, is.character)
    ),
    missing_values_total_number = sum(
      is.na(gender_social_factor)
    ),
    percentage_missing_number = round(
      sum(
        is.na(gender_social_factor)) / (nrow(gender_social_factor) * ncol(gender_social_factor))
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


 social_factor_summary <- knitr::kable(social_factor_summary)
save(abortion_summary, file = "figure_data/table_4_social_factor_summary.rda")

# Load the dataframe back into the R environment
#load("figure_data/table_2_social_factor_summary.rda")