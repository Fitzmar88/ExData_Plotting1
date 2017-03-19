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

##Need to turn Global_active_power into a numeric vector
newset$Global_active_power <- as.numeric(newset$Global_active_power)
hist(newset$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
