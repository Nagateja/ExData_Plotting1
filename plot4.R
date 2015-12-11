##This program creates a plot which is names plot4.png

##Reading the data in using read.table
eda1<-read.table("exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", na.strings = "NA", header = TRUE, stringsAsFactors = FALSE)

##Subsetting required data
reqdata<-subset(eda1, Date %in% c("1/2/2007", "2/2/2007"))
library(dplyr)

##Adding the Date_Time column to the required data
reqdata<-mutate(reqdata, Date_Time = paste(Date, Time, sep= " "))
reqdata$Date_Time<-strptime(reqdata$Date_Time, "%d/%m/%Y %H:%M:%S")

##Changing the classof the charcater data to numeric
reqdata[,3]<-as.numeric(reqdata[,3])
reqdata[,4]<-as.numeric(reqdata[,4])
reqdata[,5]<-as.numeric(reqdata[,5])
reqdata[,6]<-as.numeric(reqdata[,6])
reqdata[,7]<-as.numeric(reqdata[,7])
reqdata[,8]<-as.numeric(reqdata[,8])
reqdata[,9]<-as.numeric(reqdata[,9])

##Opening png graphic device, plotting and closing the device
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
with(reqdata, {
  plot(Date_Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(Date_Time, Voltage, col = "black", type = "l", xlab = "datetime", ylab = "Voltage")
  plot(Date_Time, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
  lines(Date_Time, Sub_metering_2, col = "red")
  lines(Date_Time, Sub_metering_3, col = "blue")
  legend("topright", bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 1.5)
  plot(Date_Time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()
