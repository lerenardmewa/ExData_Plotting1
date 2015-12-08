readData <- function() {
  data <- read.table("household_power_consumption.txt", 
         header = TRUE, sep = ";", 
         na.strings = "?", 
         stringsAsFactors = FALSE,
         colClasses = c(rep("character", 2), rep("numeric", 7)))
  
  data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
  
  data$myTimestamp <- strptime(paste(data$Date, data$Time), 
                               format = "%d/%m/%Y %H:%M:%S")
  
  data  
}

plot4 <- function() {
  data <- readData()

  png(filename = "plot4.png", width=480, height=480)
  
  par(mfcol = c(2,2))

  plot(data$myTimestamp, data$Global_active_power, 
       type="l", xlab="", 
       ylab="Global Active Power")
  
  plot(data$myTimestamp, data$Sub_metering_1, 
       type="l", xlab="", 
       ylab="Energy sub metering", col="black")
  lines(data$myTimestamp, data$Sub_metering_2, col="red")
  lines(data$myTimestamp, data$Sub_metering_3, col="blue")
  legend("topright", 
         c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
         col=c("black", "blue", "red"), lwd=2,
         bty="n")
  
  plot(data$myTimestamp, data$Voltage, 
       type="l", xlab="datetime", 
       ylab="Voltage")
  
  plot(data$myTimestamp, data$Global_reactive_power, 
       type="l", xlab="datetime", 
       ylab="Global_reactive_power")
  
  dev.off()
}
