# related to label locale
Sys.setlocale("LC_TIME", "English") 

# read data
powdata <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

# filter data
powdata <- powdata[powdata$Date=="1/2/2007" | powdata$Date == "2/2/2007",]

# plot data
png("plot2.png", width=480,height=480)
plot(as.POSIXct(
        paste(as.Date(powdata$Date, "%d/%m/%Y"), 
        powdata$Time)), 
     powdata$Global_active_power, 
     type="l", 
     ylab = "Global Active Power (kilowatts)", 
     xlab="")
dev.off()