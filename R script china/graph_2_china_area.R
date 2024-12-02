#data prep rural vs urban
china_population_area <- china_population_tidy|> 
  mutate(
    prop_urban = urban_population/ total_population,
    prop_rural = rural_population/ total_population,
    .by = year
  )|>
  select(year, prop_urban, prop_rural)|>
  pivot_longer(
    cols = c(prop_urban, prop_rural),
    names_to = c(".value", "area"),
    names_sep = "_",
    values_to = "prop"
  )

#graph
china_population_area|>
  ggplot(aes(x = year, y = prop))+
  geom_line(aes(color = area), linewidth = 1.2)+
  scale_color_brewer(palette = "Set1") +
  theme_minimal() +
  scale_x_continuous( breaks = seq(1950, 2021, by = 10))+
  labs(
    title = "Population Distribution Changes in China",
    subtitle  = "Comparison of Urban and Rural Population Trends Over 1950-2021",
    x = "Year",
    y = "Proportion",
    color = "Area type"
  )+
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(face = "italic", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text.x = element_text(size = 12, hjust = 1),
    axis.text.y = element_text(size = 12),
    legend.title = element_text(face = "bold")
  )


ggsave(filename = "china_area_pop.png", path = "figure_china")

# label: fig-2-china-area-pop
# fig-cap: "Population Distribution Changes in China from 1950 to 2021"
