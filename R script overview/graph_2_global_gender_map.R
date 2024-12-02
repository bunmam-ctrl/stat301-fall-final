# Join the map with gender_equality data by ISO codes
map_gender <- world_map|>
  left_join(gender_inequality_tidy, join_by("iso_a3" == "iso3"))

#Graph
global_gender <- ggplot(map_gender) +
  geom_sf(aes(fill = gender_inequality_index_2018), color = "black", size = 10.0) +
  scale_fill_viridis_c( na.value = "grey80") +
  theme_minimal() +
  labs(
    title = "Global Gender Equality Index by Country in 2018",
    subtitle = "A geographical representation of gender equality,\n measuring disparities in various social, economic, and political areas.",
    fill = "Gender Index"
  )+
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(face = "italic", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text.x = element_text(size = 12, angle = 45, hjust = 1),
    axis.text.y = element_text(size = 12),
    legend.title = element_text(face = "bold")
  )

ggsave(filename = "global_gender.png",plot = global_gender, path = "figure_overview")

# label:  fig-2-global-gender
# fig-cap: "Global Number of Abortions by Country"
