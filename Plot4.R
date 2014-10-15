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
par(mfrow=c(2, 2))
par(mar=c(1,1,1,1))
plot(pwrconsump$DateTime, pwrconsump$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power")
plot(pwrconsump$DateTime, pwrconsump$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")
plot(pwrconsump$DateTime, pwrconsump$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")
lines(pwrconsump$DateTime, pwrconsump$Sub_metering_2, col="red")
lines(pwrconsump$DateTime, pwrconsump$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1:20,cex=0.4)
plot(pwrconsump$DateTime, pwrconsump$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_Power")
dev.off()



