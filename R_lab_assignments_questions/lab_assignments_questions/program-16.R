# --- Program: Function to generate Fibonacci series ---
generate_fibonacci <- function(n) {
  if (n <= 0) return("Please enter a positive integer.")
  if (n == 1) return(0)
  
  fib_sequence <- numeric(n)
  fib_sequence[1] <- 0
  if (n > 1) fib_sequence[2] <- 1
  
  if (n > 2) {
    for (i in 3:n) {
      fib_sequence[i] <- fib_sequence[i - 1] + fib_sequence[i - 2]
    }
  }
  return(fib_sequence)
}

# --- Section: Testing with interactive user input ---
# Test Case 1
cat("Test Case 1: Generating for 5 terms\n")
num_terms1 <- as.integer(readline(prompt = "Enter number of terms: "))
result1 <- generate_fibonacci(num_terms1)
cat("Fibonacci series:", result1, "\n\n")

# Test Case 2
cat("Test Case 2: Generating for 10 terms\n")
num_terms2 <- as.integer(readline(prompt = "Enter number of terms: "))
result2 <- generate_fibonacci(num_terms2)
cat("Fibonacci series:", result2, "\n\n")

# Test Case 3
cat("Test Case 3: Generating for 1 term\n")
num_terms3 <- as.integer(readline(prompt = "Enter number of terms: "))
result3 <- generate_fibonacci(num_terms3)
cat("Fibonacci series:", result3, "\n")