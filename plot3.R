file <- "household_power_consumption.txt"
complete_data <- read.csv(file, header = TRUE, sep = ";", quote = "\"", dec = ".", na.strings = "?", 
                          stringsAsFactors=FALSE, comment.char="", check.names=FALSE,  nrows=2075259)

data <- complete_data[complete_data$Date %in% c("1/2/2007","2/2/2007") ,]
rm(complete_data)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Plotting on metering

plot(data$Datetime, data$Sub_metering_1, type="l", ylab="Energy Sub metering", xlab="")
lines(data$Datetime, data$Sub_metering_2, type="l", col="red")
lines(data$Datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()