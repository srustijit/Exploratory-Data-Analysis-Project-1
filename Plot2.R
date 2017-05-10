setwd("C:/Users/Kanha/Desktop/Coursera/exdata_data_household_power_consumption")

datatable <- read.csv("./household_power_consumption.txt", sep=';', na.strings="?") 

datatable$Date <- as.Date(datatable$Date, format="%d/%m/%Y")

data <- subset(datatable, subset=(datatable$Date >= "2007-02-01" & datatable$Date <= "2007-02-02"))

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()