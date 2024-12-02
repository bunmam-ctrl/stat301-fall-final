# Top 5 global gender inequality index (table 1)
top_5_gender_inequality <- gender_inequality_tidy|>
  slice_max(n =5, order_by = gender_inequality_index_2021, with_ties = TRUE)|> 
  select(country, undp_developing_regions, gender_inequality_index_2021,hdi_rank_2021)|>
  rename(
    "Country" = country,
    "Subregions"= undp_developing_regions,
    "Human Development Index Rank" = hdi_rank_2021,
    "Gender Inequality Index" = gender_inequality_index_2021
  )

knitr::kable(top_5_gender_inequality)


#Justification for Violence in each category and subregions (Table 2) 
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

knitr::kable(violence_subregion_category)
