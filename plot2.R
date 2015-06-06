dataset <- "./household_power_consumption.txt"
data <- read.table(dataset,header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
reqdData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

date_time <- strptime(paste(reqdData$Date, reqdData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(reqdData$Global_active_power)
png("plot2.png",width=480,height=480)
plot(date_time,globalActivePower,type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
