# Step 1: Install and load packages
if (!require("DBI")) install.packages("DBI")
if (!require("RSQLite")) install.packages("RSQLite")
if (!require("dplyr")) install.packages("dplyr")

library(DBI)
library(RSQLite)
library(dplyr)

# Step 2: Set working directory (Update this path to your folder)
# setwd("path/to/your/database/folder")

# Step 3: Establish connection and handle errors
tryCatch({
  con <- dbConnect(RSQLite::SQLite(), "songs.db")
  
  # Step 4: Create a reference to the 'songs' table
  songs_db <- tbl(con, "songs")
  
  # Step 5: Construct the query for Queen (artist_id = 11)
  queen_songs_query <- songs_db %>%
    filter(artist_id == 11) %>%
    select(title)
  
  # Step 6: Display SQL syntax
  cat("--- Generated SQL Syntax ---\n")
  show_query(queen_songs_query)
  
  # Step 7: Retrieve data as a tibble
  queen_songs_data <- collect(queen_songs_query)
  
  cat("\n--- Retrieved Data (Queen Songs) ---\n")
  print(queen_songs_data)
  
}, error = function(e) {
  message("An error occurred: ", e$message)
}, finally = {
  # Step 8: Ensure disconnection
  if (exists("con")) {
    dbDisconnect(con)
    cat("\nDatabase disconnected successfully.\n")
  }
})
