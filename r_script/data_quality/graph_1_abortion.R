#| label: fig-abortion-na
#| fig-cap: "Missing Values in Global Abortion Incidence Dataset"

na_table <- abortion|>
  gg_miss_var()+
  labs(
    title = "Missing Values in Global Abortion Incidence Dataset",
    x = "Numbers of missing entry") +
  theme_minimal()+
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text.x = element_text(size = 12, hjust = 1),
    axis.text.y = element_text(size = 12)
  )


ggsave(filename = "abortion_na.png", width = 10, height = 5, 
       units = "in",
       path = "figure_data")