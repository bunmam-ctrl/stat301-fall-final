#tidy_china_population
china_population <- read_csv("data/raw/china_population_raw.csv")|>
  janitor::clean_names()

china_population_tidy <- china_population|>
  rename(
    "urban_population" = urban_population_ten_thousand_people,
    "rural_population" = rural_population_ten_thousand_people,
    "female_population" = female_population_ten_thousand_people,
    "male_population" = the_male_population_ten_thousand_people,
    "total_population" = at_the_end_of_the_total_population_ten_thousand_people,
    "year" = x1
  )