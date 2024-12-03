#| label: tbl-1-china-global-rank
#| tbl-cap: "China's Rank in Global Development and Gender Equality Indice in 2021"
china_global_rank <- gender_inequality_tidy|>
  filter(country == "China")|>
  select(human_development_groups, hdi_rank_2021, gii_rank_2021)|>
  rename(
    " Human Development Groups" = human_development_groups,
    "Human Development Index Rank" = hdi_rank_2021,
    "Gender Inequality Index Rank" = gii_rank_2021
  )|>
  t()


china_global_rank <- knitr::kable(china_global_rank)
save(china_global_rank, file = "figure_china/table_1_china_global_rank.rda")

# Load the dataframe back into the R environment
#load("figure_china/table_1_china_global_rank.rda")