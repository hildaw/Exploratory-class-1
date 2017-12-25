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

windows() 
hist(as.numeric(as.character(power$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
##probably you have some non numeric value inside your variables
##because R is considering it as character and so, 
##as you didn't specify you didn't want characters as factors, 
##R is importing the variables as factors. You can do as.numeric(as.character(myvariable))
##to change your variable myvariable as numeric
##and the non-numeric values will be converted to NA.

dev.copy(png,file="plot1.png")
dev.off()
