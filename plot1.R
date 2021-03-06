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

#Opening png device
png(file="plot1.png", width=480, height=480, bg="white")

#Creating histogram in "plot1.png"
hist(households$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Closing png device
dev.off()

