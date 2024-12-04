#| label: fig-abortion-na
#| fig-cap: "Missing Values in Global Abortion Incidence Dataset"

na_table_1 <- abortion|>
  gg_miss_var()+
  labs(
    title = "Missing Values in Global Abortion Incidence Dataset",
    x = "Numbers of missing entry") +
  theme_minimal()


ggsave(filename = "abortion_na.png", path = "figure_data")