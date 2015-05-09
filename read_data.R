# Read 'big' data file
data <- read.table("../household_power_consumption.txt", 
                   header = TRUE, sep = ";", 
                   stringsAsFactors = FALSE, na.strings = "?")

# Paste Date and Time to datetime
data$datetime <- with(data, paste(Date, Time, sep = " "))

# Convert datetime from char to Date
data$datetime = as.Date(strptime(data$datetime, "%d/%m/%Y %H:%M:%S"))

# Subset
df <- subset(data, datetime >= as.Date("2007-02-01") &
                 datetime <= as.Date("2007-02-02"))

# Write out to a text file
write.table(df, "power_data.txt", row.names = FALSE, col.names = TRUE)