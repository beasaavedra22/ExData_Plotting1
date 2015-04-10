#Reading data
data<-read.table("household_power_consumption.txt",header=TRUE, sep = ";")
#Subsetting data
d<-subset(data,Date=="1/2/2007" | Date == "2/2/2007")
#Converting data as numeric
#Create a dataframe with the values to print and the date, formatted
a <- strptime(paste(d$Date, d$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
df<- data.frame(date=a, val1=as.numeric(as.character(d$Sub_metering_1)),
             val2=as.numeric(as.character(d$Sub_metering_2)),
             val3=as.numeric(as.character(d$Sub_metering_3)))

#Plot different data with lines
#Only one figure is going to be plot and margins adjusted, reduce font size
par(mfrow=c(1,1),mar=c(4,4,2,2),cex.main=0.9,cex.lab=0.75,cex.axis=0.75)
#To display weekdays
Sys.setlocale("LC_ALL","C")
#Plot the axis, title...but no line
plot(df$date,df$val1,type="n",ylab="Energy sub metering",xlab="")
#Plot data with lines
lines(df$date,df$val1)
lines(df$date,df$val2,col="red")
lines(df$date,df$val3,col="blue")
#Add legend
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       lwd=c(2.5,2.5,2.5),col=c("black","red","blue"),cex=0.75) 

#Saving plot into png file
#Background is set to white, since transparency is not covered in the lesson
dev.copy(png,file = "plot3.png", width=480, height=480) 
dev.off()