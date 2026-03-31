# Step 1: Install and load the ggplot2 package
if (!require("ggplot2")) {
  install.packages("ggplot2")
}
library(ggplot2)

# Step 2: Create a dataframe for the given dataset
plant_data <- data.frame(
  Plant_ID = c(1, 2, 3, 4, 5),
  Growth_Rate = c(3.2, 1.8, 2.6, 0.9, 3.8),
  Condition_Label = c("Sunny", "Shade", "Rainy", "Drought", "Cloudy"),
  stringsAsFactors = FALSE
)

# Step 3 & 4: Create the scatter plot with customizations
growth_plot <- ggplot(data = plant_data, aes(x = Plant_ID, y = Growth_Rate)) +
  # Points displayed in dodgerblue, size 4
  geom_point(color = "dodgerblue", size = 4) +
  # Text labels in darkorange, positioned below points using vjust
  geom_text(aes(label = Condition_Label), color = "darkorange", vjust = 2) +
  # Add appropriate axis labels and title
  labs(
    title = "Scatter Plot of Plant Growth Data",
    x = "Plant ID",
    y = "Growth Rate"
  ) +
  # Optional: A cleaner theme for better presentation
  theme_minimal()

# Display the final plot
print(growth_plot)
