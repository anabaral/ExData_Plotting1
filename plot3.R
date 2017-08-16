# related to label locale
Sys.setlocale("LC_TIME", "English") 

# read data
powdata <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

# filter data
powdata <- powdata[powdata$Date=="1/2/2007" | powdata$Date == "2/2/2007",]

# plot data
png("plot3.png", width=480,height=480)
plot(as.POSIXct(
        paste(as.Date(powdata$Date, "%d/%m/%Y"), 
        powdata$Time)), 
     powdata$Sub_metering_1, 
     type="l", ylab = "Energy sub metering", xlab="")
points(as.POSIXct(
        paste(as.Date(powdata$Date, "%d/%m/%Y"), 
        powdata$Time)), 
      powdata$Sub_metering_2, 
      col="red", type="l")
points(as.POSIXct(
        paste(as.Date(powdata$Date, "%d/%m/%Y"), 
        powdata$Time)), 
      powdata$Sub_metering_3, 
      col="blue", type="l")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"),
       lty=c(1,1,1))
dev.off()