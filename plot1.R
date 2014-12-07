eleurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("household_power_consumption.txt")){download.file(stormurl,"exdata-data-household_power_consumption.zip")}
unzip("exdata-data-household_power_consumption.zip")
ele1 <- read.table("household_power_consumption.txt",sep = ";",nrows = 1, header= TRUE)
ele <- read.table("household_power_consumption.txt",sep = ";",nrows = 2880,skip = 66637, col.names =colnames(ele1),na.strings = "?",stringsAsFactors=FALSE)
Sys.setlocale(category = "LC_ALL", locale = "English_United States.1252")
ele$Time<-strptime(paste(ele$Date,ele$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

windows()
with(ele,hist(Global_active_power,col = "red",main = "Global active power",xlab = "Global active power (killowatts)"))
dev.copy(png, file = "plot1.png", width = 480,height = 480)
dev.off()