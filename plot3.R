# related to label locale
Sys.setlocale("LC_TIME", "English") 

# read data
powdata <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

# filter data
powdata <- powdata[powdata$Date=="1/2/2007" | powdata$Date == "2/2/2007",]

# plot data
powdata$datetime <- strptime(
  paste(as.Date(powdata$Date, "%d/%m/%Y"), 
        powdata$Time), 
  "%Y-%m-%d %H:%M:%S")

png("plot3.png", width=480,height=480)
plot(powdata$datetime, 
     powdata$Sub_metering_1, 
     type="l", ylab = "Energy sub metering", xlab="")
points(powdata$datetime, 
      powdata$Sub_metering_2, 
      col="red", type="l")
points(powdata$datetime, 
      powdata$Sub_metering_3, 
      col="blue", type="l")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"),
       lty=c(1,1,1))
dev.off()