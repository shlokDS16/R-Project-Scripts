# Step 1: Install and Load ggplot2
if (!require("ggplot2")) install.packages("ggplot2")
library(ggplot2)

# Step 2: Create the Dataset from the image
# Setting a seed so the 'rnorm' values are reproducible
set.seed(123) 
df <- data.frame(
  a = 1:10,
  b = c(-0.06255147, 0.69577692, 0.54925271, -0.18723665, 0.13819408, 
        0.48775542, 0.31924104, 0.85842312, -0.44658948, 0.77177795),
  label = letters[11:20] # k to t
)

# --- a. Scatter Plot ---
p1 <- ggplot(df, aes(x = a, y = b)) +
  geom_point(size = 3) +
  labs(title = "Basic Scatter Plot", x = "Variable A", y = "Variable B") +
  theme_minimal()

# --- b. Customized Line Plot ---
p2 <- ggplot(df, aes(x = a, y = b)) +
  geom_line(color = "red", size = 1.5) +
  labs(title = "Customized Red Line Plot", x = "Variable A", y = "Variable B") +
  theme_minimal()

# --- c. Customized Bar Plot ---
p3 <- ggplot(df, aes(x = factor(a), y = b)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Blue Bar Plot", x = "Category (A)", y = "Value (B)") +
  theme_minimal()

# --- d. Scatter Plot with Smooth Line ---
p4 <- ggplot(df, aes(x = a, y = b)) +
  geom_point(color = "darkgreen", size = 4) +
  geom_smooth(method = "lm", se = FALSE, color = "orange") +
  labs(title = "Scatter with Linear Model Trend", x = "Variable A", y = "Variable B") +
  theme_minimal()

# Display plots (one by one)
print(p1)
print(p2)
print(p3)
print(p4)