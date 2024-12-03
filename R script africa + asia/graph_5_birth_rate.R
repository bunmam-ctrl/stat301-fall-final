# label: fig-5-afri-birth-rate
# fig-cap: "Analysis of birth rates per 1,000 women ages 15-19 across developing regions in Africa, Western, Central, South, and Southeastern Asia.
gender_social_factor_filter|>
  ggplot(aes(x = adolescent_birth_rate))+
  geom_histogram(binwidth = 5, fill = "steelblue", color = "black")+
  theme_minimal()+  
  labs(
    title = "Distribution of Adolescent Birth Rates in Developing Regions",
    x = "Births Rate",
    y = "Frequency"
  ) +
  scale_y_continuous(breaks = seq(0,10, by = 1))+
  scale_x_continuous(breaks = seq(0, 180, by = 25), limits = c(0,180))+
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text.x = element_text(size = 12, hjust = 1),
    axis.text.y = element_text(size = 12),
  )

ggsave(filename = "birth_rate.png", path = "figure_africa_asia")