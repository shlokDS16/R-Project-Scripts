# --- Program: Function to calculate the square of a number ---
calculate_square <- function(number) {
  return(number^2)
}

# --- Section: Test cases with different inputs ---
result1 <- calculate_square(4)
result2 <- calculate_square(-3)
result3 <- calculate_square(0)
result4 <- calculate_square(5.7)

# --- Section: Print results to console ---
cat("Square of 4:", result1, "\n")
cat("Square of -3:", result2, "\n")
cat("Square of 0:", result3, "\n")
cat("Square of 5.7:", result4, "\n")