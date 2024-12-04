#| label: fig-2-china-gender-pop
#| fig-cap: "Comparison of male and female population ratios in China from 1950 to 2021"

#data prep gender
china_population_gender <- china_population_tidy|> 
  mutate(
    prop_female = female_population/ total_population,
    prop_male = male_population/ total_population,
    .by = year
  )|>
  select(year, prop_female, prop_male)|>
  pivot_longer(
    cols = c(prop_female, prop_male),
    names_to = c(".value", "gender"),
    names_sep = "_",
    values_to = "prop"
  )


#graph
china_population_gender|>
  ggplot(aes(x = year, y = prop))+
  geom_line(aes(color = gender), linewidth = 1.2)+
  scale_x_continuous( breaks = seq(1950, 2021, by = 10))+
  scale_color_brewer(palette = "Set1") +
  theme_minimal() +
  labs(
    title = "Gender Proportion Trends in China",
    x = "Year",
    y = "Proportion",
    color = "Gender"
  )+
  theme(
    plot.title = element_text(size = 32, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 28),
    axis.text.x = element_text(size = 24, hjust = 1),
    axis.text.y = element_text(size = 24),
    legend.title = element_text(size = 28, face = "bold"),
    legend.text = element_text(size = 24)
  )

ggsave(filename = "china_gender_pop.png", path = "figure_china")