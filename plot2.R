getwd()
setwd("E:/Data Science/course 4 ExploratoryData")

if(!file.exists("./class1"))
{dir.create("./class1")}

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
plot(power$timestamp,as.numeric(as.character(power$Global_active_power)),main="Global Active Power Vs Time",
     type="l",xlab="",ylab="Global Active Power (kilowatts)") 

dev.copy(png,file="plot2.png")
dev.off()