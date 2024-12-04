#| label: fig-5-china-mean-divorce
#| fig-cap: "Comparison of urban and rural divorce rate in China from 2009 to 2017"

china_divorce_tidy|>
  pivot_longer(
    cols = `2009`:`2017`,,
    names_to = "year",
    values_to = "divorce_rate"
  )|>
  group_by(year,area_type)|>
  mutate( year = as.integer(year))|>
  summarise(mean_divorce_rate = mean(divorce_rate, na.rm = TRUE))|>
  ggplot(aes(x = year, y = mean_divorce_rate))+
  geom_line(aes(color = area_type), linewidth = 1.2)+
  scale_x_continuous( breaks = seq(2009, 2017, by = 1))+
  scale_color_brewer(palette = "Set2") +
  theme_minimal() +
  labs(
    title = "Mean Divorce Rate by Area Type in China",
    x = "Year",
    y = "Mean Divorce Rates (%)",
    color = "Area type"
  )+
  theme(
    plot.title = element_text(size = 32, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 28),
    axis.text.x = element_text(size = 24, hjust = 1),
    axis.text.y = element_text(size = 24),
    legend.title = element_text(size = 28, face = "bold"),
    legend.text = element_text(size = 24)
  )

ggsave(filename = "china_mean_divorce.png", path = "figure_china")
