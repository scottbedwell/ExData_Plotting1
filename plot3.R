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

# Create plot with first variable (Sub_metering_1)
with(set, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
# Add second variable to plot (Sub_metering_2)
with(set, lines(DateTime, Sub_metering_2, col = "red"))
# Add third variable to plot (Sub_metering_2)
with(set, lines(DateTime, Sub_metering_3, col = "blue"))
# Add legend to plot
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1.5,col=c("black","blue","red"))

# Save as png
dev.copy(png, file = "plot3.png")
dev.off()