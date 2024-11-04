
## Why this data
# Abortion
#Tbl
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
      * 100, 2)
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
  )
knitr::kable(abortion_summary)

# Graph 
vis_miss(abortion) +
  labs(title = "Missing Values in Global Abortion Incidence Dataset",
       subtitle = "Graph 1") +
  theme_minimal()+
  coord_flip()+
  scale_fill_manual(values = c("darkorchid4","yellow"), 
                    labels = c("Present", "Missing")) +
  guides(fill = guide_legend(title = "Data Status"))+
  coord_flip()

na_table_1 <- abortion|>
  gg_miss_var()+
  labs(
    title = "Missing Values in Global Abortion Incidence Dataset",
    subtitle = "Graph 1") +
  theme_minimal()


na_table_1


#Violence
#Table

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
      * 100, 2)
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
  )

knitr::kable(violence_summary)
#Graph
vis_miss(violence) +
  labs(title = " Missing Values inDomestic Violence Against Women Dataset",
       subtitle = "Graph 2") +
  theme_minimal()+
  scale_fill_manual(values = c("darkorchid4","yellow"), 
                    labels = c("Present", "Missing")) +
  guides(fill = guide_legend(title = "Data Status"))+
  coord_flip()

na_table_2 <- violence|>
  gg_miss_var()+
  labs(title = " Missing Values inDomestic Violence Against Women Dataset",
       subtitle = "Graph 2")+
  theme_minimal()


na_table_2
## Data quality & complexity check
skimr::skim(pregnancy)
skimr::skim(violence)
