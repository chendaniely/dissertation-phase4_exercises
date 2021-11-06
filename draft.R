
library(tidyverse)
library(medicaldata)
library(janitor)

# pre-workshop -----

# Copy the below code into your R session and try to write the code to accomplish each task. Paste your final solution for all the questions below. You can choose to keep or remove the comments.

# 1. Load the `tidyverse` and `readxl` libraries.
library(tidyverse)
library(readxl)

# 2. Read in the Excel file located in: "data/medicaldata_tumorgrowth.xlsx" into a variable `tumor`.
tumor <- read_excel("data/medicaldata_tumorgrowth.xlsx")

# 3. Select the all the columns except `Grp`, and filter the rows such that Day is `0` or `20`. Save this data subset into a variable `tumor_subset`.

tumor_subset <- tumor %>%
  select(-Grp) %>%
  filter(Day == 0 | Day == 20)

# 4. We want to compare baseline tumor sizes (Day == 0) with tumor sizes at Day == 20 between each of the groups. Using `tumor_subset`, calculate the average tumor `Size` for each `Grp` and `Day`.

tumor_subset %>%
  group_by(Group, Day) %>%
  summarize(mean(Size))


# 5. Save `tumor_subset` into a CSV file located in "data/tumorsubset.csv".




# Exercises -----

ebola <- read_csv("https://raw.githubusercontent.com/cmrivers/ebola/master/country_timeseries.csv")

ebola_baseline_tidy <- ebola %>%
  rename(date = Date, day = Day) %>%
  pivot_longer(cols = c(-date, -day)) %>%
  separate(name, into = c("case_death", "country"), sep = "_") %>%
  pivot_wider(names_from = case_death, values_from = value) %>%
  rename(cases = Cases, deaths = Deaths)

# Column headers are values, not variable names -----

ebola_tidy_1 <- ebola_baseline_tidy %>%
  drop_na() %>%
  select(-deaths) %>%
  pivot_wider(names_from = day, values_from = cases)


## solution
solution_tidy1 <- ebola_tidy_1 %>%
  pivot_longer(`289`:last_col(), names_to = "day", values_to = "cases") %>%
  drop_na()

# Multiple variables stored in one column

ebola_tidy_2 <- ebola %>%
  rename(date = Date, day = Day)

## solution

ebola_tidy_2 %>%
  pivot_longer(cols = c(-date, -day)) %>%
  separate(name, into = c("case_death", "country"), sep = "_") %>%
  drop_na()

# Variables are stored in both rows and columns

ebola_tidy_3 <- ebola_tidy_2

## solution

ebola_tidy_3 %>%
  pivot_longer(cols = c(-date, -day)) %>%
  separate(name, into = c("case_death", "country"), sep = "_") %>%
  pivot_wider(names_from = case_death, values_from = value) %>%
  drop_na()


# summative assessment -----

dirty <- cmv %>%
  select(ID, age, prior.radiation, aKIRs, cmv, donor.cmv, recipient.cmv) %>%
  mutate(recipient.cmv = recode(recipient.cmv,
                                `0` = "recipient_negative",
                                `1` = "recipient_positive")) %>%
  pivot_wider(names_from = donor.cmv,
              values_from = recipient.cmv) %>%
  rename(donor_negative = `0`,
         donor_positive = `1`)

clean <- dirty %>%
  pivot_longer(cols = c(donor_negative, donor_positive),
               names_to = "donor_status",
               values_to = "recipient_status",
               values_drop_na = TRUE)

library(writexl)

writexl::write_xlsx(dirty, "data/cmv.xlsx")

## solution
# load the data into R

cmv <- dirty

cmv %>%
  filter(age > 65)

write_csv()

cmv_tidy <- cmv %>%
  pivot_longer(cols = c(donor_negative, donor_positive),
               names_to = "donor_status",
               values_to = "recipient_status",
               values_drop_na = TRUE)

cmv_tidy %>%
  group_by(cmv) %>%
  summarize(avg_age = mean(age))
