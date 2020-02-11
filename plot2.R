# Plot 2

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
png("plot2.png", width=480, height=480)

## plot
plot(x = powerdf$datetime, 
     y = powerdf$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()