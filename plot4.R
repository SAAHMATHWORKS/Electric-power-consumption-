#Sys.setlocale("LC_TIME","English")
#Reading data
data<-read.csv("household_power_consumption.txt", sep=';', na.strings="?",
               check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data$Date<-as.Date(data$Date, format="%d/%m/%Y")
#Get an idea on data structure
str(data)
#Selecting of data where Date is in 1/2/2007 or 2/2/2007
energyData<- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(data)
#Convert Date in date class
datetime <- paste(as.Date(energyData$Date), energyData$Time)
energyData$datetime <- as.POSIXct(datetime)
#Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(energyData, {
  plot(Global_active_power~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

#Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()