png(file="plot1.png")

data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

startdate<-as.Date("2007-02-01")
enddate<-as.Date("2007-02-02")

data[,1]=as.Date(data[,1], format="%d/%m/%Y")

targetdata<-data[(data[,1]>=startdate) & (data[,1]<=enddate),]

targetdata[[2]]<-strptime(paste(targetdata[,1], targetdata[,2]), "%Y-%m-%d %H:%M:%S")

hist(targetdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()