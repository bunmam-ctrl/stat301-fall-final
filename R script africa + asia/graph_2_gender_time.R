#| label: fig-2-afri--gender-time
#| fig-cap: "Comparison of the change of Gender Inequality Index (GII) from 1990 to 2021 of 5 countries with the highest GII in 2021"

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
  geom_line(aes(color = country), linewidth = 1.2)+
  scale_x_continuous( breaks = seq(1990, 2021, by = 5))+
  scale_color_brewer(palette = "Set1") +
  theme_minimal() +
  labs(
    title = "Gender Inequality Index Over Time",
    x = "Year",
    y = "Gender Inequality Index",
    color = "Country"
  ) +
  theme(
    plot.title = element_text(size = 32, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 28),
    axis.text.x = element_text(size = 24, hjust = 1),
    axis.text.y = element_text(size = 24),
    legend.title = element_text(size = 28, face = "bold"),
    legend.text = element_text(size = 24)
  )

ggsave(filename = "gender_time.png", path = "figure_africa_asia")