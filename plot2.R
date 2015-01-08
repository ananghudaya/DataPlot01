## plot2.R

## Retrieving Data from Dataset
hhpower = read.table('household_power_consumption.txt', skip = grep("1/2/2007", readLines("household_power_consumption.txt")), nrows = 2879, sep = ";")

## Assigning Column Names
colnames(hhpower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Date and Time
hhpower$Date <- as.Date(hhpower$Date, "%d/%m/%Y")
dt <- as.POSIXct(paste(hhpower$Date, hhpower$Time), format="%Y-%m-%d %H:%M:%S")

## Creating plot2.png
png("plot2.png",  width = 480, height = 480, units = "px")
plot(dt, hhpower$Global_active_power, pch=NA_integer_, xlab="", ylab="Global Active Power (kilowatts)")
lines(dt, hhpower$Global_active_power)
dev.off()
