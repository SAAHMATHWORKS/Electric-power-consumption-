Sys.setlocale("LC_TIME","English")
#Reading data
data<-read.csv("household_power_consumption.txt", sep=';', na.strings="?",
               check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#Get an idea on data structure
str(data)
#Selecting of data where Date is in 1/2/2007 or 2/2/2007
energyData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
rm(data)
#Convert Date in date class
Date <- as.Date(Date, format="%d/%m/%Y")
datetime <- paste(as.Date(Data1$Date), Data1$Time)
energyData$Datetime <- as.POSIXct(datetime)
attach(energyData)
#Plotting time-series with Date labels on x-axis, Global_active_power in y-axis 
plot(Global_active_power~Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
#Saving plot2
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()