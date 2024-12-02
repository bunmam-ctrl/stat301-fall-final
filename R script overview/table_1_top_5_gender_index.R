
#label: tbl-1-top-5
# tbl-cap: "Top 5 Countries with the Highest Gender Inequality in 2021"

top_5_gender_inequality <- gender_inequality_tidy|>
  slice_max(n =5, order_by = gender_inequality_index_2021, with_ties = TRUE)|> 
  select(country, undp_developing_regions, gii_rank_2021,hdi_rank_2021)|>
  rename(
    "Country" = country,
    "Subregions"= undp_developing_regions,
    "Human Development Index Rank" = hdi_rank_2021,
    "Gender Inequality Index Rank" = gii_rank_2021
  )

#knitr::kable(top_5_gender_inequality)
