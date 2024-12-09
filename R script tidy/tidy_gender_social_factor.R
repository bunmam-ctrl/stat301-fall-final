#read file
gender_social_factor <-read_csv("data/raw/gender_social_factor_raw.csv")|>
  janitor::clean_names()

#filter with country in regions via violence
violence_tidy_filter <- violence_tidy|>
  filter(subregion %in% c("Central and Southern Asia", "Sub-Saharan Africa",
                          "Western Asia and Northern Africa", "Eastern and Southeastern Asia"))

# filter by join
gender_social_factor_filter <- gender_social_factor|>
  semi_join(violence_tidy_filter, join_by(country))
