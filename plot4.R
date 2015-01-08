## plot4.R

## Retrieving Data from Dataset
hhpower = read.table('household_power_consumption.txt', skip = grep("1/2/2007", readLines("household_power_consumption.txt")), nrows = 2879, sep = ";")

## Assigning Column Names
colnames(hhpower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Date and Time
hhpower$Date <- as.Date(hhpower$Date, "%d/%m/%Y")
dt <- as.POSIXct(paste(hhpower$Date, hhpower$Time), format="%Y-%m-%d %H:%M:%S")

## Creating plot4.png
png("plot4.png",  width = 480, height = 480, units = "px")
par(mfrow = c(2, 2), mai=c(0.9, 0.9, 0.9, 0.9))
plot(dt, hhpower$Global_active_power, pch=NA_integer_, xlab="", ylab="Global Active Power (kilowatts)")
lines(dt, hhpower$Global_active_power)
plot(dt, hhpower$Voltage, pch=NA_integer_, xlab="datetime", ylab="Voltage")
lines(dt, hhpower$Voltage)
plot(dt, hhpower$Sub_metering_1, pch=NA_integer_, xlab="", ylab="Energy sub metering")
lines(dt, hhpower$Sub_metering_1, col="black")
lines(dt, hhpower$Sub_metering_2, col="red")
lines(dt, hhpower$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1,1), bty = "n", col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(dt, hhpower$Global_reactive_power, pch=NA_integer_, xlab="datetime", ylab="Global Reactive Power")
lines(dt, hhpower$Global_reactive_power)
dev.off()

