
args <- commandArgs(trailingOnly = TRUE)

if(length(args) != 1) {
    stop("Please give the path to the dataset.")
}

datasetPath <- args[1]

data <- read.table(datasetPath, header = TRUE, sep = ";", stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, "%d/%m/%Y")

actualData <- data[data$Date >= as.Date("2007-02-01"),]

actualData <- actualData[actualData$Date <= as.Date("2007-02-02"),]

png(filename="plot1.png")

hist ( as.numeric(actualData$Global_active_power)
     , xlab = "Global Active Power (kilowatts)"
     , ylim =range(0,1200)
     , main = "Global Active Power"
     , col=c("red")
     )

