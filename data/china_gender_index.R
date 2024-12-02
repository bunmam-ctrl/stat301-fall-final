china_gender_index <- gender_inequality_tidy|>
  filter(country == "China")|>
  select(country, starts_with("gender_inequality_index"))|>
  pivot_longer(
    cols = starts_with("gender_inequality_index"),
    names_to = "year",
    values_to = "gender_inquality_index",
    values_drop_na = TRUE
  )|>
  mutate(
    year = parse_number(year)
  )

china_gender_index|>  
  ggplot(aes(x = year, y = gender_inquality_index))+
  geom_line( linewidth = 1.2, color = "darkslateblue")+
  scale_x_continuous( breaks = seq(1990, 2021, by = 5))+
  theme_minimal() +
  labs(
    title = "Gender Inequality Index Over Time in China",
    subtitle = "Decadal Decline in Gender Disparity from 1990 to 2021",
    x = "Year",
    y = "Gender Inequality Index"
  ) +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(face = "italic", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text.x = element_text(size = 12, hjust = 1),
    axis.text.y = element_text(size = 12)
  )

#table
china_gender_index_summary <- gender_inequality_tidy|>
  filter(country == "China")|>
  select(human_development_groups, hdi_rank_2021, gii_rank_2021)|>
  rename(
    " Human Development Groups" = human_development_groups,
    "Human Development Index Rank" = hdi_rank_2021,
    "Gender Inequality Index Rank" = gii_rank_2021
  )|>
  t()


knitr::kable(china_gender_index_summary)