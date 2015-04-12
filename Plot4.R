## Making plots
## Our overall goal here is simply to examine how household energy usage varies 
## over a 2-day period in February, 2007. The task is to reconstruct the plots, 
## all of which were constructed using the base plotting system.
## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

## Dowload data file in working folder and unzip it
## Delete zip file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "household_power_consumption.zip", method = "curl")
unzip("household_power_consumption.zip")
unlink("household_power_consumption.zip")

## ----Read data----
datafileloc <- "household_power_consumption.txt"
## Read only 2-days of data and replace "?" with NAs
DT <- fread(datafileloc, sep=";", skip = "1/2/2007", nrows=2880, header=FALSE, na.strings="?")
## Set column names
setnames(DT, unlist(fread(datafileloc, sep=";", nrows=1, header=FALSE, na.strings="?"), use.names = FALSE))

## ----Plot chart----
## Open graphics devices - png file
png(filename = "Plot4.png", width = 480, height = 480, units = "px")
## Set chart background transparent and set 4 charts areas
par(mfrow = c(2, 2), bg = "transparent")
## Plot chart
plot(strptime(paste(DT$Date, DT$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), DT$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = NA)
plot(strptime(paste(DT$Date, DT$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), DT$Voltage, type = "l", ylab = "Voltage", xlab = "daytime")
plot(strptime(paste(DT$Date, DT$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), DT$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = NA)
lines(strptime(paste(DT$Date, DT$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), DT$Sub_metering_2, type = "l", col = "red")
lines(strptime(paste(DT$Date, DT$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), DT$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, bty = "n", col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(strptime(paste(DT$Date, DT$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), DT$Global_reactive_power, type = "l", xlab = "daytime", ylab = "Global_reactive_power")
## Close graphics devices
dev.off()

## Delete data file
unlink(datafileloc)