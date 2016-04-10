###############################Upload data##################################

## Set the working directory to the folder where the data set is located
setwd("C:/Users/relazar/Documents/Personal/CourSera/Data Science/04 - Exploratory Data Analysis/Week1/Assignment1")
filepath <- paste(getwd(), "/", "household_power_consumption.txt", sep="")

## Load the data into R
fulldata <- read.table(filepath, sep=";", stringsAsFactors=FALSE, header=TRUE)

## Convert the date to the proper format
fulldata$Date <- as.Date(fulldata$Date , format = "%d/%m/%Y")

## Only take data between the dates 01/02/2007 - 03/02/2007
electric <- fulldata[fulldata$Date >= "2007-02-01" & fulldata$Date <= "2007-02-02",]

## Create a new field combining the date and time called "DateTime
electric$DateTime<-strptime(paste(electric$Date,electric$Time, sep=" "),format="%Y-%m-%d %H:%M:%S")

## Convert all fields that should be numeric to numeric
electric$Global_active_power <- as.numeric(electric$Global_active_power)
electric$Global_reactive_power <- as.numeric(electric$Global_reactive_power)
electric$Voltage <- as.numeric(electric$Voltage)
electric$Global_intensity <- as.numeric(electric$Global_intensity)
electric$Sub_metering_1 <- as.numeric(electric$Sub_metering_1)
electric$Sub_metering_2 <- as.numeric(electric$Sub_metering_2)
electric$Sub_metering_3 <- as.numeric(electric$Sub_metering_3)

################################## Plot 1###########################################

## Plot Histogram

hist(electric$Global_active_power, col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")

## copy to a png file
dev.copy(png, file = "plot1.png")
dev.off()
