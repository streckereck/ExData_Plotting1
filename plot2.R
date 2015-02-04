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

# make an empty plot, then add a line plot of the global active power
with(mydata, plot(x = dateTime, y= Global_active_power,type="n",xlab="",ylab="Global active power (kilowatts)"))
with(mydata, lines(x=dateTime,y=Global_active_power))

# copy the graphic to a png file
dev.copy(png, filename="plot2.png",width = 480, height = 480, units = "px")
dev.off()
