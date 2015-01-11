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
png(file = "plot4.png",
    width = 480, height = 480)

#set layout
par(mfrow = c(2, 2))


#draw the plot
#1
plot(data$datetime,
     data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

#2
plot(data$datetime,
     data$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

#3
plot(data$datetime,
     data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(data$datetime,
      data$Sub_metering_2, col='red')
lines(data$datetime,
      data$Sub_metering_3, col='blue')
legend("topright",
       bty = "n",
       lty = c(1, 1, 1),
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)

#4
plot(data$datetime,
     data$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")


dev.off()
