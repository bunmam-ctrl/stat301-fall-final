# maternal in developing countries

maternal_develope <- gender_social_factor_filter|>
  summarize(
    Mean = mean(maternal_mortality,  na.rm = TRUE),
    Median = median(maternal_mortality,  na.rm = TRUE),
    "Interquartile Range" = IQR(maternal_mortality,  na.rm = TRUE)
  )

# maternal worldwide
maternal_global <- gender_social_factor|>
  summarize(
    Mean = round(mean(maternal_mortality, na.rm = TRUE)),
    Median = round(median(maternal_mortality,  na.rm = TRUE)),
    "Interquartile Range" = round(IQR(maternal_mortality,  na.rm = TRUE))
  )

## Combine the table

#| label: tbl-2-afri-maternal-summary
#| tbl_cap: "Comparison of adolescent birth rates per 1,000 women ages 15-19 in 2021: Worldwide  versus developing regions in Africa, Western, Central, South, and Southeastern Asia."
# 
maternal_summary <- bind_rows(maternal_develope, maternal_global)|>
  mutate(" " = c( "Developing Regions","Worldwide"), 
         .before =1)|>
  t()

maternal_summary <- knitr::kable(maternal_summary)
save(maternal_summary, file = "figure_africa_asia/table_2_maternal_summary.rda")

# Load the dataframe back into the R environment
#load("figure_africa_asia/table_2_maternal_summary.rda")
