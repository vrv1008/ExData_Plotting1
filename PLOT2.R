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
gAC <- as.numeric(dt_subset$Global_active_power)
date_time <- strptime(paste(dt_subset$Date,dt_subset$Time,sep=" "), "%d/%m/%Y %H:%M:%S" )

png("PLOT2.PNG", w=480, h=480)
plot(date_time, gAC, xlab = "", ylab = "Global Active Power (Kilowatts)",type="l")
dev.off()
