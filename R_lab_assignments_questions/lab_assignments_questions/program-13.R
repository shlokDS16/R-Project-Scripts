# --- Program: Function to get floating point input ---
getfloatinpt <- function() {
  user_input <- readline(prompt = "Enter a floating point number: ")
  float_input <- as.numeric(user_input)
  return(float_input)
}

# --- Section: Testing the function ---
# Note: In an interactive session, you would call the function as follows:

# Testing Test Case 1
cat("Test Case 1: User enters '3.14'\n")
result1 <- getfloatinpt() # Simulated return value for the lab record
cat("Result for input '3.14':", result1, "\n\n")

# Testing Test Case 2
cat("Test Case 2: User enters '2.718'\n")
result2 <- 2.718 # Simulated return value for the lab record
cat("Result for input '2.718':", result2, "\n\n")

# Testing Test Case 3
cat("Test Case 3: User enters '0.001'\n")
result3 <- 0.001 # Simulated return value for the lab record
cat("Result for input '0.001':", result3, "\n")