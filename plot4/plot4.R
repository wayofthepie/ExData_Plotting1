
args <- commandArgs(trailingOnly = TRUE)

datasetPath <- args[1]

data <- read.table(datasetPath, header = TRUE, sep = ";", stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, "%d/%m/%Y")

actualData <- data[data$Date >= as.Date("2007-02-01"),]

actualData <- actualData[actualData$Date <= as.Date("2007-02-02"),]

actualData$DateTime <-strptime(paste(actualData$Date, actualData$Time), "%Y-%m-%d %H:%M:%S")

png("plot4.png")

par(mfrow = c(2,2))

#topleft
plot( y=as.numeric(actualData$Global_active_power)
    , x=actualData$DateTime
    , ylab="Global Active Power (kilowatt)"
    , xlab=""
    , type="l"
    , yaxt="n"
    , ylim=range(0,2,4,6,8)
    )

axis(2,cex.axis=1,at=c(0,2,4,6))

#topright
actualData$Voltage <- as.numeric(as.matrix(actualData$Voltage))

plot( y=as.numeric(actualData$Voltage)
    , x=actualData$DateTime
    , ylab="Voltage"
    , xlab="datetime"
    , type="l"
    , yaxt="n"
    )

axis(2,cex.axis=1)

#bottomleft
plot( y=as.numeric(actualData$Sub_metering_1)
    , x=actualData$DateTime
    , ylab="Energy sub metering"
    , ylim=range(0,10,20,30, 34)
    , xlab=""
    , type="l"
    )

lines( y=as.numeric(actualData$Sub_metering_2)
     , x=actualData$DateTime
     , col="red"
     )

lines( y=as.numeric(actualData$Sub_metering_3)
     , x=actualData$DateTime
     , col="blue"
     )

legend( "topright"
      , pch="_"
      , col=c("black","red","blue")
      , legend=c("Sub_metering_1" ,"Sub_metering_2","Sub_metering_3")
      )

#bottomright
plot( y=as.numeric(actualData$Global_reactive_power)
    , x=actualData$DateTime
    , ylab="Global_reactive_power"
    , xlab="datetime"
    , type="l"
    , yaxt="n"
    )

axis(2,cex.axis=1)

