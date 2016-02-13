setwd("C:/Users/pranita.s/Downloads")

dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
filter_data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#png("plot1.png", width=480, height=480)
Power<- as.numeric(filter_data$Global_active_power)
hist(Power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,file="graph_plot1.png", width=480, height=480)
dev.off()
