## Class for the creation of plot1.png

## Imports
# File for data loading
source("dataLoader.R")

## Plots an histogram (frequency of "Global Active Power") in plot1.png file.
exportPlot1Png <- function(data) {
    png(filename="plot1.png", width=480, height=480, units="px")
    hist(
        data$Global_active_power
        , main="Global Active Power"
        , xlab="Global Active Power (kilowatts)"
        , col="red"
    )
    dev.off()
}

exportPlot1Png(loadData())
