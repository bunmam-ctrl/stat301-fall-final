#| label: fig-violence-na
#| fig-cap: "Missing Values in Violence Against Women and Girls Dataset"

na_table <- violence|>
  gg_miss_var()+
  labs(title = " Missing Values in Violence Against Women and Girls Dataset",
       x = "Numbers of missing entry")+
  theme_minimal()+
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text.x = element_text(size = 12, hjust = 1),
    axis.text.y = element_text(size = 12)
  )



ggsave(filename = "violence_na.png", width = 10, height = 3, 
       path = "figure_data")