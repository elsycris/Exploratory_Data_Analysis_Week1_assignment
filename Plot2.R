## Reading the data
all_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                       +             nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
## subseting data needed to make the plots
Subset_2 <- subset(all_data, Date %in% c("1/2/2007","2/2/2007"))
Subset_2$Date <- as.Date(Subset_2$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(Subset_2$Date), Subset_2$Time)
Subset_2$Datetime <- as.POSIXct(datetime)
## Making plots
with(Subset_2, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
## Saving plots in a png file 
dev.copy (png,"plot2.png", width=480, height=480)
dev.off()