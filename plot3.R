#read raw data
all_data <- read.csv2("household_power_consumption.txt",
                      header = TRUE,
                      sep = ";",
                      quote = "",
                      na.strings = "?",
                      dec = ".",
                      colClasses=c("character",
                                   "character",
                                   "numeric",
                                   "numeric",
                                   "numeric",
                                   "numeric",
                                   "numeric",
                                   "numeric",
                                   "numeric")
                      )

#subset data to 2007-02-01 and 2007-02-02
data <- subset(all_data, Date == '1/2/2007' | Date == '2/2/2007')

#convert dat and time to Date class
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %T")


#start PNG
png(file = "plot3.png",
    width = 480, height = 480)

#draw the plot
plot(data$datetime,
     data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(data$datetime,
      data$Sub_metering_2, col='red')
lines(data$datetime,
      data$Sub_metering_3, col='blue')

#draw legend
legend("topright",
       lty = c(1, 1, 1),
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       )


dev.off()
