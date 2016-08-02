library(dplyr)
testdata <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
specdata <- filter(testdata, Date=="1/2/2007" | Date=="2/2/2007")
specdata$Date <- strptime(paste(as.character(specdata$Date),as.character(specdata$Time)),
                      "%d/%m/%Y %H:%M:%S")

png(file="plot3.png")
with(specdata,plot(Date,as.numeric(as.character(Sub_metering_1)),type = "l",
                   xlab = " ",ylab = "Energy sub metering"))
with(specdata,lines(Date,as.numeric(as.character(Sub_metering_2)),col="red"))
with(specdata,lines(Date,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright",col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd = 1)


dev.off()
