# plot1 url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

setwd('~/jhudscourse/EDA/')
# Read data
dat <- read.table('household_power_consumption.txt',
                  header = T, sep = ';', stringsAsFactors = F, 
                  colClasses = c(rep('character', 2), rep('numeric', 7)), na.strings = '?')

# reformat and subset the dates to 2 days
dat$Date <- as.Date(dat$Date, format = '%d/%m/%Y')

# Select dates 2007-02-01 and 2007-02-02
dat <- dat[dat$Date == '2007-02-01' | dat$Date == '2007-02-02', ]

#  graph and plot.
png('plot1.png', width = 480, height = 480)
hist(dat$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')

# close device cursor
dev.off() 