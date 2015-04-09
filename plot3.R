#Reading data
data<-read.table("household_power_consumption.txt",header=TRUE, sep = ";")
#Subsetting data
d<-subset(data,Date=="1/2/2007" | Date == "2/2/2007")
#COnverting data as numeric
d$Sub_metering_1 <-as.numeric(as.character(d$Sub_metering_1))
d$Sub_metering_2 <-as.numeric(as.character(d$Sub_metering_2))
d$Sub_metering_3 <-as.numeric(as.character(d$Sub_metering_3))

#Plotting different data with lines
par(mfrow=c(1,1))
plot(d$Sub_metering_1,type="n",ylab="Energy sub metering")
lines(d$Sub_metering_1)
lines(d$Sub_metering_2,col="red")
lines(d$Sub_metering_3,col="blue")
#Adding legend
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       lwd=c(2.5,2.5,2.5),col=c("black","red","blue"),cex=0.75) 

#Saving plot into png file
dev.copy(png,file = "plot3.png", width=480, height=480) 
dev.off()