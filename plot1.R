setwd("C:/Users/cdebaere/Desktop/Coursera/Course4/Week1/Course_project")

# Read in training and test set
consumption <- read.table(file = "./exdata-data-household_power_consumption/household_power_consumption.txt", 
                                sep=";", header=T, na.strings = "?", stringsAsFactors = FALSE)

#only use data from 2007-02-01 to 2007-02-02
consumption$Date <- as.Date(consumption$Date, format="%d/%m/%Y")
consumption_filtered <- subset(consumption, Date >= "2007-02-01" & Date <= "2007-02-02")


#construct Plot1
hist(consumption_filtered$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     col="Red")

#Save as plot1.png
dev.copy(device=png, file="plot1.png", height=480, width=480)
dev.off()
