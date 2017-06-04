data<-read.table("./household_power_consumption/household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
requireddata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(requireddata$Date, requireddata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
requireddata <- cbind(SetTime, requireddata)
##Plot3
png(filename = "plot3.png",width = 480, height = 480)
columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(requireddata$SetTime, requireddata$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(requireddata$SetTime, requireddata$Sub_metering_2, col=columnlines[2])
lines(requireddata$SetTime, requireddata$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid")
dev.off()
