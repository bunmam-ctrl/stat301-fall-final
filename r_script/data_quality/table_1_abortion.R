#| label: tbl-abortion-summary
#| tbl-cap: "Summary Statistics of the Global Abortion Incidence Dataset"

abortion_summary <- abortion|>
  summarize(
    observations_number = nrow(abortion),
    variables_number = ncol(abortion),
    numerical_variables_number = sum(
      sapply(abortion, is.numeric)
    ),
    categorical_variables_number = sum(
      sapply(abortion, is.character)
    ),
    missing_values_total_number = sum(
      is.na(abortion)
    ),
    percentage_missing_number = round(
      sum(
        is.na(abortion)) / (nrow(abortion) * ncol(abortion))
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


abortion_summary <- knitr::kable(abortion_summary)
save(abortion_summary, file = "figure_data/table_1_abortion_summary.rda")

# Load the dataframe back into the R environment
#load("figure_data/table_1_abortion_summary.rda")
