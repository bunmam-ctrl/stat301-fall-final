# label: fig-5-domes-opinion
#fig-cap: Bar graph based on the survey  from 2020 highlighting support for different justifications of domestic violence in developing countries"
#Making graphs
violence_tidy|>
  group_by(justify_violence)|>
  summarise(total_value_agree = sum(value_agree, na.rm = TRUE))|>
  ungroup()|>
  mutate(
    prop = total_value_agree/ sum(total_value_agree)
  )|>
  ggplot(aes(x = justify_violence, y = prop))+
  geom_col(fill = "darkcyan")+
  theme_minimal() +
  scale_fill_brewer(palette = "Dark2") +
  theme_minimal() +
  scale_x_discrete(labels = c("With\nReason", "Parental\nNeglect", "Autonomy\nViolation", 
                              "Marital\nConflict", "Intimacy\nDenial", "Household\nMistake"))+
  labs(
    title = "Public Opinions on Justifications for Domestic Violence in Developing Countries",
    x = NULL,
    y = "Proportion of Respondents"
  )+
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text.x = element_text(size = 12, hjust = 1),
    axis.text.y = element_text(size = 12)
  )

ggsave(filename = "domestic_opinion.png", 
       path = "figure_africa_asia")

