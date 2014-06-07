# reading
tabAll <- read.csv2("household_power_consumption.txt",colClasses= "character", na.strings = "?", stringsAsFactors = FALSE)

#subsetting
relevant_data <- subset(tabAll, Date == '1/2/2007' | Date == '2/2/2007' )

#generate datetime
relevant_data$DateTime <- paste(as.Date(relevant_data$Date , format = "%d/%m/%Y"), relevant_data$Time)
relevant_data$datetime <- strptime(relevant_data$DateTime, format= "%Y-%m-%d %H:%M:%S")

#save png
png(filename = "plot4.png")

#plot4
par(mfrow = c(2, 2))
##plot 1,1
plot(relevant_data$datetime ,relevant_data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)",  type = "l" )

##plot 1,2
plot(relevant_data$datetime ,relevant_data$Voltage, xlab = "datetime", ylab = "Voltage",  type = "l" )


##plot 2,1
plot(relevant_data$datetime ,relevant_data$Sub_metering_1, ylab ="Energy sub metering", xlab="", type= "l",col="black" )
lines(relevant_data$datetime ,relevant_data$Sub_metering_2, type="l",col="blue")
lines(relevant_data$datetime ,relevant_data$Sub_metering_3, type="l",col="red")
legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),pt.cex=1,cex=0.5,lty=c(1,1),lwd=c(2.5,2.5),col=c("black","blue","red"))

##plot 2,2
plot(relevant_data$datetime ,relevant_data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power",  type = "l" )

#close device
dev.off()
