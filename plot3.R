# Plot 3

# Loading packages
library(data.table)
library(dplyr)

path = paste0(getwd(), "/", "Data/")

# Reads in data from txt file
powerdf <- fread(input = file.path(path, "household_power_consumption.txt"), 
                 na.strings="?")

# Subeting data for feb 1 and feb 2
powerdf <- powerdf %>% 
    mutate(datetime = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")) %>% 
    filter(datetime >= "2007-02-01" & datetime < "2007-02-03")

# Width of 480 pixels and a height of 480 pixels
png("plot3.png", width=480, height=480)

# Plot
plot(powerdf$datetime, powerdf$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(powerdf$datetime, powerdf$Sub_metering_2,col="red")
lines(powerdf$datetime, powerdf$Sub_metering_3,col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()