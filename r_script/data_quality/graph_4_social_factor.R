#| label: fig-social-factor-na
#| fig-cap: "Missing Values in Gender Inequality Index Dataset"

na_table_2 <- gender_social_factor|>
  gg_miss_var()+
  labs(
    title = "Missing Values in Gender Inequality Index Dataset",
    x = "Numbers of missing entry") +
  theme_minimal()+
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text.x = element_text(size = 12, hjust = 1),
    axis.text.y = element_text(size = 12)
  )





ggsave(filename = "social_factor_na.png",  width = 10, height = 4, 
       path = "figure_data")