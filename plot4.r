
data <- read.table("household_power_consumption.txt",header = TRUE, sep=";",stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
energysubmetering1 <- as.numeric(subSetData$Sub_metering_1)
energysubmetering2 <- as.numeric(subSetData$Sub_metering_2)
energysubmetering3 <- as.numeric(subSetData$Sub_metering_3)
voltage <- as.numeric(subSetData$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime,globalActivePower, type="l",xlab="", ylab="Global Active Power (kilowatts)")

plot(datetime,voltage , type="l",xlab="datetime", ylab="Voltage")

plot(datetime,energysubmetering1 , type="l",xlab="", ylab="Energy sub metering")
lines(datetime,energysubmetering2 , type="l",col="red")
lines(datetime,energysubmetering3 , type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime,globalReactivePower , type="l",xlab="datetime", ylab="Global_reactive_power")

dev.off()