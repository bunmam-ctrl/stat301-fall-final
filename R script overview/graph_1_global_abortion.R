#| label: fig-1-global-num
#| fig-cap: "A geographical representation of abortion cases reported by country, highlighting variations and trends over 28 years"

# Load world map with ISO codes
world_map <- ne_countries(scale = "medium", returnclass = "sf")

##Making map
#calc count of abortion
abortion_n <- abortion_tidy|>
  count(iso, wt = number_of_abortion)|>
  mutate(iso = as.character(iso))

# Join the map with abortion_tidy data by ISO codes
map_abortion<- world_map|>
  left_join(abortion_n, join_by("iso_n3" == "iso"))

#Graph

ggplot(map_abortion) +
  geom_sf(aes(fill = n), color = "black", size = 10.0) +
  scale_fill_viridis_c( na.value = "grey80") +
  theme_minimal() +
  labs(
    title = "Global Abortion Incidence from 1990 to 2018",
    fill = "Number of Cases"
  )+
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text.x = element_text(size = 12, hjust = 1),
    axis.text.y = element_text(size = 12),
    legend.title = element_text(face = "bold")
  )

ggsave(filename = "global_abortion.png", width = 10, height = 5, 
       units = "in", path = "figure_overview")

