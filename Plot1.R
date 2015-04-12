## Making plots
## Our overall goal here is simply to examine how household energy usage varies 
## over a 2-day period in February, 2007. The task is to reconstruct the plots, 
## all of which were constructed using the base plotting system.
## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

library(data.table)

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
png(filename = "Plot1.png", width = 480, height = 480, units = "px")
## Set chart background transparent
par(bg = "transparent")
## Plot chart
hist(DT$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
## Close graphics devices
dev.off()

## Delete data file
unlink(datafileloc)