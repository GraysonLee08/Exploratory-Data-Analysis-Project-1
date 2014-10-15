#################################################
#     Exploratory Data Analysis Project 1       #
#################################################

# Load Libraries 
library(datasets)

# Import Data, merge into one data frame and clean data
pwrconsumpRAW  <- read.csv(file.choose(), sep = ";", header = TRUE, na.string="?")
pwrconsump <- pwrconsumpRAW[(pwrconsumpRAW$Date=="1/2/2007" | pwrconsumpRAW$Date=="2/2/2007"),]
rm(pwrconsumpRAW)
pwrconsump$DateTime <- strptime(paste(pwrconsump$Date, pwrconsump$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

# Creates plot
png("plot1.png", width=480, height=480)
hist(pwrconsump$Global_active_power, main="Global Active Power", 
  xlab="Global Active Power (kilowatts)", col='red')
dev.off()
