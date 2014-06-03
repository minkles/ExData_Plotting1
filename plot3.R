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
png(file="plot3.png", width=480, height=480, bg="white")

#Plotting Sub metering 1
with(households, plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))

#Plotting Sub metering 2
with(households, lines(datetime, Sub_metering_2, type="l", ylab="Energy sub metering", xlab="", col="red"))

#Plotting Sub metering 3
with(households, lines(datetime, Sub_metering_3, type="l", ylab="Energy sub metering", xlab="", col="blue"))

#Adding a legend
legend("topright", pch="―", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

#Closing png device
dev.off()