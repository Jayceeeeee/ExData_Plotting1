library(dplyr)
testdata <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
specdata <- filter(testdata, Date=="1/2/2007" | Date=="2/2/2007")
specdata$Date <- strptime(paste(as.character(specdata$Date),as.character(specdata$Time)),
                          "%d/%m/%Y %H:%M:%S")

png(file="plot4.png")
par(mfrow=c(2,2))
plot(specdata$Date, as.numeric(as.character(specdata$Global_active_power))
     , xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')

plot(specdata$Date, as.numeric(as.character(specdata$Voltage)),
     xlab = 'datetime', ylab = 'Voltage', type = 'l')

with(specdata,plot(Date,as.numeric(as.character(Sub_metering_1)),type = "l",
                   xlab = " ",ylab = "Energy sub metering"))
with(specdata,lines(Date,as.numeric(as.character(Sub_metering_2)),col="red"))
with(specdata,lines(Date,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright",col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lwd = 1 ,bty = "n")

plot(specdata$Date, as.numeric(as.character(specdata$Global_reactive_power)),
     xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')

dev.off()
