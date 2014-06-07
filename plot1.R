#faster reading
initial <- read.csv2("household_power_consumption.txt",nrows=100)
classes <- sapply(initial,class)
tabAll <- read.csv2("household_power_consumption.txt",colClasses=classes, na.strings = "?", stringsAsFactors = FALSE)

#subsetting
relevant_data <- subset(tabAll, Date == '1/2/2007' | Date == '2/2/2007' )

#save png
png(filename = "plot1.png")

#plot1
hist(as.numeric(as.character(relevant_data$Global_active_power)), xlab = "Global Active Power (kilowatts)", main = "Global active Power",  col="red" )

#close device
dev.off()