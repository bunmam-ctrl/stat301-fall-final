#read raw file
gender_inequality <-  read_csv("data/raw/gender_inequality_raw.csv")|>
  janitor::clean_names()


## rename subregion to be clear
gender_inequality_tidy <-  gender_inequality|>
  mutate(undp_developing_regions = 
           case_when(
             undp_developing_regions %in% "SSA" ~ "Sub-Saharan Africa",
             undp_developing_regions %in% "LAC" ~ "Latin America and the Caribbean",
             undp_developing_regions %in% "EAP" ~ "East Asia and the Pacific",
             undp_developing_regions %in% "AS" ~ "Arab States",
             undp_developing_regions %in% "ECA" ~ "Europe and Central Asia",
             undp_developing_regions %in% "SA" ~ "South Asia"
           )
  )


