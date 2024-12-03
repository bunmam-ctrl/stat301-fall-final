#divorce
china_divorce <- read_csv("data/raw/china_divorce_raw.csv")

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
      area  %in% urban ~ "urban"))