#load pcks
library(tidyverse)

#load dataset 
abortion <- read_csv("data/global_abortion_raw.csv")|>
  janitor::clean_names()

violence <-  read_csv("data/violence_raw.csv")|>
  janitor::clean_names()

#tidy violence dataset
## Add ISO 
violence_distinct <- violence|>
  distinct(country)
violence_distinct

violence_iso <- violence|>
  mutate( iso = case_when(
    country %in% "Afghanistan" ~ "4", country %in% "Albania" ~ "8",
    country %in% "Angola" ~ "24", country %in% "Armenia" ~ "51",
    country %in% "Azerbaijan" ~ "31", country %in% "Bangladesh" ~ "50",
    country %in% "Benin" ~ "204", country %in% "Bolivia" ~ "68",
    country %in% "Burkina Faso" ~ "854", country %in% "Burundi" ~ "108",
    
    country %in% "Cambodia" ~ "116", country %in% "Cameroon" ~ "120",
    country %in% "Chad" ~ "148", country %in% "Colombia" ~ "170",
    country %in% "Comoros" ~ "174", country %in% "Congo" ~ "178",
    country %in% "Congo Democratic Republic" ~ "180", country %in% "Cote d'Ivoire" ~ "384",
    country %in% "Dominican Republic" ~ "214", country %in% "Egypt" ~ "818",
    
    country %in% "Eritrea" ~ "232", country %in% "Eswatini" ~ "748",
    country %in% "Ethiopia" ~ "231", country %in% "Gabon" ~ "266",
    country %in% "Gambia" ~ "270", country %in% "Ghana" ~ "288",
    country %in% "Guatemala" ~ "320", country %in% "Guinea" ~ "324",
    country %in% "Guyana" ~ "328", country %in% "Guyana" ~ "332",
    
    country %in% "Honduras" ~ "340", country %in% "India" ~ "356",
    country %in% "Indonesia" ~ "360", country %in% "Jordan" ~ "400",
    country %in% "Kenya" ~ "404", country %in% "Kyrgyz Republic" ~ "417",
    country %in% "Lesotho" ~ "426", country %in% "Liberia" ~ "430",
    country %in% "Madagascar" ~ "450", country %in% "Malawi" ~ "454",
    
    country %in% "Maldives" ~ "462", country %in% "Mali" ~ "466",
    country %in% "Moldova" ~ "498", country %in% "Morocco" ~ "504",
    country %in% "Mozambique" ~ "508", country %in% "Myanmar" ~ "104",
    country %in% "Namibia" ~ "516", country %in% "Nepal" ~ "524",
    country %in% "Nicaragua" ~ "558", country %in% "Niger" ~ "562",
    
    country %in% "Nigeria" ~ "566", country %in% "Pakistan" ~ "586",
    country %in% "Peru" ~ "604", country %in% "Philippines" ~ "608",
    country %in% "Rwanda" ~ "646", country %in% "Sao Tome and Principe" ~ "678",
    country %in% "Senegal" ~ "686", country %in% "Sierra Leone" ~ "694",
    country %in% "South Africa" ~ "710", country %in% "Tajikistan" ~ "762",
    
    country %in% "Tanzania" ~ "834", country %in% "Timor-Leste" ~ "626",
    country %in% "Togo" ~ "768", country %in% "Turkey" ~ "792",
    country %in% "Turkmenistan" ~ "795", country %in% "Uganda" ~ "800",
    country %in% "Ukraine" ~ "804", country %in% "Yemen" ~ "887",
    country %in% "Zambia" ~ "894", country %in% "Zimbabwe" ~ "716"
  ),
  .after = country,
  iso = as.numeric(iso)
  )

##Modify justify violence and percent agree
violence_question <- violence|>
  distinct(question)

violence_tidy|>
  mutate(
    justify_violence = as.factor(question),
    justify_violence = fct_recode(justify_violence, 
                                  "Household Mistake" = "... if she burns the food",
                                  "Marital Conflict" = "... if she argues with him",
                                  "Autonomy Violation" = "... if she goes out without telling him",
                                  "Intimacy Denial" = "... if she refuses to have sex with him",
                                  "Parental Neglect" = "... if she neglects the children",
                                  "Reason" = "... for at least one specific reason",
    ),
    .before = value
  )|>
  rename("value_agree" = value)|>
  select(!question)


## add subregion to violence

sub_1 <- c("Afghanistan", "India", "Kyrgyz Republic", "Maldives",
           "Nepal", "Pakistan", "Tajikistan", "Turkmenistan")
sub_2 <-  c("Angola", "Benin", "Burkina Faso", "Burundi" , "Cameroon",
            "Chad", "Comoros", "Congo", "Congo Democratic Republic",
            "Cote d'Ivoire", "Eswatini", "Ethiopia", "Gabon", "Gambia",
            "Ghana", "Guinea", "Kenya", "Lesotho", "Liberia", "Madagascar",
            "Malawi", "Mali", "Mozambique", "Namibia", "Niger", "Nigeria",
            "Rwanda", "Sao Tome and Principe", "Senegal", "Sierra Leone",
            "South Africa", "Tanzania", "Togo", "Uganda", "Zambia",
            "Zimbabwe")
sub_3 <- c("Armenia", "Azerbaijan", "Egypt", "Jordan",
           "Yemen")

sub_4 <- c("Bangladesh", "Cambodia", "Indonesia", "Myanmar",
           "Philippines", "Timor-Leste", "Vietnam")
sub_5 <- c("Bolivia", "Colombia","Dominican Republic", "Guatemala", "Guyana",
           "Honduras", "Nicaragua", "Peru")
sub_6 <- c("Albania", "Moldova", "Ukraine")


violence_tidy|>
  mutate( subregion = case_when(
    country %in% sub_1  ~ "Central and Southern Asia",
    country %in% sub_2 ~ "Sub-Saharan Africa",
    country %in% sub_3 ~ "Western Asia and Northern Africa",
    country %in% sub_4 ~ "Eastern and Southeastern Asia",
    country %in% sub_5  ~ "Latin America",
    country %in% sub_6  ~ "Europe and Northern America"
  ),
  .after = iso,
  subregion = as.factor(subregion)
  )


## Add abortion legality
###add abortion (legal relax, legal strict, illegal)
legal_request <-  c("Albania", "Moldova",
                    "Ukraine", "Bolivia", 
                    "Colombia", "Guyana",
                    "Vietnam"," Cambodia",
                    "Nepal", "Kyrgyz Republic",
                    "South Africa","Mozambique")
legal_reason<- c("Ethiopia", "Ghana", "Zambia",
                 "Rwanda" , "Gabon", "India",
                 "Indonesia", "Philippines", "Timor-Leste",
                 "Peru", "Guatemala", "Honduras", "Nicaragua")

illegal <-  c("Angola", "Burkina Faso", "Benin",
              "Burundi", "Chad", "Comoros", "Congo",
              "Congo Democratic Republic", "Niger",
              "Nigeria", "Sao Tome and Principe",
              "Senegal", "Sierra Leone", "Togo",
              "Uganda", "Zimbabwe",
              "Afghanistan", "Pakistan", "Yemen"
)

violence_tidy <- violence_tidy|>
  mutate( abortion_access = case_when(
    country %in% legal_request  ~ "Legal on Request",
    country %in% legal_reason ~"Legal for Specific Reasons",
    country %in% illegal ~ "Legal for Specific Reasons"
  ),
  abortion_access = as.factor(abortion_access)
  )


##reorder the factor in descending order (justify_violence)
justify_totals <- violence_tidy|>
  group_by(justify_violence)|>
  summarise(total_value = sum(value_agree, na.rm = TRUE))|>
  arrange(desc(total_value))

violence_tidy$justify_violence <- factor(
  violence_tidy$justify_violence,
  levels = justify_totals$justify_violence
)

##reorder the factor in descending order (subregion)
subregion_totals <- violence_tidy|>
  group_by(subregion)|>
  summarise(total_value = sum(value_agree, na.rm = TRUE))|>
  arrange(desc(total_value))

violence_tidy$subregion <- factor(
  violence_tidy$subregion,
  levels = subregion_totals$subregion
)



# Tidy abortion dataset 
abortion_tidy <- abortion|>
  mutate(iso = str_pad(iso, width = 3, pad = "0"))|>
  select(country,iso, region, subregion,numberofabortions, abortionrate) |>
  rename(
    "number_of_abortion" = "numberofabortions",
    "abortion_rate" = "abortionrate"
  )

# join violence + abortion 
abortion_join <- violence_iso|>
  inner_join(abortion, join_by(iso == iso, country == country))

abortion_join

#tidy gender inequality (elaborate undp_developing_regions)
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

