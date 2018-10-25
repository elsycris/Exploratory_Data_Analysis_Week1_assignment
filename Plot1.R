## Reading the data
all_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                       +             nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
## subseting data needed to make the plots
Subset_1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
Subset_1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
Subset_1
## Making plots
hist(Subset_1$Global_active_power, main="Global Active Power", 
            xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
## Saving plots in a png file 
dev.copy (png,"plot1.png",width=480, height=480)
dev.off()