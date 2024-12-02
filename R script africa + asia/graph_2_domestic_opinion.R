# label: fig-5-domes-opinion
#fig-cap: "Regional Views on Domestic Violence Tolerance"
#Making graphs
violence_tidy|>
  group_by( justify_violence)|>
  drop_na()|>
  ggplot(aes(x = justify_violence, y = value_agree))+
  geom_col(color = "aquamarine4")+
  theme_minimal() +
  scale_x_discrete(labels = c("With\nReason", "Parental\nNeglect", "Autonomy\nViolation", 
                              "Marital\nConflict", "Intimacy\nDenial", "Household\nMistake"))+
  labs(
    title = "Public Opinions on Causes of Domestic Violence in Developing Countries",
    subtitle = "Survey Results from 2020 Highlighting Regional Support \nfor Different Justifications of Domestic Violence",
    x = NULL,
    y = "Number of People Supporting"
  )+
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(face = "italic", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text.x = element_text(size = 12, hjust = 1),
    axis.text.y = element_text(size = 12),
  )
ggsave(filename = "domestic_opinion.png", 
       path = "figure_africa_asia")
