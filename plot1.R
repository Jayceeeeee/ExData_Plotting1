library(dplyr)
testdata <- read.table("household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?")
specdata <- filter(testdata, Date=="1/2/2007" | Date=="2/2/2007")
png(file="plot1.png")
hist(as.numeric(as.character(specdata$Global_active_power)),
     xlab = "Global Active Power(kilowatts)",
     main = "Global Active Power",col = "red")
dev.off()
