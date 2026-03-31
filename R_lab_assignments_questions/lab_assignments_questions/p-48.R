# Step 1: Install and Load the Leaflet Package
if (!require("leaflet")) {
  install.packages("leaflet")
}
library(leaflet)

# Define coordinates for the Katpadi region
# Katpadi Railway Junction
katpadi_lat <- 12.9749
katpadi_lng <- 79.1361

# Nearby Landmark (e.g., VIT University)
landmark_lat <- 12.9692
landmark_lng <- 79.1559

# Step 2: Initialize the Map and Set View
cat("Initializing base map...\n")
base_map <- leaflet() %>%
  addTiles() %>%  # Adds the default OpenStreetMap base layer
  setView(lng = katpadi_lng, lat = katpadi_lat, zoom = 14)

# Step 3: Add a Marker with Popup Information
cat("Adding standard marker with popup...\n")
map_with_marker <- base_map %>%
  addMarkers(
    lng = katpadi_lng, 
    lat = katpadi_lat,
    popup = "Katpadi Railway Junction" # Requires a click to view
  )

# Step 4: Add a Customized Circle Marker
cat("Adding custom circle marker with hover label...\n")
final_map <- map_with_marker %>%
  addCircleMarkers(
    lng = landmark_lng, 
    lat = landmark_lat,
    radius = 8,                     # Size of the circle
    color = "red",                  # Outline color
    fillColor = "darkred",          # Inside color
    fillOpacity = 0.8,              # Transparency
    label = "VIT University"        # Appears on mouse hover
  )

# Display the fully featured interactive map
# (In RStudio, this will open in the Viewer pane)
final_map