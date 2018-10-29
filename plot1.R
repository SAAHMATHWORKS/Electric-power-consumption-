#Reading data
data<-read.csv("household_power_consumption.txt", sep=';', na.strings="?",
               check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#Get an idea on data structure
str(data)
#Selecting of data where Date is in 1/2/2007 or 2/2/2007
energyData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
attach(energyData)
#Convert Date in date class
Date <- as.Date(Date)
#plotting histogram our first plot 
hist(x = Global_active_power, col="red",xlab="Global Active Power (kilowatts)",
     ylab="Frequency",main="Global Active Power")
#Saving plot1
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()