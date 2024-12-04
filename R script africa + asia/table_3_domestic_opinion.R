#| label: tbl-2-afri-just-violence
# tbl-cap: "Comparative Data on Justifications for Violence by Region"

violence_subregion_category <-violence_tidy|>
  group_by(subregion, justify_violence)|>
  summarise(total_value_agree = sum(value_agree, na.rm = TRUE))|>
  ungroup()|>
  mutate(
    prop = total_value_agree/ sum(total_value_agree),
    prop = round(prop, digits = 3)*100
  )|>
  select(prop, subregion, justify_violence)|>
  drop_na()|>
  pivot_wider(
    names_from = subregion,
    values_from = prop
  )|>
  rename(
    "Justification for Violence" = justify_violence 
  )
  
  violence_subregion_category <- knitr::kable(violence_subregion_category)
  save(violence_subregion_category, file = "figure_africa_asia/table_1_violence_subregion_category.rda")
  
  # Load the dataframe back into the R environment
  #load("figure_africa_asia/table_1_violence_subregion_category.rda")
  