# remember to set working directory and copy data into working directory

# read in the data
mydata = read.table("household_power_consumption.txt", header = TRUE, sep=";",na.strings="?")

# convert the date to a date object
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")

# combine the date and the time and convert it from character to POSIXlt object
mydata$dateTime <- paste(mydata$Date," ", mydata$Time)
mydata$dateTime <- strptime(mydata$dateTime, format="%Y-%m-%d %H:%M:%S")

# subset to the time of interest Feb 1 and 2, 2007
mydata <- mydata[mydata$Date %in% as.Date(c("2007-02-01","2007-02-02")),]

# make a histogram of the global active power to the default graphics device
with(mydata, hist(Global_active_power, col="red", xlab = "Global Active Power (kilowatts)",main="Global Active Power"))

# copy the graphic to a png file
dev.copy(png, filename="plot1.png",width = 480, height = 480, units = "px")
dev.off()
