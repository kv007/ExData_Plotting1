# reading
tabAll <- read.csv2("household_power_consumption.txt",colClasses= "character", na.strings = "?", stringsAsFactors = FALSE)

#subsetting
relevant_data <- subset(tabAll, Date == '1/2/2007' | Date == '2/2/2007' )

#generate datetime
relevant_data$DateTime <- paste(as.Date(relevant_data$Date , format = "%d/%m/%Y"), relevant_data$Time)
relevant_data$datetime <- strptime(relevant_data$DateTime, format= "%Y-%m-%d %H:%M:%S")

  #save png
png(filename = "plot2.png")

#plot2
plot(relevant_data$datetime ,relevant_data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)",  type = "l" )

#close device
dev.off()
