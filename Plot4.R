data<-read.table("./household_power_consumption/household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
requireddata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(requireddata$Date, requireddata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
requireddata <- cbind(SetTime, requireddata)

##Plot4

png(filename = "plot4.png",width = 480, height = 480)
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(requireddata$SetTime, requireddata$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
plot(requireddata$SetTime, requireddata$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot(requireddata$SetTime, requireddata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(requireddata$SetTime, requireddata$Sub_metering_2, type="l", col="red")
lines(requireddata$SetTime, requireddata$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(requireddata$SetTime, requireddata$Global_reactive_power, type="l", col="black", xlab="datetime",ylab="Global_reactive_power")
dev.off()
