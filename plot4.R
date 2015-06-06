dataset <- "./household_power_consumption.txt"
data <- read.table(dataset,header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
reqdData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

date_time <- strptime(paste(reqdData$Date, reqdData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(reqdData$Global_active_power)
globalReactivePower <- as.numeric(reqdData$Global_reactive_power)
voltage <- as.numeric(reqdData$Voltage)

sub_metering_1 <- as.numeric(reqdData$Sub_metering_1)
sub_metering_2 <- as.numeric(reqdData$Sub_metering_2)
sub_metering_3 <- as.numeric(reqdData$Sub_metering_3)

png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))

plot(date_time,globalActivePower,type="l", xlab="", ylab="Global Active Power",cex=0.2)

plot(date_time,voltage,type="l",xlab="datetime", ylab="Voltage")

plot(date_time,sub_metering_1,type="l", xlab="", ylab="Energy sub metering")
lines(date_time,sub_metering_2,type="l",col="red")
lines(date_time,sub_metering_3,type="l", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,lwd=2.5,col=c("black","red","blue"))

plot(date_time,globalReactivePower,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
