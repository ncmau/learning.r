# load packages from the "package-loading.R" script
source(here::here("R/package-loading.R"))

glimpse(NHANES)

NHANES <- NHANES
view(NHANES)

usethis::use_r("exercises-wrangling")

# pipe operators chain functions together
# preferred as increases ease of reading
# contents of brackets put before the pipe operator
NHANES %>% colnames()

glimpse(head(NHANES))
NHANES %>%
  head %>%
  glimpse()

# mutate() function -------------------------------------------------------
NHANES_changed <- NHANES %>%
  mutate(Height_meters = Height/100)

# create a new variable based on a condition
NHANES_changed <- NHANES_changed %>%
  mutate(HighlyActive = if_else(PhysActiveDays >=5, "yes", "no"))

# change multiple variables using ","
NHANES_changed <- NHANES_changed %>%
  mutate(new_column = "only one variable",
         Height = Height/100,
         UrineVolAverage = (UrineVol1 + UrineVol2)/2
  )


# select(): select specific data or columns -------------------------------
# select columns/variables by name, without quotes
select(NHANES, Age, Gender, BMI)

NHANES_characteristics <- NHANES %>%
  select(Age, Gender, BMI)

# deselect a specific variable, use minus (-)
NHANES %>%
  select(-HeadCirc)

# to select similar names, use "matching" functions
NHANES %>%
  select(starts_with("BP"), contains("vol"))

select(NHANES, Age, Gender, BMI)



# rename(): rename specific variables -------------------------------------

# rename using the form: "newname = oldname"
NHANES %>%
  rename(Number_Babies = nBabies,
         Sex = Gender)



# filter(): filtering/subsetting the data by row --------------------------
NHANES %>%
  filter(Gender == "female")

NHANES %>%
  filter(Gender != "female")

NHANES %>%
  filter(BMI == 25)

NHANES %>%
  filter(BMI >= 25)

NHANES %>%
  filter(BMI == 25 & Gender == "female")

NHANES %>%
  filter(BMI == 25 | Gender == "female")


# arrange(): sort/rearrange your data by columns --------------------------
# ascending order (select limts dataset to age for checking)
NHANES %>%
  arrange(Age) %>%
  select(Age)

# descending order
NHANES %>%
  arrange(desc(Age)) %>%
  select(Age)

# order by age and gender
NHANES %>%
  arrange(Age, Gender) %>%
  select(Age, Gender)



# group_by(), summarise(): create a summary of the data -------------------

# summarize by itself
NHANES %>%
  summarise(MaxAge = max(Age, na.rm = TRUE),
            MeanBMI = mean(BMI, na.rm = TRUE))


# combine with group_by()
NHANES %>%
  group_by(Gender) %>%
  summarise(MaxAge = max(Age, na.rm = TRUE),
            MeanBMI = mean(BMI, na.rm = TRUE))


NHANES %>%
  group_by(Gender, Diabetes)  %>%
  summarise(MaxAge = max(Age, na.rm = TRUE),
            MeanBMI = mean(BMI, na.rm = TRUE),
            sdBMI = sd(BMI, na.rm= TRUE))

# gather(): converting from wide to long form -----------------------------
#gathers up variables
#key is the variable that is repeated
table4b

table4b %>%
  gather(key = year, value = population, -country)

table4b %>%
  gather(key = year, value = population, '1999', '2000')

# keep only variables of interest
NHANES_char <- NHANES %>%
  select(SurveyYr, Gender, Age, Weight, Height, BMI, BPSysAve)
NHANES_char

#convert to long form, excluding year and gender
#create new variables to gather up measurements and values
NHANES_long <- NHANES_char %>%
  gather(Measure, Value, -SurveyYr, -Gender)
NHANES_long

# calculate mean on each measure, by gender and year
NHANES_long %>%
  group_by(SurveyYr, Gender, Measure) %>%
  summarise(MeanValues = mean(Value, na.rm = TRUE))


# spread(): convert long to wide ------------------------------------------
table2

table2 %>%
  spread(key = type, value = count)
