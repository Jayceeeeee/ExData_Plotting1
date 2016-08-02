library(dplyr)
testdata <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
specdata <- filter(testdata, Date=="1/2/2007" | Date=="2/2/2007")
specdata$Date<- strptime(paste(as.character(specdata$Date),as.character(specdata$Time)),
              "%d/%m/%Y %H:%M:%S")

png(file="plot2.png")
plot(specdata$Date,as.numeric(as.character(specdata$Global_active_power)),
     ylab = "Global Active Power(kilowatts)",xlab = " ",
     type = "l")#,xaxt="n")


dev.off()


