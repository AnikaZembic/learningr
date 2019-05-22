nhanes_wrangled <- NHANES %>%
  mutate(MoreThan5DaysActive = if_else(PhysActiveDays >= 5, TRUE, FALSE)) %>%
  select(SurveyYr, Gender, Age, Poverty, BMI, BPSysAve, BPDiaAve, TotChol,
         DiabetesAge, nBabies, MoreThan5DaysActive, AlcoholDay) %>%
  rename(TotalCholesterol = TotChol, NumberOfBabies = nBabies,
         DrinksOfAlcoholInDay = AlcoholDay, AgeDiabetesDiagnosis = DiabetesAge) %>%
  filter(Age >= 18, Age <= 75)
nhanes_wrangled

nhanes_wrangled %>%
  gather(Measure, Value, -SurveyYr, -Gender) %>%
  group_by(SurveyYr, Gender, Measure) %>%
  summarise(Mean = round(mean(Value, na.rm = TRUE), 2)) %>%
  arrange(Measure, Gender, SurveyYr) %>%
  spread(SurveyYr, Mean)

?NHANES
