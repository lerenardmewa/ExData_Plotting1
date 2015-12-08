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

plot1 <- function() {
  data <- readData()

  png(filename = "plot1.png", width=480, height=480)
  
  hist(data$Global_active_power, 
       col="red", 
       main="Global Active Power", 
       xlab="Global Active Power (kilowatts)")

  dev.off()
}
