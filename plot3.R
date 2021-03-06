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

#construct Plot3
with(consumption_filtered, {
     plot(x=Datetime, 
          y=Sub_metering_1,
          type="l",
          xlab="",
          ylab="Energy sub metering")
     lines(x=Datetime,
           y=Sub_metering_2,
           col="red")
     lines(x=Datetime,
           y=Sub_metering_3,
           col="blue")
     legend("topright", 
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
            col=c("black", "red", "blue"), 
            lty=1,
            lwd=2)
})



#Save as plot3.png
dev.copy(device=png, file="plot3.png", height=480, width=480)
dev.off()


