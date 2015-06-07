
args <- commandArgs(trailingOnly = TRUE)

if(length(args) != 1) {
    stop("Please give the path to the dataset.")
}

datasetPath <- args[1]

data <- read.table(datasetPath, header = TRUE, sep = ";", stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, "%d/%m/%Y")

actualData <- data[data$Date >= as.Date("2007-02-01"),]

actualData <- actualData[actualData$Date <= as.Date("2007-02-02"),]

actualData$DateTime <-strptime(paste(actualData$Date, actualData$Time), "%Y-%m-%d %H:%M:%S")

png("plot2.png")

plot ( y=as.numeric(actualData$Global_active_power)
     , x=actualData$DateTime
     , ylab="Global Active Power (kilowatt)"
     , xlab=""
     , type="l"
     , yaxt="n"
     , ylim=range(0,2,4,6,8)
     )

axis(2,cex.axis=1,at=c(0,2,4,6))


