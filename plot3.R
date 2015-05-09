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

png("plot3.png", width = 480, height = 480)
with(df, plot(datetime, Sub_metering_1, type = "n", 
              ylab="Energy sub metering", xlab="datetime"))
with(df, lines(datetime, Sub_metering_1))
with(df, lines(datetime, Sub_metering_2, col="red"))
with(df, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"))
dev.off()