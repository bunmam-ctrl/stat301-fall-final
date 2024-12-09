#| label: fig-1-china-gender-index
#| fig-cap: "Decreasing Trajectory of the Gender Inequality Index in China from 1990 to 2021."

# data preparation
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

# graph 
china_gender_index|>  
  ggplot(aes(x = year, y = gender_inquality_index))+
  geom_line( linewidth = 1.2, color = "darkslateblue")+
  scale_x_continuous( breaks = seq(1990, 2021, by = 5))+
  theme_minimal() +
  labs(
    title = "Gender Inequality Index Over Time in China",
    x = "Year",
    y = "Gender Inequality Index"
  ) +
  theme(
    plot.title = element_text(size = 32, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 28),
    axis.text.x = element_text(size = 24, hjust = 1),
    axis.text.y = element_text(size = 24)
  )

# save
ggsave(filename = "china_gender_index.png", path = "figure_china")