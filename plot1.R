file <- "household_power_consumption.txt"
complete_data <- read.csv(file, header = TRUE, sep = ";", quote = "\"", dec = ".", na.strings = "?", 
                 stringsAsFactors=FALSE, comment.char="", check.names=FALSE,  nrows=2075259)

data <- complete_data[complete_data$Date %in% c("1/2/2007","2/2/2007") ,]
rm(complete_data)

#png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
