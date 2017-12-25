getwd()
setwd("E:/Data Science/course 4 ExploratoryData")
##download file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./class1/powerdata.zip")
# Unzip dataSet to /project directory
unzip(zipfile="./class1/powerdata.zip",exdir="./class1/powerdata")


power1<-read.table("./class1/powerdata/household_power_consumption.txt",sep=";",header=TRUE)

power<-subset(power1,power1$Date=="1/2/2007" | power1$Date =="2/2/2007")
class(power)
class(power$Global_active_power)




power$timestamp<-(paste(power$Date,power$Time)) ## combine first, then change to time format
power$timestamp<-strptime(power$timestamp,format="%d/%m/%Y%H:%M:%S")

class(power$timestamp)


windows() 
par(mfrow=c(2,2))
plot(power$timestamp, as.numeric(as.character(power$Global_active_power)), type = "l", 
     xlab = "", ylab = "Global Active Power(kilowatts)")

plot(power$timestamp, as.numeric(as.character(power$Voltage)), type = "l", 
     xlab = "datetime", ylab = "Voltage")

plot(power$timestamp,as.numeric(as.character(power$Sub_metering_1)),
     type="l",xlab="",ylab="Energy Sub-metering")
lines(power$timestamp, as.numeric(as.character(power$Sub_metering_2)), type = "l", col = "red" )
lines(power$timestamp, as.numeric(as.character(power$Sub_metering_3)), type = "l", col = "blue" )
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty="n",cex=0.5) ##bty remove box and cex adjust legend text

plot(power$timestamp,as.numeric(as.character(power$Global_reactive_power)),type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png,file="plot4.png")
dev.off()
