## The data file was fetched and I have separated out only the
## relevant data into a file called subsetData.txt.
## This subset data has all the records from beginning of 
## 01-02-2007 to end of 02-02-2007.

## Read the data
elecData <- read.table("household_power_consumption/subsetData.txt", 
                       comment.char = "", sep = ";", header = TRUE)

## First plot is a histogram of Global Active Power

hist(elecData$Global_active_power, 
     xlab = "Global Active Power (kilowatts",
     main = "Global Active Power",
     col = "red")
dev.copy(png, file = "plot1.png")
dev.off()