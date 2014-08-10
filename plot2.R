# Read data
set <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")

# Get column names
cols <- colnames(set)

# Create "DateTime" column with combination of date and time
set$DateTime <- strptime(paste(set$Date, set$Time), format = "%d/%m/%Y %H:%M:%S", tz = "UTC")

# Set data types
set$Date <- as.Date(set$Date, "%d/%m/%Y")
set$Global_active_power <- as.numeric(set$Global_active_power)

# Subset data set to the 2 relevant dates
set <- subset(set, set$Date %in% as.Date(c("2007-02-01", "2007-02-02")))

# Create plot
with(set, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

# Save as PNG
dev.copy(png, file = "plot2.png")
dev.off()