#| label: fig-6-afri-domes-opinion
#| fig-cap: "Bar graph based on the survey  from 2020 highlighting support for different justifications of domestic violence in developing countries"
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
  scale_x_discrete(labels = c("With \n Reason", "Parental \n Neglect", 
                              "Autonomy \n Violation", 
                              "Marital \n Conflict", "Intimacy \n Denial", "   Household \n Mistake"))+
  labs(
    title = "Public Opinions on Justifications \nfor Domestic Violence in Developing Countries",
    x = NULL,
    y = "Proportion of Respondents"
  )+
  theme(
    plot.title = element_text(size = 32, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 25),
    axis.text.x = element_text(size = 22, hjust = 0.5),
    axis.text.y = element_text(size = 22)
  )


ggsave(filename = "domestic_opinion.png", 
       path = "figure_africa_asia")

