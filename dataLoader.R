## dataLoader:
## Returns the filtered dataset (between 2007-02-01 and 2007-02-02)
loadData <- function() {
    dateFormat <- "%d/%m/%Y"
    infLimit <- '2007-02-01'
    supLimit <- '2007-02-02'
    
    # data loading
    setClass("myDate")
    setAs("character","myDate", function(from) as.Date(from, format=dateFormat))
    data <- read.csv(
        file="household_power_consumption.txt"
        , sep=";"
        , na.strings="?"
        , colClasses=c("myDate", rep(NA, 8))
    )
    
    # data filtering
    data[data[, "Date"] >= infLimit & data[, "Date"] <= supLimit, ]
}
