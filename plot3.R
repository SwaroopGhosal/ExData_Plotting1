## The data file was fetched and I have separated out only the
## relevant data into a file called subsetData.txt.
## This subset data has all the records from beginning of 
## 01-02-2007 to end of 02-02-2007.

## Read the data
elecData <- read.table("household_power_consumption/subsetData.txt", 
                       comment.char = "", sep = ";", header = TRUE)

## Third plot is a line plot of the three sub-metering data against the 
## time stamp (date + time) 

## First let's get the timestamp converted and separated out

timestamp <- strptime(paste(elecData$Date, elecData$Time, sep = " "), 
                      "%d/%m/%Y %H:%M:%S")

## Build the png device
png("plot3.png", width = 480, height = 480)

## Build up the plot, one set of points at a time, using the type = "l" for 
## line plot
plot(timestamp, elecData$Sub_metering_1, type = "n", xlab = "",
     ylab = "Energy sub metering")

with(elecData, points(timestamp, Sub_metering_1, type = "l", lty = 1, col="black"))
with(elecData, points(timestamp, Sub_metering_2, type = "l", lty = 1, col="red"))
with(elecData, points(timestamp, Sub_metering_3, type = "l", lty = 1, col="blue"))

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()
