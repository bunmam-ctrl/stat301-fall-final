#read raw file
china_marriage <- read_csv("data/raw/china_marriage_raw.csv")

#categorize region
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
