setwd("C:/Users/pranita.s/Downloads")

dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
filter_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(filter_data$Date, filter_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Power <- as.numeric(filter_data$Global_active_power)
#png("plot2.png", width=480, height=480)
plot(datetime, Power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
