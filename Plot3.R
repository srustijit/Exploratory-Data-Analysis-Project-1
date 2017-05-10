setwd("C:/Users/Kanha/Desktop/Coursera/exdata_data_household_power_consumption")

datatable <- read.csv("./household_power_consumption.txt", sep=';', na.strings="?") 

datatable$Date <- as.Date(datatable$Date, format="%d/%m/%Y")

data <- subset(datatable, subset=(datatable$Date >= "2007-02-01" & datatable$Date <= "2007-02-02"))

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()