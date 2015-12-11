##This program creates a plot which is named plot2.png

##Reading in data using read.table
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
png("plot2.png", width = 480, height = 480, units = "px")
with(reqdata, plot(Date_Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
