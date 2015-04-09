#Reading data
data<-read.table("household_power_consumption.txt",header=TRUE, sep = ";")
#Subsetting data
d<-subset(data,Date=="1/2/2007" | Date == "2/2/2007")
#Converting data as numeric
d$Global_active_power<-as.numeric(as.character(d$Global_active_power))

#Plotting data
par(mfrow=c(1,1))
plot(d$Global_active_power,type="n",ylab = "Global active power (kilowatts)")
lines(d$Global_active_power)
#Saving plot into png file
dev.copy(png,file = "plot2.png", width=480, height=480) 
dev.off()