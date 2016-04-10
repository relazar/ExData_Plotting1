###############################Upload data##################################

## Set the working directory to the folder where the data set is located
setwd("C:/Users/relazar/Documents/Personal/CourSera/Data Science/04 - Exploratory Data Analysis/Week1/Assignment1")
filepath <- paste(getwd(), "/", "household_power_consumption.txt", sep="")

## Load the data into R
fulldata <- read.table(filepath, sep=";", stringsAsFactors=FALSE, header=TRUE)

## Convert the date to the proper format
fulldata$Date <- as.Date(fulldata$Date , format = "%d/%m/%Y")

## Only take data between the dates 01/02/2007 - 02/02/2007
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


################################## Plot 3###########################################

## Plot first set of data - sub-metering 1
plot(electric$DateTime,electric$Sub_metering_1,type="l", col = "black",ylab="Energy sub metering",xlab="")

## Add extra lines
# sub metering 2 in red
lines(electric$DateTime,electric$Sub_metering_2,type="l", col = "red")
# sub metering 3 in red
lines(electric$DateTime,electric$Sub_metering_3,type="l", col = "blue")

## Now add legend on the top right hand corner
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## copy to a png file
dev.copy(png, file = "plot3.png")
dev.off()
