# Plot 1

# Loading packages
library(data.table)
library(dplyr)

path = paste0(getwd(), "/", "Data/")

# Reads in data from txt file
powerdf <- fread(input = file.path(path, "household_power_consumption.txt"), 
                 na.strings="?")

# Subeting data for feb 1 and feb 2
powerdf <- powerdf %>% 
    mutate(Date = as.Date(Date, format = "%d/%m/%Y")) %>% 
    filter(Date >= "2007-02-01" & Date <= "2007-02-02")

# Width of 480 pixels and a height of 480 pixels
png("plot1.png", width=480, height=480)

# Histogram
hist(powerdf$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
