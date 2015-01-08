## plot3.R

## Retrieving Data from Dataset
hhpower = read.table('household_power_consumption.txt', skip = grep("1/2/2007", readLines("household_power_consumption.txt")), nrows = 2879, sep = ";")

## Assigning Column Names
colnames(hhpower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Date and Time
hhpower$Date <- as.Date(hhpower$Date, "%d/%m/%Y")
dt <- as.POSIXct(paste(hhpower$Date, hhpower$Time), format="%Y-%m-%d %H:%M:%S")

## Creating plot3.png
png("plot3.png",  width = 480, height = 480, units = "px")
plot(dt, hhpower$Sub_metering_1, pch=NA_integer_, xlab="", ylab="Energy sub metering")
lines(dt, hhpower$Sub_metering_1, col="black")
lines(dt, hhpower$Sub_metering_2, col="red")
lines(dt, hhpower$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1,1), col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
