
# read data
powdata <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

# filter data
powdata <- powdata[powdata$Date=="1/2/2007" | powdata$Date == "2/2/2007",]

# plot data
png("plot1.png", width=480,height=480)
hist(powdata$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     col="red")
dev.off()