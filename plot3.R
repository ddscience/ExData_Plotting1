png(file="plot3.png")

data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

startdate<-as.Date("2007-02-01")
enddate<-as.Date("2007-02-02")

data[,1]=as.Date(data[,1], format="%d/%m/%Y")

targetdata<-data[(data[,1]>=startdate) & (data[,1]<=enddate),]

targetdata[[2]]<-strptime(paste(targetdata[,1], targetdata[,2]), "%Y-%m-%d %H:%M:%S")


with(targetdata, {
        plot(Time, Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering")
        lines(Time, Sub_metering_2, col="red")
        lines(Time, Sub_metering_3, col="blue")
        legend("topright", lty=1,
               c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","blue", "red"))
})

dev.off()