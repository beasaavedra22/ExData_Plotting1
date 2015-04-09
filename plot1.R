#Reading data
data<-read.table("household_power_consumption.txt",header=TRUE, sep = ";")
#Subsetting data
d<-subset(data,Date=="1/2/2007" | Date == "2/2/2007")
#Converting data to numeric
d$Global_active_power<-as.numeric(as.character(d$Global_active_power))
#Printing histogram
par(mfrow=c(1,1))
hist(d$Global_active_power,col="red", xlab = "Global active power (kilowatts)",main = "Global active power",yaxt= "n")
#Adjusting axis
axis(2,at=seq(0,1200,by=200),labels = c("0","200","400","600","800","1000","1200"),cex.axis = 0.75)


#Saving plot into png file
dev.copy(png,file = "plot1.png", width=480, height=480) 
dev.off()