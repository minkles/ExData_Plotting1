# Before running this code, the file
# "household_power_consumption.txt" must
# be placed in your working directory.

#Reading the data
households <- read.table("./household_power_consumption.txt", header = TRUE, sep=";")

#Converting dates in the data set to the Date format
households$Date <- as.Date(as.character(households$Date), format="%d/%m/%Y")

#Subsetting only the rows with date "2007-02-01" or "2007-02-02"
households <- households[which(households$Date=="2007-02-01" | households$Date=="2007-02-02"),]

#Converting the "Global_active_power" column to numeric
households$Global_active_power <- as.numeric(as.character(households$Global_active_power))

#Combining date and time into one 1 column
households$datetime <- paste(as.character(households$Date), as.character(households$Time))

#Converting datetime column to Time format
households$datetime <- strptime(households$datetime, format="%Y-%m-%d %H:%M:%S")

#Converting Sub metering columns to numeric
households$Sub_metering_1 <- as.numeric(as.character(households$Sub_metering_1))
households$Sub_metering_2 <- as.numeric(as.character(households$Sub_metering_2))
households$Sub_metering_3 <- as.numeric(as.character(households$Sub_metering_3))

#Opening png device
png(file="plot4.png", width=480, height=480, bg="white")

#Setting number of plots in the image