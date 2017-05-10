setwd("C:/Users/Kanha/Desktop/Coursera/exdata_data_household_power_consumption")

datatable <- read.csv("./household_power_consumption.txt", sep=';', na.strings="?") 
                      

datatable$Date <- as.Date(datatable$Date, format="%d/%m/%Y")


data <- subset(datatable, subset=(datatable$Date >= "2007-02-01" & datatable$Date <= "2007-02-02"))



hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")


dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()