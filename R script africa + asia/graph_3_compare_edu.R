# label: fig-3-compare-edu
# fig-cap: "Examining secondary education rates among individuals aged 25 or older in 2021 across developing regions of Africa, Western , Central, South, and Southeastern Asia"
gender_social_factor_filter|>
  select(m_secondary_educ,f_secondary_educ)|>
  pivot_longer(
    cols = everything(),
    names_to = c("gender", ".value"),
    names_sep = "_",
    values_to = "percent"
  )|>
  rename(
    "percent" = secondary
  )|>
  ggplot(aes(x= percent, fill = gender)) +
  geom_density( alpha = 0.5) +  
  theme_minimal()+  
  labs(
    title = "Secondary Education Completion Disparities by Gender",
    x = "Percent of Completing Secondary Education (%)",
    y = "Frequency",
    fill = "Gender"
  ) +
  scale_fill_manual(
    values = c(
      "m" = "#2166AC",
      "f" = "#B2182B"
    ),
    name = "Gender",
    labels = c(
      "Female", "Male"
    )  
  )+
  scale_y_continuous(breaks = seq(0, 0.02, by = 0.005), limits = c(0, 0.02))+
  scale_x_continuous(breaks = seq(0, 100, by = 10))+
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text.x = element_text(size = 12, hjust = 1),
    axis.text.y = element_text(size = 12),
    legend.title = element_text(face = "bold")
  )

ggsave(filename = "compare_edu.png", path = "figure_africa_asia")
