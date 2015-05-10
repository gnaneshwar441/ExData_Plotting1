con <- file("household_power_consumption.txt","r")
data <- read.table(file = "./household_power_consumption.txt",header = TRUE,sep = ";",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),stringsAsFactors = FALSE, na.strings = "?")
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data1 <- subset(data,Date>="2007-02-01" & Date<="2007-02-02")
rm(data)

#Printing plot1.PNG image
png(filename = "./plot1.png",width = 480,height = 480)
hist(data1$Global_active_power,xlab = "Global Active Power (kilowatts)",main = "Global Active Power",col = "red" )
dev.off()
