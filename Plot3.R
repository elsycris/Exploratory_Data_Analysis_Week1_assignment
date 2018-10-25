## Reading the data
all_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
            nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
## subseting data needed to make the plots
Subset_3 <- subset(all_data, Date %in% c("1/2/2007","2/2/2007"))
Subset_3$Date <- as.Date(Subset_3$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(Subset_3$Date), Subset_3$Time)
Subset_3$Datetime <- as.POSIXct(datetime)
## Making plots
with(Subset_3, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.7)
## Saving plots in a png file 
dev.copy(png,"plot3.png", height=480, width=480)
dev.off()