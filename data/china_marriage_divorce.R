## Tidy data

#marriage
china_marriage <- read_csv("data/china_marriage_raw.csv")

rural <- c("Hebei", "Shanxi", "Inner Mongolia", "Jilin", 
           "Heilongjiang", "Anhui", "Jiangxi", "Henan",
           "Hubei", "Hunan", "Guangxi", "Hainan", "Sichuan",
           "Guizhou", "Yunnan", "Tibet", "Shaanxi", "Gansu",
           "Qinghai", "Ningxia", "Xinjiang"
)

urban <-  c("Beijing", "Tianjin", "Shanghai", "Chongqing", "Guangdong",
            "Jiangsu", "Zhejiang", "Fujian", "Shandong", "Liaoning" )
china_marriage_tidy <- china_marriage|>
  mutate(
    area_type = case_when( 
      area %in% rural ~ "rural",
      area  %in% urban ~ "urban")
  )


#divorce
china_divorce <- read_csv("data/china_divorce_raw.csv")

rural <- c("Hebei", "Shanxi", "Inner Mongolia", "Jilin", 
           "Heilongjiang", "Anhui", "Jiangxi", "Henan",
           "Hubei", "Hunan", "Guangxi", "Hainan", "Sichuan",
           "Guizhou", "Yunnan", "Tibet", "Shaanxi", "Gansu",
           "Qinghai", "Ningxia", "Xinjiang"
)

urban <-  c("Beijing", "Tianjin", "Shanghai", "Chongqing", "Guangdong",
            "Jiangsu", "Zhejiang", "Fujian", "Shandong", "Liaoning" )
china_divorce_tidy <- china_divorce|>
  mutate(
    area_type = case_when( 
      area %in% rural ~ "rural",
      area  %in% urban ~ "urban")
  )


## Lingraph 
# divorce 
china_divorce_tidy|>
  pivot_longer(
    cols = `2009`:`2017`,,
    names_to = "year",
    values_to = "divorce_rate"
  )|>
  group_by(year,area_type)|>
  mutate( year = as.integer(year))|>
  summarise(mean_divorce_rate = mean(divorce_rate, na.rm = TRUE))|>
  ggplot(aes(x = year, y = mean_divorce_rate))+
  geom_line(aes(color = area_type), linewidth = 1.2)+
  scale_x_continuous( breaks = seq(2009, 2017, by = 1))+
  scale_color_brewer(palette = "Set2") +
  theme_minimal() +
  labs(
    title = "Mean Divorce Rate by Area Type in China",
    subtitle  = "Comparison of Urban and Rural Divorce Trends Over 2009-2017",
    x = "Year",
    y = "Mean Divorce Rates",
    color = "Area type"
  )+
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(face = "italic", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text.x = element_text(size = 12, hjust = 1),
    axis.text.y = element_text(size = 12),
    legend.title = element_text(face = "bold")
  )

# marriage
china_marriage_tidy|>
  pivot_longer(
    cols = `2009`:`2017`,,
    names_to = "year",
    values_to = "marriage_rate"
  )|>
  group_by(year,area_type)|>
  mutate( year = as.integer(year))|>
  summarise(mean_marriage_rate = mean(marriage_rate, na.rm = TRUE))|>
  ggplot(aes(x = year, y = mean_marriage_rate))+
  geom_line(aes(color = area_type), linewidth = 1.2)+
  scale_x_continuous( breaks = seq(2009, 2017, by = 1))+
  scale_y_continuous( breaks = seq( 30, 50, by = 2
  ))+
  scale_color_brewer(palette = "Set2") +
  theme_minimal() +
  labs(
    title = "Mean Marriage Rate by Area Type in China",
    subtitle  = "Comparison of Urban and Rural Marriage Trends Over 2009-2017",
    x = "Year",
    y = "Mean Marriage Rates",
    color = "Area type"
  )+
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(face = "italic", hjust = 0.5),
    axis.title = element_text(size = 14),
    axis.text.x = element_text(size = 12, hjust = 1),
    axis.text.y = element_text(size = 12),
    legend.title = element_text(face = "bold")
  )

