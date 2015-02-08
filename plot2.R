file <- "household_power_consumption.txt"
complete_data <- read.csv(file, header = TRUE, sep = ";", quote = "\"", dec = ".", na.strings = "?", 
                          stringsAsFactors=FALSE, comment.char="", check.names=FALSE,  nrows=2075259)

data <- complete_data[complete_data$Date %in% c("1/2/2007","2/2/2007") ,]
rm(complete_data)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Plotting
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
