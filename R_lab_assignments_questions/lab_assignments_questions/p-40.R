# Load tidyr library
library(tidyr)

# --- Task 1: Wide -> Long Transformation ---
wide_df <- data.frame(
  ID = 1:3,
  Year2019 = c(10, 15, 20),
  Year2020 = c(12, 18, 24)
)

long_result <- wide_df %>%
  gather(key = "Year", value = "Value", Year2019, Year2020)

cat("--- Task 1: Long Format Result ---\n")
print(long_result)


# --- Task 2: Long -> Wide Transformation ---
long_df <- data.frame(
  ID = c(1, 1, 2, 2, 3, 3),
  Year = c(2019, 2020, 2019, 2020, 2019, 2020),
  Value = c(10, 12, 15, 18, 20, 24)
)

wide_result <- long_df %>%
  spread(key = Year, value = Value)

cat("\n--- Task 2: Wide Format Result ---\n")
print(wide_result)