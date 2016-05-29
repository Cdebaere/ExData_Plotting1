setwd("C:/Users/cdebaere/Desktop/Coursera/Course4/Week1/Course_project")

# Read in training and test set
consumption <- read.table(file = "./exdata-data-household_power_consumption/household_power_consumption.txt", 
                                sep=";", header=T, na.strings = "?", stringsAsFactors = FALSE)

#only use data from 2007-02-01 to 2007-02-02
consumption$Date <- as.Date(consumption$Date, format="%d/%m/%Y")
consumption_filtered <- subset(consumption, Date >= "2007-02-01" & Date <= "2007-02-02")

#Paste date and time
datetime <- paste(consumption_filtered$Date, consumption_filtered$Time)
consumption_filtered$Datetime <- strptime(datetime, format="%Y-%m-%d %H:%M:%S")

#construct Plot2
plot(x=consumption_filtered$Datetime,
     y=consumption_filtered$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

#Save as plot2.png
dev.copy(device=png, file="plot2.png", height=480, width=480)
dev.off()


