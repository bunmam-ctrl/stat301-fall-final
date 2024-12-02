#| label: tbl-1-china-global-rank
#| tbl-cap: "China's Rank in Global Development and Gender Equality Indice in 2021"
china_gender_index_summary <- gender_inequality_tidy|>
  filter(country == "China")|>
  select(human_development_groups, hdi_rank_2021, gii_rank_2021)|>
  rename(
    " Human Development Groups" = human_development_groups,
    "Human Development Index Rank" = hdi_rank_2021,
    "Gender Inequality Index Rank" = gii_rank_2021
  )|>
  t()


#knitr::kable(china_gender_index_summary)