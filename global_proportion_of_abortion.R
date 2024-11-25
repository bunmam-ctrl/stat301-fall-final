##Making map
#load pckgs
library(tidyverse)
library(maps)
library(rnaturalearth)
library(rnaturalearthdata)
library(viridis)

# Load world map with ISO codes
world_map <- ne_countries(scale = "medium", returnclass = "sf")

#calc prop of abortion
abortion_prop <- abortion_tidy|>
  count(iso, wt = number_of_abortion)|>
  mutate(iso = as.character(iso))

# Join the map with abortion data by ISO codes
map_data <- world_map|>
  left_join(abortion_prop, join_by("iso_n3" == "iso"))

#Making map global number of abortion map
ggplot(map_data) +
  geom_sf(aes(fill = n), color = "black", size = 10.0) +
  scale_fill_viridis_c(option = "plasma", na.value = "grey80", name = "Number of Cases") +
  theme_minimal() +
  labs(
    title = "Global Number of Abortions by Country",
    fill = "Proportion"
  )
