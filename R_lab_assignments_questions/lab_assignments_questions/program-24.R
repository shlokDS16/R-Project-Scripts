# --- Program: Stock Price Analysis Script ---
closing_prices <- c(120, 122, 118, 121, 119, 117, 123, 125, 126, 124, 
                    128, 130, 129, 131, 135, 134, 136, 137, 140, 138, 
                    139, 141, 142, 144, 143, 145, 146, 148, 147, 149)

# --- 1. Calculate Daily Returns (Percentage Change) ---
# diff() calculates the change between consecutive elements
# Returns are calculated as (Price_t - Price_t-1) / Price_t-1 * 100
daily_returns <- (diff(closing_prices) / closing_prices[-length(closing_prices)]) * 100

# --- 2. Identify Highest and Lowest Returns ---
max_return <- max(daily_returns)
max_day <- which.max(daily_returns) + 1  # Adding 1 because diff() reduces vector length by 1

min_return <- min(daily_returns)
min_day <- which.min(daily_returns) + 1

# --- 3. Calculate Cumulative Return ---
# Cumulative return = ((Final Price - Initial Price) / Initial Price) * 100
cumulative_return <- ((closing_prices[length(closing_prices)] - closing_prices[1]) / closing_prices[1]) * 100

# --- Section: Print Results to Console ---
cat("Daily Returns (%):\n", round(daily_returns, 2), "\n\n")
cat("Highest Return:", round(max_return, 2), "% on Day", max_day, "\n")
cat("Lowest Return:", round(min_return, 2), "% on Day", min_day, "\n")
cat("Total Cumulative Return:", round(cumulative_return, 2), "%\n")
