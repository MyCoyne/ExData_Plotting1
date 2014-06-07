##  My Coyne
##  June 6, 2014
##  Exploratory Data Analysis.  
##      Dataset contains the electric energy consumption
##  
## ------------------------------------------------------------------------
## Read in data with separator is ';'
## ------------------------------------------------------------------------
data <- read.delim("household_power_consumption.txt", header=TRUE, sep=";")
## ------------------------------------------------------------------------
## Getting date and time in character format
## ------------------------------------------------------------------------
xDate <- paste(data$Date, data$Time) ## class(xDate) is character
## ------------------------------------------------------------------------
## Conver the date and time in characters to object POSIXlt for ease of comparason
## ------------------------------------------------------------------------
yObj  <- strptime(xDate, "%d/%m/%Y %H:%M:%S") ## class(yObj) is POSIXlt and POSIXt
##  Logical rows for the start and end time of interest
start_datetime <- "2007-02-01 00:00:00"
end_datetime   <- "2007-02-02 23:59:59"
## Getting the rows of interest
l.rows <- (yObj >= as.POSIXlt(start_datetime)) & (y <= as.POSIXlt(end_datetime))
## myData now contains all rows within two days of interest
myData <- data [l.rows, ]
## Now ready for plotting
## ##################################
## Convert index into Days of the week
## ##################################
myData_xDate  <- paste(myData$Date, myData$Time) 
myData_yObj   <- strptime(myData_xDate, "%d/%m/%Y %H:%M:%S") 
plot  (myData_yObj, as.numeric (as.character(myData$Global_active_power))
       , type='l'
       , xlab=NA
       , ylab="Global Active Power (kilowatts)"
)