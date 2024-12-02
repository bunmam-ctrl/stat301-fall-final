# label: fig-5-domes-opinion
#fig-cap: "Regional Views on Domestic Violence Tolerance"
#Making graphs
violence_tidy|>
  group_by( justify_violence)|>
  drop_na()|>
  ggplot(aes(x = justify_violence, y = value_agree, fill = subregion))+
  geom_col()+
  theme_minimal() +
  scale_fill_brewer(palette = "Set2")+
  scale_x_discrete(labels = c("With\nReason", "Parental\nNeglect", "Autonomy\nViolation", 
                              "Marital\nConflict", "Intimacy\nDenial", "Household\nMistake"))+
  labs(
    title = "Regional Views on Domestic Violence Tolerance",
    subtitle = "Comparison of public opinion on different causes of domestic violence \n across developing countries in 2020",
    x = NULL,
    y = "Number of People Supporting",
    fill = "Subregion"
  )+
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(face = "italic", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text.x = element_text(size = 12, angle = 45, hjust = 1),
    axis.text.y = element_text(size = 12),
    legend.title = element_text(face = "bold")
  )
ggsave(filename = "domestic_opinion.png", 
       path = "figure_africa_asia")
