library(tidyr)
library(dplyr)

# Create the messy dataset
messy_students <- data.frame(
  StudentID = c(1, 2, 3, 4),
  Name = c("Alice", "Bob", "Charlie", "Dana"),
  Math_2020 = c(85, 90, NA, 70),
  Math_2021 = c(88, NA, 78, 75),
  Eng_2020 = c(80, 92, 85, NA),
  Eng_2021 = c(82, 95, NA, 77),
  ExtraInfo = c("A-2020-S1", "B-2021-S2", "C-2020-S1", NA),
  stringsAsFactors = FALSE
)

# Apply tidyr cleaning pipeline
tidy_students <- messy_students %>%
  # 1. Gather the subject-year columns into long format
  gather(key = "Subject_Year", value = "Score", Math_2020:Eng_2021) %>%
  
  # 2. Separate Subject and Year
  separate(Subject_Year, into = c("Subject", "Year"), sep = "_") %>%
  
  # 3. Separate ExtraInfo into Grade, InfoYear, and Semester
  separate(ExtraInfo, into = c("Grade", "InfoYear", "Semester"), sep = "-") %>%
  
  # 4. Use fill to handle any missing Semester data (downwards)
  fill(Semester) %>%
  
  # 5. Drop rows where Score is NA to make it analysis-ready
  drop_na(Score) %>%
  
  # 6. Unite Grade and Semester just to demonstrate the function
  unite("Grade_Term", Grade, Semester, sep = "_")

# View final cleaned data
print(tidy_students)