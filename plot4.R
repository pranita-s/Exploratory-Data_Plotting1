setwd("C:/Users/pranita.s/Downloads")

dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
filter <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(filter$Date, filter$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Power <- as.numeric(filter$Global_active_power)
rPower <- as.numeric(filter$Global_reactive_power)
vol <- as.numeric(filter$Voltage)
meter1 <- as.numeric(subSetData$Sub_metering_1)
meter2 <- as.numeric(subSetData$Sub_metering_2)
meter3 <- as.numeric(subSetData$Sub_metering_3)

#png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

plot(datetime,Power, type="l", xlab="", ylab="Global Active Power")

plot(datetime, vol, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, meter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, meter2, type="l", col="red")
lines(datetime, meter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), lty=1, lwd=2, bty="n")
plot(datetime, rPower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
