##download the data, noting it is separated by ; and that the first
##row contains the variables, so header = TRUE

power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
##stringasfactors makes what would have been factor variables characters

##convert Date variable to date format
power$Date <- as.Date(power$Date, "%d/%m/%Y") ##needed to capitalize Y
##Subset for only February 1st and 2nd, 2007
DATE1 <- as.Date("1/2/2007", "%d/%m/%Y")
DATE2 <- as.Date("2/2/2007", "%d/%m/%Y")
newset <- subset(power, Date >= DATE1 & Date <= DATE2)

datetime <- paste(newset$Date, newset$Time) ##Combine dates and times
newset$datetime <- as.POSIXct(datetime) ##Put in POSIX format and insert
##into dataset

##sub-metering 1 and 2 need to be changed to numeric
newset$Sub_metering_1 <- as.numeric(newset$Sub_metering_1)
newset$Sub_metering_2 <- as.numeric(newset$Sub_metering_2)

plot(newset$datetime, newset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(newset$datetime, newset$Sub_metering_2, type = "l", col = "red")
lines(newset$datetime, newset$Sub_metering_3, type = "l", col = "blue")

legend("topright", lty = 1,col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
