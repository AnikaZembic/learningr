source(here::here("R/package_loading.R"))
# Check column names
colnames(NHANES)

# Look at contents
str(NHANES)
glimpse(NHANES)

# See summary
summary(NHANES)

# Look over the dataset documentation
?NHANES


NHANES %>%
  colnames() %>%
  length()

NHANES %>%
  mutate(Height = Height / 100,
         Testing = "yes",
         HighlyActive = if_else(PhysActiveDays >= 5,
                                "yes",
                                "no"
                                ))

NHANES_updated <- NHANES %>%
  mutate(UrineVolAverage = (UrineVol1 + UrineVol2) / 2)

# Check the names of the variables
colnames(NHANES)

# Pipe the data into mutate function and:
NHANES_modified <- NHANES %>% # dataset
  mutate(
    # 1. Calculate average urine volume
    UrineVolAverage = (UrineVol1 + UrineVol2) / 2,
    # 2. Modify Pulse variable
    PulseBps = Pulse / 60,
    # 3. Create YoungChild variable using a condition
    YoungChild = if_else(Age<6,
                         TRUE,
                         FALSE)
  )
NHANES_modified

glimpse(NHANES_modified)
head(NHANES_modified$UrineVolAverage)
summary(NHANES_modified$UrineVolAverage)

NHANES %>%
  select(Gender, BMI)

NHANES %>%
  select(-BMI)

NHANES %>%
  select(starts_with("smoke"))

NHANES %>%
  select(contains("vol"))

NHANES %>%
  select(matches["123"])

NHANES %>%
  rename(
    NumberBabies = nBabies,
    Sex = Gender,
  )

NHANES %>%
  select(
    BMI, NumberBabies = nBabies, Gender, Height
  )

NHANES %>%
  filter(Gender == "female")

NHANES %>%
  filter(BMI >= 25 & Gender == "female")

NHANES %>%
  arrange(Age) %>%
  select(Age)

NHANES %>%
  arrange(desc(Age)) %>%
  select(Age)

NHANES %>%
  arrange(Age, Gender) %>%
  select(Age, Gender)

# To see values of categorical data
summary(NHANES)

# 1. BMI between 20 and 40 and who have diabetes
NHANES %>%
  # format: variable >= number
  filter( BMI >= 20 & BMI <= 40 & Diabetes == "yes")

# 2. Working or renting, and not diabetes
NHANES %>%
  filter((Work == "Working" | HomeOwn == "Rent") & Diabetes == "No") %>%
  select(Age, Gender, Work, HomeOwn, Diabetes)

# 3. How old is person with most number of children.
NHANES %>%
  arrange(desc(nBabies)) %>%
  select(Age, nBabies)


# Group by and summarise --------------------------------------------------
NHANES %>%
  summarise(MaxAge = max(Age, na.rm = TRUE
                         ))

NHANES %>%
  group_by(Gender) %>%
  summarise(MeanBMI = mean(BMI, na.rm = TRUE
  ))

NHANES %>%
  group_by(Gender, Work) %>%
  summarise(
    MeanBMI = mean(BMI, na.rm = TRUE),
    MeanAge = mean(Age, na.rm = TRUE)
    )


# Conversion in long format -----------------------------------------------

table4b %>%
  gather(year, population, -country)

table4b %>%
  gather(year, population, '1999', '2000')

nhanes_simple <- NHANES %>%
  select(SurveyYr, Gender, Age, Weight, Height, BMI, BPSysAve)

nhanes_simple %>%
  gather(Measure, Value, -SurveyYr, -Gender)

nhanes_long <- nhanes_simple %>%
  gather(Measure, Value, -SurveyYr, -Gender)

nhanes_long %>%
  group_by(SurveyYr, Gender, Measure) %>%
  summarise(MeanValue = mean(Value, na.rm = TRUE))

table2 %>%
  spread(type, count)



