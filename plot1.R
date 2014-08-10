# Read data
set <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")

# Get column names
cols <- colnames(set)

# Set data types
set$Date <- as.Date(set$Date, "%d/%m/%Y")
set$Global_active_power <- as.numeric(set$Global_active_power)

# Subset data set to the 2 relevant dates
set <- subset(set, set$Date %in% as.Date(c("2007-02-01", "2007-02-02")))

# Create histogram
hist(as.numeric(set$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Save as PNG
dev.copy(png, file = "plot1.png")
dev.off()