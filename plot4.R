## Class for the creation of plot3.png

## Imports
# File for data loading
source("dataLoader.R")

## Plots "Energy submetering" per time of day
exportPlot4Png <- function(data) {
    png(filename="plot4.png", width=480, height=480, units="px")
    par(mfrow=c(2,2))

    my_plot2(data)
    my_toprightPlot(data)
    my_plot3(data)
    my_bottomrightPlot(data)

    dev.off()
}

my_plot2 <- function(data) {
    plot(
        strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
        , data$Global_active_power
        , type="l"
        , xlab=""
        , ylab="Global Active Power"
    )
}

my_plot3 <- function(data) {
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
        "topright",
        , bty="n"
        , lty="solid"
        , col=c("black", "red", "blue")
        , legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    )
}

my_toprightPlot <- function(data) {
    plot(
        strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
        , data$Voltage
        , type="l"
        , xlab="datetime"
        , ylab="Voltage"
    )
}

my_bottomrightPlot <- function(data) {
    plot(
        strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
        , data$Global_reactive_power
        , type="l"
        , xlab="datetime"
        #, ylab="Global Active Power (kilowatts)"
    )
}


exportPlot4Png(loadData())
