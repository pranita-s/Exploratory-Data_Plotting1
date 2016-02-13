setwd("C:/Users/pranita.s/Downloads")

dataFile <- "household_power_consumption.txt"

filter <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(filter$Date, filter$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(filter$Global_active_power)
meter1 <- as.numeric(filter$Sub_metering_1)
meter2 <- as.numeric(filter$Sub_metering_2)
meter3 <- as.numeric(filter$Sub_metering_3)

#png("plot3.png", width=480, height=480)
plot(datetime, meter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, meter2, type="l", col="red")
lines(datetime, meter3, type="l", col="blue")
legend("topright",col=c("black", "red", "blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2)
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()
