#| label: tbl-1-china-global-rank
#| tbl-cap: "China's Rank in Global Development and Gender Equality Indice in 2021"
china_global_rank <- gender_inequality_tidy|>
  filter(country == "China")|>
  select(human_development_groups, hdi_rank_2021, gii_rank_2021)|>
  rename(
    " Human Development Groups" = human_development_groups,
    "Human Development Index Rank" = hdi_rank_2021,
    "Gender Inequality Index Rank" = gii_rank_2021
  )

china_social_factor <-  gender_social_factor|>
  filter(country == "China")|>
  select(maternal_mortality, f_secondary_educ, f_labour_force)|>
  rename(
    "Maternal mortality (deaths per 100,000 live births)" = maternal_mortality,
    "Percent of Females with Secondary Education Degree (%)" = f_secondary_educ,
    "Percent of Female Labour Force Participation (%)" = f_labour_force
  )

china_global_rank <- bind_cols(china_global_rank,china_social_factor )|>
  t()

china_global_rank <- knitr::kable(china_global_rank)
save(china_global_rank, file = "figure_china/table_1_china_global_rank.rda")

# Load the dataframe back into the R environment
#load("figure_china/table_1_china_global_rank.rda")