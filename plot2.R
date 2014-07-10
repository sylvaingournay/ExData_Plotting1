## Class for the creation of plot1.png

## Imports
# File for data loading
source("dataLoader.R")

## Plots "Global Active Power" per time of day
exportPlot2Png <- function(data) {
    # Sys.setlocale("LC_TIME","en_US.UTF-8")

    png(filename="plot2.png", width=480, height=480, units="px")
    plot(
        strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S"),
        data$Global_active_power,
        type="l",
        xlab="",
        ylab="Global Active Power (kilowatts)"
    )
    dev.off()
}

exportPlot2Png(loadData())
