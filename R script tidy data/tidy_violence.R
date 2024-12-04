#violence
violence <-  read_csv("data/raw/violence_raw.csv")|>
  janitor::clean_names()


#add iso to violence
violence_tidy <- violence|>
  mutate( iso = case_when(
    country %in% "Afghanistan" ~ "004", country %in% "Albania" ~ "008",
    country %in% "Angola" ~ "024", country %in% "Armenia" ~ "051",
    country %in% "Azerbaijan" ~ "031", country %in% "Bangladesh" ~ "050",
    country %in% "Benin" ~ "204", country %in% "Bolivia" ~ "068",
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
  .after = country
  )

# Modify justify violence and percent agree
violence_tidy <- violence_tidy|>
  mutate(
    justify_violence = as.factor(question),
    justify_violence = fct_recode(justify_violence, 
                                  "Household Mistake" = "... if she burns the food",
                                  "Marital Conflict" = "... if she argues with him",
                                  "Autonomy Violation" = "... if she goes out without telling him",
                                  "Intimacy Denial" = "... if she refuses to have sex with him",
                                  "Parental Neglect" = "... if she neglects the children",
                                  "With Reason" = "... for at least one specific reason",
    ),
    .before = value
  )|>
  mutate(
    value = (value/100000) *n()
  )|>
  rename("value_agree" = value)|>
  select(!question)

# add subregion

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
           "Philippines", "Timor-Leste")
sub_5 <- c("Bolivia", "Colombia","Dominican Republic", "Guatemala", "Guyana",
           "Honduras", "Nicaragua", "Peru")
sub_6 <- c("Albania", "Moldova", "Ukraine")


violence_tidy <- violence_tidy|>
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


# add abortion (legal relax, legal strict, illegal)
legal_request <-  c("Albania", "Moldova", "Armenia",
                    "Ukraine", "Bolivia",    "Azerbaijan",
                    "Colombia", "Guyana", "Cambodia",
                    "Nepal", "Kyrgyz Republic",
                    "South Africa","Mozambique", "Tajikistan")


legal_reason<- c("Ethiopia", "Ghana", "Zambia",
                 "Rwanda" , "Gabon", "India", "Namibia",
                 "Indonesia", "Philippines", "Timor-Leste",
                 "Peru", "Guatemala", "Honduras", "Nicaragua", "Turkmenistan",
                 "Kenya", "Guinea", "Liberia", "Bangladesh")

illegal <-  c("Angola", "Burkina Faso", "Benin","Lesotho", "Madagascar",
              "Burundi", "Chad", "Comoros", "Congo", "Egypt",  "Jordan",
              "Congo Democratic Republic", "Niger", "Tanzania",
              "Nigeria", "Sao Tome and Principe", "Gambia",
              "Senegal", "Sierra Leone", "Togo", "Eswatini", "Myanmar",
              "Uganda", "Zimbabwe","Cote d'Ivoire", "Malawi", "Mali",
              "Afghanistan", "Pakistan", "Yemen", "Maldives" , "Cameroon", "Dominican Republic")



violence_tidy <- violence_tidy|>
  mutate( abortion_access = case_when(
    country %in% legal_request  ~ "Legal on Request",
    country %in% legal_reason ~"Legal for Specific Reasons",
    country %in% illegal ~ "Illegal or Extremely Restricted"
  ),
  abortion_access = as.factor(abortion_access)
  )

# reorder the factor in descending order (justify_violence)
justify_totals <- violence_tidy|>
  group_by(justify_violence)|>
  summarise(total_value = sum(value_agree, na.rm = TRUE))|>
  arrange(desc(total_value))

violence_tidy$justify_violence <- factor(
  violence_tidy$justify_violence,
  levels = justify_totals$justify_violence
)

# reorder the factor in descending order (subregion)
subregion_totals <- violence_tidy|>
  group_by(subregion)|>
  summarise(total_value = sum(value_agree, na.rm = TRUE))|>
  arrange(desc(total_value))

violence_tidy$subregion <- factor(
  violence_tidy$subregion,
  levels = subregion_totals$subregion
  )

