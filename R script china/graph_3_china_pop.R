#| label: fig-3-china-pop
#| fig-cap: "Change of population in China from 1950 to 2021"

#data prep rural vs urban
china_population_total <- china_population_tidy|> 
  select(year, urban_population, rural_population)|>
  mutate(total_population = urban_population + rural_population, .by = year)

#graph
china_population_total|>
  ggplot(aes(x = year, y = total_population))+
  geom_line(color = "darkcyan", linewidth = 1.2)+
  scale_color_brewer(palette = "Set1") +
  theme_minimal() +
  scale_x_continuous( breaks = seq(1950, 2021, by = 10))+
  labs(
    title = "Chinese of Population Over Time",
    x = "Year",
    y = "Number of people"
  )+
  theme(
    plot.title = element_text(size = 32, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 28),
    axis.text.x = element_text(size = 24, hjust = 1),
    axis.text.y = element_text(size = 24),
    legend.title = element_text(size = 28, face = "bold"),
    legend.text = element_text(size = 24)
  )


#save
ggsave(filename = "china_pop.png", path = "figure_china")

