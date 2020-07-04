#R script for plot 1: Global Active Power Histogram

#Reading the .txt file with data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#Subsetting the years of data that we want
data_subset <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#Converting date and time to Date/Time classes in R
data_subset$Date <- as.Date(data_subset$Date, format="%d/%m/%Y")
data_subset$Time <- strptime(data_subset$Time, format="%H:%M:%S")

data_subset[1:1440, "Time"] <- format(data_subset[1:1440, "Time"], "2007-02-01 %H:%M:%S")
data_subset[1441:2880, "Time"] <- format(data_subset[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

#Plotting the graph and saving it in a png file
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
with(data_subset, {
        plot(data_subset$Time, as.numeric(data_subset$Global_active_power), xlab = "", ylab = "Global Active Power", type = "n")
        lines(data_subset$Time, as.numeric(data_subset$Global_active_power))
        plot(data_subset$Time, as.numeric(data_subset$Voltage), xlab = "datetime", ylab = "Voltage", type = "n")
        lines(data_subset$Time, as.numeric(data_subset$Voltage))
        plot(data_subset$Time,data_subset$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
         with(data_subset,lines(Time,as.numeric(Sub_metering_1)))
         with(data_subset,lines(Time,as.numeric(Sub_metering_2),col="red"))
         with(data_subset,lines(Time,as.numeric(Sub_metering_3),col="blue"))
         legend("topright", col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, cex = 0.5)
        plot(data_subset$Time, as.numeric(data_subset$Global_reactive_power), xlab = "datetime", ylab = "Global_reactive_power", type = "n")
        lines(data_subset$Time, as.numeric(data_subset$Global_reactive_power))
})

dev.off()
