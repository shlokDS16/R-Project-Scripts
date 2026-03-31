# Ensure packages are installed
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("plotly")) install.packages("plotly")

# Load libraries
library(ggplot2)
library(plotly)

# Load the built-in iris dataset
data(iris)

# --- 1. Static Visualization using ggplot2 ---
static_plot <- ggplot(iris, aes(x = Sepal.Width, y = Petal.Width, color = Species)) +
  geom_point(size = 3, alpha = 0.8) +
  labs(
    title = "Static Scatter Plot (ggplot2)",
    x = "Sepal Width",
    y = "Petal Width"
  ) +
  theme_minimal()

cat("--- Task 1: Displaying Static ggplot2 Plot ---\n")
print(static_plot)

# --- 2. Converting Static Plot to Interactive Plot ---
interactive_ggplot <- ggplotly(static_plot)

cat("\n--- Task 2: Displaying Converted Interactive Plot (ggplotly) ---\n")
print(interactive_ggplot)

# --- 3. Interactive Visualization using Plotly directly ---
native_plotly <- plot_ly(
  data = iris, 
  x = ~Sepal.Width, 
  y = ~Petal.Width, 
  color = ~Species, 
  type = 'scatter', 
  mode = 'markers',
  marker = list(size = 10, opacity = 0.8)
) %>%
  layout(
    title = "Iris Data Set Visualization",
    xaxis = list(title = "Sepal Width", ticksuffix = " cm"),
    yaxis = list(title = "Petal Width", ticksuffix = " cm")
  )

cat("\n--- Task 3: Displaying Native Plotly Plot ---\n")
print(native_plotly)