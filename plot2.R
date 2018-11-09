## The data file was fetched and I have separated out only the
## relevant data into a file called subsetData.txt.
## This subset data has all the records from beginning of 
## 01-02-2007 to end of 02-02-2007.

## Read the data
elecData <- read.table("household_power_consumption/subsetData.txt", 
                       comment.char = "", sep = ";", header = TRUE)

## Second plot is a line plot of the global active power against the 
## time stamp (date + time) 

## First let's get the timestamp converted and separated out

timestamp <- strptime(paste(elecData$Date, elecData$Time, sep = " "), 
                      "%d/%m/%Y %H:%M:%S")

## Now we are ready to graph it

png("plot2.png", width = 480, height=480)
plot(timestamp, elecData$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()

