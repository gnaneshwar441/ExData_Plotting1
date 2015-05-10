con <- file("household_power_consumption.txt","r")
data <- read.table(file = "./household_power_consumption.txt",header = TRUE,sep = ";",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),stringsAsFactors = FALSE, na.strings = "?")
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data1 <- subset(data,Date>="2007-02-01" & Date<="2007-02-02")
datetime <- paste(as.Date(data1$Date),data1$Time)
data1$Datetime <- as.POSIXct(datetime)
rm(data)

#Plot1.png
png(filename = "./plot4.png",width = 480,height = 480)
par(mfrow = c(2,2))
plot(y = data1$Global_active_power,x = data1$Datetime,type = "l",ylab = "Global Active Power",xlab = "")

#Plot2.png
plot(y = data1$Voltage,x = data1$Datetime,type = "l",ylab = "Voltage",xlab = "datetime")

#Plot3.png
plot(data1$Sub_metering_1~data1$Datetime,type = "l",ylab = "Energy sub metering",xlab = "")
points(data = data1,x = data1$Datetime,y = data1$Sub_metering_2,type = "l",col="red")
points(data = data1,x = data1$Datetime,y = data1$Sub_metering_3,type = "l",col="blue")
legend(x = "topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = 1,box.col = "white",inset = 0.01)

#Plot4.png
plot(y = data1$Global_reactive_power,x = data1$Datetime,type = "l",ylab = "Global_reactive_power",xlab = "datetime")
dev.off()
