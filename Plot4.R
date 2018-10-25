## Reading the data
all_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
## subseting data needed to make the plots
Subset_4 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
Subset_4$Date <- as.Date(Subset_4$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(Subset_4$Date), Subset_4$Time)
Subset_4$Datetime <- as.POSIXct(datetime)

## combining plots
par(mfrow=c(2,2))
with(Subset_4, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")    
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.7)
  plot(Global_reactive_power~Datetime, type="l", 
        ylab="Global Rective Power",xlab="datetime")
})
## Saving plots in a png file 
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()