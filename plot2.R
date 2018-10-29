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

#Plotting time-series with Date labels on x-axis, Global_active_power in y-axis 
plot(energyData$Global_active_power~energyData$datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
#Saving plot2
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()