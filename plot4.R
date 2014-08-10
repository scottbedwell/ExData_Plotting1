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

# Set up 2 by 2 plot
par(mfrow=c(2,2))

# First plot
with(set, plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", cex.axis = .8, cex.lab = .8))

# Second plot
with(set, plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage", cex.axis = .8, cex.lab = .8))

# Third plot
# Create plot with first variable (Sub_metering_1)
with(set, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", cex.axis = .8, cex.lab = .8))
# Add second variable to plot (Sub_metering_2)
with(set, lines(DateTime, Sub_metering_2, col = "red"))
# Add third variable to plot (Sub_metering_2)
with(set, lines(DateTime, Sub_metering_3, col = "blue"))
# Add legend to plot
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1.5,col=c("black","blue","red"), cex = .6, bty = "n")


# Fourth plot
with(set, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", cex.axis = .8, cex.lab = .8))

# Save as png
dev.copy(png, file = "plot4.png")
dev.off()