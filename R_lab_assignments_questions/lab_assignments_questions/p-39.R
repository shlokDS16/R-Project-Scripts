# Step 1: Load required library
# install.packages("dplyr") # Run if not installed
library(dplyr)

# Step 2: Create the Customers Dataset
customers <- data.frame(
  CustomerName = c("John Doe", "Jane Smith", "Robert Brown", "Emily Davis", "Michael Green"),
  Email = c("john.doe@example.com", "jane.smith@example.com", 
            "robert.brown@example.com", "emily.davis@example.com", 
            "michael.green@example.com"),
  stringsAsFactors = FALSE
)

# Step 3: Create the Purchases Dataset
purchases <- data.frame(
  CustomerName = c("John Doe", "Jane Smith", "Robert Brown", "Sarah Johnson", "Emily Davis"),
  PurchaseAmount = c(150, 200, 120, 180, 220),
  Date = c("01-01-2023", "02-01-2023", "03-01-2023", "04-01-2023", "05-01-2023"),
  stringsAsFactors = FALSE
)

# Step 4: Perform the Joins
# Left Join: All customers, plus purchase info where available
left_result <- left_join(customers, purchases, by = "CustomerName")

# Right Join: All purchases, plus customer email where available
right_result <- right_join(customers, purchases, by = "CustomerName")

# Inner Join: Only those who exist in BOTH sets
inner_result <- inner_join(customers, purchases, by = "CustomerName")

# Full Join: Everything from both tables
full_result <- full_join(customers, purchases, by = "CustomerName")

# Display Results
cat("--- Left Join Result ---\n")
print(left_result)

cat("\n--- Full Join (Outer) Result ---\n")
print(full_result)