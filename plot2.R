# Check if power_data.txt exists
# If not, read in big file, otherwise use the cleaned version
if (!file.exists("power_data.txt")){
    print("Reading full data file...")
    source("read_data.R")
} else{
    print("Using existing power_data.txt...")
}

df <- read.table("power_data.txt", header = TRUE, 
                 stringsAsFactors = FALSE)
df$datetime <- with(df, paste(Date, Time, sep = " "))
df$datetime <- as.POSIXct(strptime(df$datetime, "%d/%m/%Y %H:%M:%S"))


print("Plotting...")

# Plot 2 GAP vs datetime, axis label in weekday
png("plot2.png", width = 480, height = 480)
with(df, plot(datetime, Global_active_power, type="l", 
              ylab = "Global Active Power (kilowatts)"))
dev.off()