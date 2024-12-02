#tidy_china_population
china_population <- read_csv("data/china_population_raw.csv")|>
  janitor::clean_names()

china_population_tidy <- china_population|>
  rename(
    "urban_population" = urban_population_ten_thousand_people,
    "rural_population" = rural_population_ten_thousand_people,
    "female_population" = female_population_ten_thousand_people,
    "male_population" = the_male_population_ten_thousand_people,
    "total_population" = at_the_end_of_the_total_population_ten_thousand_people,
    "year" = x1
  )

#data prep
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
  scale_color_brewer(palette = "Set1") +
  theme_minimal() +
  labs(
    title = "Gender Proportion Trends in China",
    subtitle  = "Analysis of Male and Female Population Ratios Over 1950-2021",
    x = "Year",
    y = "Proportion",
    color = "Gender"
  )+
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(face = "italic", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text.x = element_text(size = 12, hjust = 1),
    axis.text.y = element_text(size = 12),
    legend.title = element_text(face = "bold")
  )



