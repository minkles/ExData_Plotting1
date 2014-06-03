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

#Opening png device
png(file="plot2.png", width=480, height=480, bg="white")

#Creating line plot in "plot2.png"
with(households, plot(datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

#Closing png device
dev.off()