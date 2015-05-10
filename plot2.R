con <- file("household_power_consumption.txt","r")
data <- read.table(file = "./household_power_consumption.txt",header = TRUE,sep = ";",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),stringsAsFactors = FALSE, na.strings = "?")
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data1 <- subset(data,Date>="2007-02-01" & Date<="2007-02-02")
datetime <- paste(as.Date(data1$Date),data1$Time)
data1$Datetime <- as.POSIXct(datetime)
rm(data)

#Printing plot1.PNG image
png(filename = "./plot2.png",width = 480,height = 480)
plot(y = data1$Global_active_power,x = data1$Datetime,xlab = "",ylab = "Global Active Power (kilowatts)",type = "l" )
dev.off()
