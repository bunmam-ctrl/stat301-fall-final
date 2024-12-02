# label: fig-4-china-mean-marriage
# fig-cap: "Mean Marriage Rate by Area Type in China from 2009 to 2017"

china_marriage_tidy|>
  pivot_longer(
    cols = `2009`:`2017`,,
    names_to = "year",
    values_to = "marriage_rate"
  )|>
  group_by(year,area_type)|>
  mutate( year = as.integer(year))|>
  summarise(mean_marriage_rate = mean(marriage_rate, na.rm = TRUE))|>
  ggplot(aes(x = year, y = mean_marriage_rate))+
  geom_line(aes(color = area_type), linewidth = 1.2)+
  scale_x_continuous( breaks = seq(2009, 2017, by = 1))+
  scale_y_continuous( breaks = seq( 30, 50, by = 2
  ))+
  scale_color_brewer(palette = "Set2") +
  theme_minimal() +
  labs(
    title = "Mean Marriage Rate by Area Type in China",
    subtitle  = "Comparison of Urban and Rural Marriage Trends Over 2009-2017",
    x = "Year",
    y = "Mean Marriage Rates",
    color = "Area type"
  )+
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(face = "italic", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text.x = element_text(size = 12, hjust = 1),
    axis.text.y = element_text(size = 12),
    legend.title = element_text(face = "bold")
  )

ggsave(filename = "china_mean_marriage.png", path = "figure_china")