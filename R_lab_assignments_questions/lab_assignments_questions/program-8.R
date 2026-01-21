# --- Program: Function to calculate area of a circle ---
calculate_circle_area <- function(radius) {
  area <- pi * radius^2
  return(area)
}

# --- Section: Test cases with different radii ---
result1 <- calculate_circle_area(3)
result2 <- calculate_circle_area(5.5)
result3 <- calculate_circle_area(0)
result4 <- calculate_circle_area(7.2)

# --- Section: Print results to console ---
cat("Area of circle with radius 3:", result1, "\n")
cat("Area of circle with radius 5.5:", result2, "\n")
cat("Area of circle with radius 0:", result3, "\n")
cat("Area of circle with radius 7.2:", result4, "\n")