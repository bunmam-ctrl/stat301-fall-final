#| label: fig-4-afri-work
#| fig-cap: "Analysis of labor force participation for female at 15 or older in developing regions of Africa, Western, Central, South, and Southeastern Asia"

# graph
gender_social_factor_filter|>
  ggplot(aes(x = f_labour_force))+
  geom_histogram(binwidth = 5, fill = "darkcyan", color = "black")+
  theme_minimal()+ 
  labs(
    title = "Distribution of Female Labor Force Participation",
    x = "Percent of Female Labor Force (%)",
    y = "Frequency"
  ) +
  scale_y_continuous(breaks = seq(0,10, by = 1))+
  scale_x_continuous(breaks = seq(0, 100, by = 10), limits = c(0,100))+
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text.x = element_text(size = 12, hjust = 1),
    axis.text.y = element_text(size = 12),
  )

# save
ggsave(filename = "work.png", path = "figure_africa_asia")