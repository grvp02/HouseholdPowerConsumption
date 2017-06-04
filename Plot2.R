data<-read.table("./household_power_consumption/household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
requireddata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(requireddata$Date, requireddata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
requireddata <- cbind(SetTime, requireddata)
##Plot2
png(filename = "plot2.png",width = 480, height = 480)
plot(requireddata$SetTime, requireddata$Global_active_power, type="l", col="black",xlab="",ylab="Global Active Power(kilowatts)")
dev.off()
