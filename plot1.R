# Check if power_data.txt exists
# If not, read in big file, otherwise use the cleaned version
if (!file.exists("power_data.txt")){
    print("Reading full data file...")
    source("read_data.R")
} else{
    print("Using existing power_data.txt...")
}

df <- read.table("power_data.txt", header = TRUE)

print("Plotting...")

# Plot 1 Global Active Power histogram
png("plot1.png", width = 480, height = 480)
hist(df$Global_active_power, xlab="Global Active Power (kilowatts)", 
     main="Global Active Power", col="red", ylim=c(0,1200))
axis(side=1, at=seq(0,1200, 200), labels=seq(0,1200,200))
dev.off()



# Plot 3 sub_meters vs date time in weekday
# Plot 4 Plots 2&3 on the LHS, voltage and reactive power on RHS

# Save everything as png
