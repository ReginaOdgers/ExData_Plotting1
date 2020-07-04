#R script for plot 1: Global Active Power Histogram

#Reading the .txt file with data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

#Subsetting the years of data that we want
data_subset <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#Converting date and time to Date/Time classes in R
data_subset$Date <- as.Date(data_subset$Date, "%d/%m/%Y")
data_subset$Time <- strptime(data_subset$Time, "%H/%M/%S")

#Plotting the histogram and saving it in a png file
png("plot1.png", width = 480, height = 480)

hist(as.numeric(data_subset$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frecuency")

dev.off()
