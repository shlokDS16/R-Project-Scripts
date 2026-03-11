# --- Step 1: Install and Load Package ---
if (!require("jsonlite")) install.packages("jsonlite")
library(jsonlite)

# --- Step 2: Set Working Directory ---
# Using the path provided in your prompt
setwd("C:/Users/shlok/Downloads")

# --- Step 3: Read Existing Inventory ---
# Note: Using 'students.json' as requested in your path
inventory <- fromJSON("students.json")

cat("--- Original Inventory (First 3 rows) ---\n")
print(head(inventory, 3))

# --- Step 4: Add a New Product ---
new_product <- data.frame(
  id = 101,                  # Ensure column names match your JSON keys
  name = "Wireless Mouse",
  category = "Electronics",
  price = 25.99,
  stock = 50,
  stringsAsFactors = FALSE
)

# Append to inventory
updated_inventory <- rbind(inventory, new_product)

# --- Step 5: Write Updated Data to New JSON ---
# pretty = TRUE makes the JSON readable (indented)
json_output <- toJSON(updated_inventory, pretty = TRUE)
write(json_output, "updated_inventory.json")

# --- Step 6: Verify and Display ---
final_check <- fromJSON("updated_inventory.json")

cat("\n--- Updated Inventory Verification ---\n")
print(final_check)
cat("\nSuccess: 'updated_inventory.json' has been saved in Downloads.\n")