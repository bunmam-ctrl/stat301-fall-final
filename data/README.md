### Datasets

#### Repo organization

- `raw`: Folder contains all the raw dadta
- `codebook`: Folder contains all the available codebook of the data

#### Dataset 1

Global Abortion Incidence Dataset is accessed in [osf](https://osf.io/6t4eh). The Global Abortion Incidence Dataset is a comprehensive dataset of abortion data from 1990 to 2018, which provides the first global compilation of national level abortion data and information on data sources and quality. This data is used in the Guttmacher Institute model that produces global, regional, subregional, and national estimates of abortion and unintended pregnancy.

- `global_abortion_raw.csv`
- `global_abortion_codebook.xlsx`
- `global_abortion_tidy.rds`

Summary of Global Abortion Incidence structure

- `country`: Name of the country or territory  
- `iso`: ISO-assigned unique code for each country, territory, or area  
- `yearstart`: Data start year  
- `yearend`: Data end year  
- `region`: SDG regional groupings  
- `subregion`: SDG subregional groupings  
- `numberofabortions`: Number of induced abortions recorded in the country and year  
- `abortionrate`: Abortions per 1,000 women of reproductive age in the country and year  
- `percp_p_ending_in_a`: Percentage of pregnancies ending in induced abortion in the country and year  
- `spontaneous`: Includes spontaneous abortion in total abortion count (yes/no)  
- `datatype`: Official abortion counts, possibly from governmental sources  
- `datasource`: Source of the data  
- `complete`: Indicates data completeness in model-based estimates (Bearak et al., 2020)  
- `classification`: Reason for data incompleteness in model-based estimates (Bearak et al., 2020)  
- `modelused`: Specifies if data was included in model-based estimates (Bearak et al., 2020)  
- `marriedonly`: Marital status of the women surveyed/studied  
- `notes`: Notes on data completeness or sources

### Dataset 2

Gender Inequality Index Dataset is accessed in [kaggle](https://www.kaggle.com/datasets/iamsouravbanerjee/gender-inequality-index-dataset) and created from [Human Development Reports](https://hdr.undp.org). This dataset provides comprehensive historical data on gender development indicators at a global level.

- `gender_inequality_index_raw.csv`
- `gender_inequality_tidy.rds`

Summary of Gender Inequality Index structure

- `iso3`: ISO3 code for the country/territory  
- `country`: Name of the country/territory  
- `continent`: Continent name  
- `hemisphere`: Hemisphere name  
- `human_development_groups`: Human Development Groups classification  
- `undp_developing_regions`: UNDP Developing Regions classification  
- `hdi_rank_2021`: 2021 Human Development Index rank  
- `gii_rank_2021`: 2021 Gender Inequality Index rank  
- `gender_inequality_index_` (e.g., `gender_inequality_index_1990` to `gender_inequality_index_2021`): Gender Inequality Index values from 1990 to 2021


#### Dataset 3
Violence Against Women and Girls Dataset is accessed in [kaggle](https://www.kaggle.com/datasets/andrewmvd/violence-against-women-and-girls). This dataset aggregates agreement with key questions across gender, education level and many other socioeconomic variables from 70 different countries.
The data was collected as part of the [Demographic and Health Surveys (DHS) program](https://dhsprogram.com/What-We-Do/Survey-Types/DHS.cfm), which exists to advance the global understanding of health and population trends in developing countries.


- `violence_raw.csv`
- `violence_tidy.rds`
- `violence_codebook.csv`

Summary of Violence Against Women and Girls structure

- `record_id`: Unique numeric identifier for each question by country  
- `country`: Country where the survey was conducted  
- `gender`: Gender of respondents (`F`/`M`)  
- `demographics_question`: Type of demographic grouping used for segmentation  
- `question`: Statement about domestic violence respondents were asked to agree with  
- `survey_year`: Year of the Demographic and Health Survey (DHS)  
- `value`: Percentage of respondents agreeing with the statement in `question`


#### Dataset 4
Gender Social Factors Dataset is accessed in [kaggle](https://www.kaggle.com/datasets/gianinamariapetrascu/gender-inequality-index/data).

- `gender_social_factor_raw.csv`
- `gender_social_factor_filter.rds`

Summary of Gender Social Factors structure

- `country`: Name of the country  
- `human_development`: Human development category (Low to Very High)  
- `gii`: Gender Inequality Index  
- `rank`: GII rank of the country  
- `maternal_mortality`: Maternal mortality ratio (deaths per 100,000 live births)  
- `adolescent_birth_rate`: Adolescent birth rate (births per 1,000 women aged 15–19)  
- `seats_parliament`: Women's share of seats in parliament (%)  
- `f_secondary_educ`: Females with at least some secondary education (% aged 25 and older)  
- `m_secondary_educ`: Males with at least some secondary education (% aged 25 and older)  
- `f_labour_force`: Female labor force participation rate (% aged 15 and older)  
- `m_labour_force`: Male labor force participation rate (% aged 15 and older)  


#### Dataset 5
China Marriage and Divorce Dataset is accessed in [kaggle](https://www.kaggle.com/datasets/tduan007/china-marriage-and-divorce-data/data) and collected from [National Bureau of Statistics of China](https://data.stats.gov.cn/easyquery.htm?cn=E0103)

- `china_marriage_raw.csv`
- `china_divorce_raw.csv`
- `china_marriage_tidy.rds`
- `china_divorce_tidy.rds`

Summary of China Marriage and Divorce structure

- `area`: Province or city in China  
- `2017` to `2009`: Marriage and divorce rates for each year from 2009 to 2017  

