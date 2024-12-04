#| label: fig-social-factor-na
#| fig-cap: "Missing Values in Gender Inequality Index Dataset"

na_table_2 <- gender_social_factor|>
  gg_miss_var()+
  labs(
    title = "Missing Values in Gender Inequality Index Dataset",
    x = "Numbers of missing entry") +
  theme_minimal()


ggsave(filename = "social_factor_na.png", path = "figure_data")