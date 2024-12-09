#read raw file 
abortion <- read_csv("data/raw/global_abortion_raw.csv")|>
  janitor::clean_names()

## change iso format and rename some colume
abortion_tidy <- abortion|>
  mutate(iso = str_pad(iso, width = 3, pad = "0"))|>
  select(country,iso, region, subregion,numberofabortions, abortionrate) |>
  rename(
    "number_of_abortion" = "numberofabortions",
    "abortion_rate" = "abortionrate"
  )
