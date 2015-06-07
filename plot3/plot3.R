
args <- commandArgs(trailingOnly = TRUE)

if(length(args) != 1) {
    stop("Please give the path to the dataset.")
}

datasetPath <- args[1]

data <- read.table(datasetPath, header = TRUE, sep = ";", stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, "%d/%m/%Y")

actualData <- data[data$Date >= as.Date("2007-02-01"),]

actualData <- actualData[actualData$Date <= as.Date("2007-02-02"),]


actualData$DateTime <- strptime(paste(actualData$Date, actualData$Time), "%Y-%m-%d %H:%M:%S")

png("plot3.png")

plot( y=as.numeric(actualData$Sub_metering_1)
    , x=actualData$DateTime
    , ylab="Energy sub metering"
    , ylim=range(0,10,20,30,38)
    , xlab=""
    , type="l"
    , yaxt="n"
    )

axis(2,cex.axis=1,at=c(0,10,20,30))


lines( y=as.numeric(actualData$Sub_metering_2)
     , x=actualData$DateTime
     , col="red"
     )

lines( y=as.numeric(actualData$Sub_metering_3)
     , x=actualData$DateTime
     , col="blue")

legend( "topright"
      , pch="_"
      , col=c("black","red","blue")
      , legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


