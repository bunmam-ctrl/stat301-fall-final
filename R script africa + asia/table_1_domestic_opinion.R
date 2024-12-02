# label: tbl-1-just-violence
# tbl-cap: "Comparative Data on Justifications for Violence by Region"

violence_subregion_category <-violence_tidy|>
  group_by(subregion, justify_violence)|>
  summarise(total_value = round(sum(value_agree, na.rm = TRUE)),
  )|>
  drop_na()|>
  pivot_wider(
    names_from = subregion,
    values_from = total_value
  )|>
  rename(
    "Justification for Violence" = justify_violence 
  )

#knitr::kable(violence_subregion_category)
