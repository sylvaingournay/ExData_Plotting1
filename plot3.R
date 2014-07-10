## Class for the creation of plot3.png

## Imports
# File for data loading
source("dataLoader.R")

## Plots "Energy submetering" per time of day
exportPlot3Png <- function(data) {

    png(filename="plot3.png", width=480, height=480, units="px")

    plot(
        strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
        , data$Sub_metering_1
        , col="black"
        , type="l"
        , xlab=""
        , ylab="Global Active Power (kilowatts)"
    )

    lines(
        strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
        , data$Sub_metering_2
        , col="red"
    )
    
    lines(
        strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
        , data$Sub_metering_3
        , col="blue"
    )
    
    legend(
        "topright"
        , lty="solid"
        , col=c("black", "red", "blue")
        , legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    )
    
    dev.off()
}

exportPlot3Png(loadData())
