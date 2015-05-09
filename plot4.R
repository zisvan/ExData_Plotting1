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

png("plot4.png", width = 480, height = 480)
par(mfcol = c(2, 2))
with(df, {
    plot(datetime, Global_active_power, type="l", 
         ylab = "Global Active Power (kilowatts)")
    plot(datetime, Sub_metering_1, type = "n", 
         ylab="Energy sub metering", xlab="datetime")
    lines(datetime, Sub_metering_1)
    lines(datetime, Sub_metering_2, col="red")
    lines(datetime, Sub_metering_3, col="blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", 
                      "Sub_metering_2", 
                      "Sub_metering_3"))
    plot(datetime, Voltage, type="l")
    plot(datetime, Global_reactive_power, type="l") 
})

dev.off()