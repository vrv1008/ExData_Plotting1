###############################################################
# 1. Download data file using url
###############################################################

setwd("c:/Coursera/ExploratorydataAnalysis/week1/week1-project")
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile <- "c:/Coursera/ExploratorydataAnalysis/week1/week1-project/EPC.zip"
download.file(url,destfile)
unzip(zipfile = "c:/Coursera/ExploratorydataAnalysis/week1/week1-project/EPC.zip", exdir = ".")
dt <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

dt_subset <- dt[dt$Date %in% c("1/2/2007","2/2/2007"),]
date_time <- strptime(paste(dt_subset$Date,dt_subset$Time,sep=" "), "%d/%m/%Y %H:%M:%S" )
gAC <- as.numeric(dt_subset$Global_active_power)
gRC <- as.numeric(dt_subset$Global_reactive_ower)
submetering1 <- as.numeric(dt_subset$Sub_metering_1)
submetering2 <- as.numeric(dt_subset$Sub_metering_2)
submetering3 <- as.numeric(dt_subset$Sub_metering_3)
voltage <- as.numeric(dt_subset$Voltage)

png("PLOT4.PNG", w=480, h=480)
par(mfrow = c(2,2))

plot(date_time, gAC, ylab = "Global Active Power", xlab = "", type="l", col = "black")
plot(date_time, voltage, xlab = "datetime", ylab = "Voltage", col = "black", type = "l")
plot(date_time, submetering1, col = "blue", xlab = "", ylab = "Energy Sub Metering",type="l")
lines(date_time, submetering2, col = "red", type = "l")
lines(date_time, submetering3, col = "yellow", type = "l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, lty = 1, col=c("blue","red","yellow"))
plot(date_time, gRC, xlab="datetime", ylab = "Global_Reactive_Power", type = "l", col = "black")
dev.off()

