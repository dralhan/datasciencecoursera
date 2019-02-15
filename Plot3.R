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

# Create column DateTime with class date
dat$DateTime <- paste(dat$Date, dat$Time, sep = ' ')
dat$DateTime <- strptime(dat$DateTime, format = '%Y-%m-%d %H:%M:%S')

#  graph and plot.
png('plot3.png', width = 480, height = 480)
png('plot3.png', width = 480, height = 480)
plot(x = dat$DateTime, y = dat$Sub_metering_1, type = 'l', ylab = 'Energy sub metering', col = 'black', xlab = '')

lines(x = dat$DateTime,  y = dat$Sub_metering_2, col='red')

lines(x = dat$DateTime,  y = dat$Sub_metering_3, col='blue')

legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty = 1, lwd = 2, col = c('black', 'red', 'blue'))

# close device cursor
dev.off() 