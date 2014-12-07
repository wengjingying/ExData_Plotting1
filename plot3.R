eleurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("household_power_consumption.txt")){download.file(stormurl,"exdata-data-household_power_consumption.zip")}
unzip("exdata-data-household_power_consumption.zip")
ele1 <- read.table("household_power_consumption.txt",sep = ";",nrows = 1, header= TRUE)
ele <- read.table("household_power_consumption.txt",sep = ";",nrows = 2880,skip = 66637, col.names =colnames(ele1),na.strings = "?",stringsAsFactors=FALSE)
Sys.setlocale(category = "LC_ALL", locale = "English_United States.1252")
ele$Time<-strptime(paste(ele$Date,ele$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

windows()
plot(ele$Time,ele$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(ele$Time,ele$Sub_metering_2,col="red")
lines(ele$Time,ele$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.copy(png, file = "plot3.png", width = 480,height = 480)
dev.off()