#dataset preparation
change_gender_dataset <- gender_inequality_tidy|> 
  slice_max(n =5, order_by = gender_inequality_index_2021, with_ties = TRUE)|> 
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



#graph
change_gender_dataset|>
  ggplot(aes(x = year, y = gender_inquality_index))+
  geom_line(aes(color = country), size = 1.2)+
  scale_color_brewer(palette = "Set1") +
  theme_minimal() +
  labs(
    title = "Gender Inequality Index Over Time",
    subtitle = "Comparison of Five Countries (1990-2021)",
    x = "Year",
    y = "Gender Inequality Index",
    color = "Country"
  ) +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(face = "italic", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text.x = element_text(size = 12, hjust = 1),
    axis.text.y = element_text(size = 12),
    legend.title = element_text(face = "bold")
  )