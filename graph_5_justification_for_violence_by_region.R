# Load packages
library(tidyverse)
library(viridis)
#

#reorder the factor in denscending order 
subregion_totals <- violence_tidy|>
  group_by(subregion)|>
  summarise(total_value = sum(value_agree, na.rm = TRUE))|>
  arrange(desc(total_value))

violence_tidy$subregion <- factor(
  violence_tidy$subregion,
  levels = subregion_totals$subregion
)

#Making graphs
violence_count <- violence_tidy|>
  group_by(justify_violence)|>
  drop_na()|>
  ggplot(aes(x = justify_violence, y = value_agree))+
  geom_col(aes(fill = subregion), position="fill")+
  theme_minimal() +
  scale_fill_brewer(palette = "Dark2")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+ labs(
    title = "Justifications for Violence by Region",
    x = NULL,
    y = "Proportion Agreeing",
    fill = "Subregion"
  ) +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text.x = element_text(size = 12, angle = 45, hjust = 1),
    axis.text.y = element_text(size = 12)
  )



violence_count