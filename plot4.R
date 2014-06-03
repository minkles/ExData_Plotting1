# Before running this code, the file
# "household_power_consumption.txt" must
# be placed in your working directory.

#Reading the data
households <- read.table("./household_power_consumption.txt", header = TRUE, sep=";")

#Converting dates in the data set to the Date format
households$Date <- as.Date(as.character(households$Date), format="%d/%m/%Y")

#Subsetting only the rows with date "2007-02-01" or "2007-02-02"
households <- households[which(households$Date=="2007-02-01" | households$Date=="2007-02-02"),]

#Combining date and time into one 1 column
households$datetime <- paste(as.character(households$Date), as.character(households$Time))

#Converting datetime column to Time format
households$datetime <- strptime(households$datetime, format="%Y-%m-%d %H:%M:%S")

#Converting the "Global_active_power" column to numeric
households$Global_active_power <- as.numeric(as.character(households$Global_active_power))

#Converting the "Global_reactive_power" column to numeric
households$Global_reactive_power <- as.numeric(as.character(households$Global_reactive_power))

#Converting Sub metering columns to numeric
households$Sub_metering_1 <- as.numeric(as.character(households$Sub_metering_1))
households$Sub_metering_2 <- as.numeric(as.character(households$Sub_metering_2))
households$Sub_metering_3 <- as.numeric(as.character(households$Sub_metering_3))

#Converting Voltage column to numeric
households$Voltage <- as.numeric(as.character(households$Voltage))

#Opening png device
png(file="plot4.png", width=480, height=480, bg="white")

#Setting number of plots in the PNG file
par(mfrow = c(2,2)) #Plots go from left to right then top to bottom

#Global active power chart
with(households, plot(datetime, Global_active_power, type="l", ylab="Global Active Power", xlab=""))

#Voltage chart
with(households, plot(datetime, Voltage, type="l", ylab="Voltage", xlab="datetime"))

#Energy sub metering chart
with(households, plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(households, lines(datetime, Sub_metering_2, type="l", ylab="Energy sub metering", xlab="", col="red"))
with(households, lines(datetime, Sub_metering_3, type="l", ylab="Energy sub metering", xlab="", col="blue"))
legend("topright", pch="―", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

#Global reactive power chart
with(households, plot(datetime, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime"))

#Closing png device
dev.off()
