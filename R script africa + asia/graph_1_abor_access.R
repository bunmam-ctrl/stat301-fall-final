# Load world map with ISO codes
world_map <- ne_countries(scale = "medium", returnclass = "sf")

# Join the map with violence_tidy data by ISO codes
map_data_2 <- world_map|>
  left_join(violence_tidy, join_by("iso_n3" == "iso"))

# Define a consistent color scale
abortion_color_scale <- scale_fill_manual(
  values = c(
    "Illegal or Extremely Restricted" = "darkblue",
    "Legal for Specific Reasons" = "deeppink3",
    "Legal on Request" = "yellow",
    "NA" = "grey80"
  ),
  name = "Abortion\nAccess",
  labels = c(
    "Illegal or\nExtremely Restricted",
    "Legal for\nSpecific Reasons",
    "Legal on\nRequest",
    "NA"
  )  
)


# Graph Western Asia and Africa
graph_africa <- map_data_2|>
  filter(subregion.x %in%  c("Western Asia", "Northern Africa","Eastern Africa", "Western Africa", 
                             "Southern Africa", "Middle Africa"))|>
  ggplot()+
  geom_sf(aes(fill = abortion_access), color = "black", size = 0.1) +
  abortion_color_scale +
  theme_minimal() +
  labs(
    subtitle = "Western Asia and Africa",
  ) +
  theme(
    plot.subtitle = element_text(size = 25, hjust = 0.5),
    axis.title = element_blank(),
    axis.text = element_blank(),
    legend.position = "none"
  )



# Graph Central, South, and Southeastern Asia
graph_asia <- map_data_2|>
  filter(subregion.x %in%  c("South-Eastern Asia", "Southern Asia",
                             "Central Asia", "Southern Asia"))|>
  ggplot()+
  geom_sf(aes(fill = abortion_access), color = "black", size = 0.1) +
  abortion_color_scale +
  theme_minimal() +
  coord_sf(xlim = c(40, 160), ylim = c(-10, 45)) +
  labs(
    subtitle = "Central, South, and Southeastern Asia"
  ) +
  theme(
    plot.subtitle = element_text(size = 25, hjust = 0.5),
    axis.title = element_blank(),
    axis.text = element_blank(),
    legend.position = "none"
  )


# Graph Latin America
graph_latin_america <-  map_data_2|>
  filter(subregion.x %in%  c("South America", "Central America", "Caribbean"))|>
  ggplot()+
  geom_sf(aes(fill = abortion_access), color = "black", size = 0.1) +
  abortion_color_scale +
  theme_minimal() +
  labs(
    subtitle = "Latin America"
  ) +
  coord_sf(xlim = c(-100, -30), ylim = c(-30, 20)) +
  theme(
    plot.subtitle = element_text(size = 25, hjust = 0.5),
    axis.title = element_blank(),
    axis.text = element_blank(),
    legend.position = "bottom",
    legend.title = element_text(size = 20, face = "bold"),
    legend.text = element_text(size = 15)
  )



# Graph Europe 
graph_europe <-  map_data_2|>
  filter(subregion.x %in%  c("Eastern Europe", "Southern Europe" ))|>
  ggplot()+
  abortion_color_scale +
  geom_sf(aes(fill = abortion_access), color = "black", size = 0.1) +
  coord_sf(xlim = c(10, 40), ylim = c(40, 60))  +
  theme_minimal() +
  labs(
    subtitle = "Europe"
  ) +
  theme(
    plot.subtitle = element_text(size = 20, hjust = 0.5),
    axis.title = element_blank(),
    axis.text = element_blank(),
    legend.position = "none"
  )



#| label: fig-1-afri-abor-access
#| fig-cap: "Abortion Accessibility in Developing Countries"

# Combine the regional maps into a single layout
final_plot <- (graph_africa | graph_asia) / (graph_latin_america | graph_europe) +
  plot_annotation(
    title = "Abortion Accessibility in Developing Countries",
    theme = theme(
      plot.title = element_text(size = 28, face = "bold", hjust = 0.5),
      
    ))

final_plot

ggsave(filename = "abor_access.png", path = "figure_africa_asia")


