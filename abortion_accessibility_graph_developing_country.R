#Join the map with violence_tidy data by ISO codes
map_data_2 <- world_map|>
  left_join(violence_tidy, join_by("iso_n3" == "iso"))

# Graph Africa
map_data_2|>
  filter(subregion.x %in%  c("Eastern Africa", "Western Africa", 
                             "Southern Africa", "Middle Africa"))|>
  ggplot()+
  geom_sf(aes(fill = abortion_access), color = "black", size = 0.1) +
  scale_fill_viridis_d(option = "plasma", na.value = "grey80") +
  theme_minimal() +
  labs(
    title = "Abortion Access in developing countries",
    subtitle = "Region: Sub-Saharan Africa",
    fill = "Access Level"
  ) +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text.x = element_text(size = 12, angle = 45, hjust = 1),
    axis.text.y = element_text(size = 12)
  )
# Graph "Western Asia and Northern Africa"
map_data_2|>
  filter(subregion.x %in%  c("Western Asia", "Northern Africa"))|>
  ggplot()+
  geom_sf(aes(fill = abortion_access), color = "black", size = 0.1) +
  scale_fill_viridis_d(option = "plasma", na.value = "grey80") +
  theme_minimal() +
  labs(
    title = "Abortion Access in developing countries",
    subtitle = "Region: Western Asia and Northern Africa",
    fill = "Access Level"
  ) +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text.x = element_text(size = 12, angle = 45, hjust = 1),
    axis.text.y = element_text(size = 12)
  )

# Graph Eastern and Southeastern Asia
map_data_2|>
  filter(subregion.x %in%  c("South-Eastern Asia", "Southern Asia"))|>
  ggplot()+
  geom_sf(aes(fill = abortion_access), color = "black", size = 0.1) +
  scale_fill_viridis_d(option = "plasma", na.value = "grey80") +
  theme_minimal() +
  labs(
    title = "Abortion Access in developing countries",
    subtitle = "Region: (Eastern and Southeastern Asia",
    fill = "Access Level"
  ) +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text.x = element_text(size = 12, angle = 45, hjust = 1),
    axis.text.y = element_text(size = 12)
  )