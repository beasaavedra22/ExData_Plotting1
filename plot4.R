#Reading data
data<-read.table("household_power_consumption.txt",header=TRUE, sep = ";")
#Subsetting data
d<-subset(data,Date=="1/2/2007" | Date == "2/2/2007")
#COnverting data as numeric
d$Sub_metering_1 <-as.numeric(as.character(d$Sub_metering_1))
d$Sub_metering_2 <-as.numeric(as.character(d$Sub_metering_2))
d$Sub_metering_3 <-as.numeric(as.character(d$Sub_metering_3))
d$Global_active_power<-as.numeric(as.character(d$Global_active_power))
d$Voltage <- as.numeric(as.character(d$Voltage))
d$Global_reactive_power <- as.numeric(as.character(d$Global_reactive_power))
#Setting multiplot
par(mfrow=c(2,2))

#Plot #1
plot(d$Global_active_power,type="n",ylab = "Global active power (kilowatts)",xlab="")
lines(d$Global_active_power)

#Plot #2
plot(d$Voltage,type="n",ylab = "Voltage",xlab="datetime")
lines(d$Voltage)

#Plot #3
plot(d$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
lines(d$Sub_metering_1)
lines(d$Sub_metering_2,col="red")
lines(d$Sub_metering_3,col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       lwd=c(2.5,2.5,2.5),col=c("black","red","blue"),cex=0.5) 

#Plot #4
plot(d$Global_reactive_power,type="n",ylab="Global_reactive_power",xlab="datetime")
lines(d$Global_reactive_power)

#Saving plot into png file
dev.copy(png,file = "plot4.png", width=480, height=480) 
dev.off()

