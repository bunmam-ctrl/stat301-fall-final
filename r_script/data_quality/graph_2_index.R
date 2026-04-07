#| label: fig-index-na
#| fig-cap: "Missing values in Gender Inequality Index Dataset"

na_table <- gender_inequality|>
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



ggsave(filename = "index_na.png",
       width = 10, height = 10, 
       units = "in", path = "figure_data")