# --- Program: Sensor Data Analysis and Visualization ---

# 1. Simulate 60 minutes of sensor data
set.seed(123) # For reproducible results
time <- 1:60
temp <- runif(60, 25, 35)      # Temperature in Celsius
humidity <- runif(60, 30, 60)  # Humidity in %
pressure <- runif(60, 1000, 1015) # Pressure in hPa

# --- 2. Calculate Average Readings ---
avg_temp <- mean(temp)
avg_hum <- mean(humidity)
avg_pres <- mean(pressure)

# --- 3. Identify Specific Time Intervals ---
# Logic: Temp > 30 AND Humidity < 40
critical_intervals <- which(temp > 30 & humidity < 40)

# --- 4. Plot Sensor Readings ---
# Plotting Temperature
plot(time, temp, type = "l", col = "red", ylim = c(20, 100), 
     main = "Sensor Readings Over 60 Minutes", xlab = "Time (min)", ylab = "Value")
# Adding Humidity to the same plot
lines(time, humidity, col = "blue")
legend("topright", legend = c("Temp (°C)", "Humidity (%)"), col = c("red", "blue"), lty = 1)

# --- Section: Print Results to Console ---
cat("--- Average Sensor Readings ---\n")
cat("Average Temperature:", round(avg_temp, 2), "°C\n")
cat("Average Humidity:", round(avg_hum, 2), "%\n")
cat("Average Pressure:", round(avg_pres, 2), "hPa\n\n")

cat("--- Critical Intervals ---\n")
if(length(critical_intervals) > 0) {
  cat("Conditions (Temp > 30 & Hum < 40) met at minutes:", critical_intervals, "\n")
} else {
  cat("Critical conditions were not met during this hour.\n")
}