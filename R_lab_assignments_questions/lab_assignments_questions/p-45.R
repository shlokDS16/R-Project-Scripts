# Load necessary libraries
library(ggplot2)
# hexbin is required for geom_hex()
if (!require("hexbin")) install.packages("hexbin")

# --- Task 1, 5, & 6: Scatter Plot with Color Mapping and Alpha ---
# Significance: Visualizes the individual county-level correlation between education and poverty.
p_scatter <- ggplot(midwest, aes(x = percollege, y = percadultpoverty)) +
  # Map color to state; reduce alpha to 0.4 to see overlapping points
  geom_point(aes(color = state), alpha = 0.4, size = 2) +
  # Add a linear trend line
  geom_smooth(method = "lm", color = "black", se = TRUE) +
  labs(
    title = "Education vs. Adult Poverty in the Midwest",
    subtitle = "Higher college education rates typically correlate with lower poverty",
    x = "Percentage of College Educated",
    y = "Percentage of Adults in Poverty"
  ) +
  theme_minimal()

# Note: For constant red color as requested, you would use:
# geom_point(color = "red", alpha = 0.4) 

# --- Task 2: Bar Chart of Population by State ---
# Significance: Highlights the total urban/rural scale of each state.
p_bar <- ggplot(midwest, aes(x = state, y = poptotal, fill = state)) +
  geom_col() + # geom_col is equivalent to geom_bar(stat="identity")
  scale_y_continuous(labels = scales::comma) +
  labs(title = "Total Population Distribution by State", y = "Total Population") +
  theme_light()

# --- Task 3: Hexagonal Heatmap ---
# Significance: Essential for identifying the "bulk" of the data in high-density areas.
p_hex <- ggplot(midwest, aes(x = percollege, y = percadultpoverty)) +
  geom_hex(bins = 30) +
  scale_fill_continuous(type = "viridis") +
  labs(title = "Density Heatmap: College vs. Poverty") +
  theme_minimal()

# --- Task 4: Shared Aesthetics & Overrides ---
# Significance: Demonstrates coding efficiency by reusing a base plot.
base_plot <- ggplot(midwest, aes(x = percollege, y = percadultpoverty))

# Overriding y to look at child poverty instead of adult poverty
p_override <- base_plot + 
  geom_point(aes(y = percchildbelowpovert, color = state), alpha = 0.5) +
  labs(title = "Overridden Aesthetic: Focusing on Child Poverty", 
       y = "Percentage of Children Below Poverty Line")

# Displaying plots
print(p_scatter)
print(p_bar)
print(p_hex)
print(p_override)