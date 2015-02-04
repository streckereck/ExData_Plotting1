# set the working directory
setwd("~/coursera/exploratoryDataAnalysis/ExData_Plotting1")

#Download the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","temp.zip")

# unzip the file
unzip("temp.zip")

# read in the  data
mydata = read.table("household_power_consumption.txt", header = TRUE, sep=";",na.strings="?")

# convert the date to a date object
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")

# combine the date and the time and convert it from character to POSIXlt object
mydata$dateTime <- paste(mydata$Date," ", mydata$Time)
mydata$dateTime <- strptime(mydata$dateTime, format="%Y-%m-%d %H:%M:%S")

# subset to the time of interest Feb 1 and 2, 2007
mydata <- mydata[mydata$Date %in% as.Date(c("2007-02-01","2007-02-02")),]

# create a png graphic device
png(filename="plot3.png",width = 480, height = 480, units = "px")

# make an empty plot, then add the three Sub_metering_ variables
par(mfrow=c(1,1))

with(mydata, plot(x = dateTime, y= Sub_metering_1,type="n",ylab="Energy sub metering",xlab=""))
with(mydata, lines(x=dateTime,y=Sub_metering_1,col="black"))
with(mydata, lines(x=dateTime,y=Sub_metering_2,col="red"))
with(mydata, lines(x=dateTime,y=Sub_metering_3,col="blue"))
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1)


# close the graphics device
dev.off()
