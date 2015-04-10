#Reading data
data<-read.table("household_power_consumption.txt",header=TRUE, sep = ";")
#Subsetting data
d<-subset(data,Date=="1/2/2007" | Date == "2/2/2007")
#Converting data as numeric
d$Global_active_power<-as.numeric(as.character(d$Global_active_power))

#Create a dataframe with the values to print and the date, formatted
a <- strptime(paste(d$Date, d$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
df<- data.frame(date=a, val=d$Global_active_power)

#Plotting data
#Only one figure is going to be plot and margins adjusted, reduce font size
par(mfrow=c(1,1),mar=c(4,4,2,2),cex.main=0.9,cex.lab=0.65,cex.axis=0.75)
#To display weekdays
Sys.setlocale("LC_ALL","C")
#Plot the axis, title...but no line
plot(df$date,df$val,type="n",ylab = "Global active power (kilowatts)",xlab="")
#Plot data
lines(df$date,df$val)

#Saving plot into png file
#Background is set to white, since transparency is not covered in the lesson
dev.copy(png,file = "plot2.png", width=480, height=480) 
dev.off()