# Exploratory Data Analysis (Coursera) - EXDATA-013
# Project 1

# By: Arpit Shah

# Initialize environment
if (!"dplyr" %in% installed.packages()) install.packages("dplyr")
library(dplyr)

# Set working directory - change variable workingdir to location of data file
olddir <- getwd()
workingdir <- "C:/Documents and Settings/ashah9/Desktop/Coursera/exdata/proj1"
setwd(workingdir)

# Read data and subset to pick data from 2007-02-01 and 2007-02-02
pwrconsump <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="NA")
pwrconsumpsub <- pwrconsump[pwrconsump$Date == "1/2/2007" | pwrconsump$Date == "2/2/2007",]

# Format fields to right type
pwrconsumpsub$DateTime <- strptime(paste(pwrconsumpsub$Date,pwrconsumpsub$Time),"%d/%m/%Y %H:%M:%S")
pwrconsumpsub$Date <- strptime(pwrconsumpsub$Date,"%d/%m/%Y")
pwrconsumpsub$Global_active_power <- as.numeric(pwrconsumpsub$Global_active_power)
pwrconsumpsub$Global_reactive_power <- as.numeric(pwrconsumpsub$Global_reactive_power)
pwrconsumpsub$Voltage <- as.numeric(pwrconsumpsub$Voltage)
pwrconsumpsub$Global_intensity <- as.numeric(pwrconsumpsub$Global_intensity)
pwrconsumpsub$Sub_metering_1 <- as.numeric(pwrconsumpsub$Sub_metering_1)
pwrconsumpsub$Sub_metering_2 <- as.numeric(pwrconsumpsub$Sub_metering_2)
pwrconsumpsub$Sub_metering_3 <- as.numeric(pwrconsumpsub$Sub_metering_3)

# Open PNG device to write plot
png(file="plot3.png")

# Create plot
with(pwrconsumpsub, plot(DateTime, Sub_metering_1,
                         type = "n", xlab="", ylab="Energy sub metering"))
with(pwrconsumpsub, lines(DateTime, Sub_metering_1, col="black"))
with(pwrconsumpsub, lines(DateTime, Sub_metering_2, col="red"))
with(pwrconsumpsub, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Close PNG device
dev.off()

# Reset working directory
setwd(olddir)