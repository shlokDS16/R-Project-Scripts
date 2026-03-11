# Load the necessary libraries
install.packages("tidyverse")
library(tidyverse)

# --- Starwars Data Analysis and CSV Export ---

# 1. Processing the data
starwars_summary <- starwars %>%
  # Select required columns
  select(name, species, height, mass, homeworld, gender) %>%
  # Filter species with > 2 characters
  add_count(species) %>%
  filter(n > 2) %>%
  # Unit conversion and Categorization
  mutate(
    height_m = height / 100,
    weight_category = case_when(
      mass < 50 ~ "Light",
      mass >= 50 & mass <= 100 ~ "Average",
      mass > 100 ~ "Heavy",
      TRUE ~ "Unknown"
    )
  ) %>%
  # Multi-level Aggregation
  group_by(species, gender) %>%
  summarise(
    avg_height = round(mean(height, na.rm = TRUE), 2),
    .groups = 'drop'
  ) %>%
  # Sorting for Rank
  arrange(desc(avg_height))

# 2. Extract Top 3
top_3_heights <- head(starwars_summary, 3)

# 3. Save as CSV File
write.csv(top_3_heights, "top_3_species_heights.csv", row.names = FALSE)

# Print result to console
print(top_3_heights)