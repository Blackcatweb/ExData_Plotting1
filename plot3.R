library("data.table")

#Reads in data from file then subsets data for specified dates
Data1 <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?")

# Making a POSIXct date to filter and graph by time of the day
Data1[, Datetime := as.POSIXct(paste(Date, Time), 
                                 format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
Data1 <- Data1[(Datetime >= "2007-02-01") & (Datetime < "2007-02-03")]

png("plot3.png", width=480, height=480)

## Plot 3
with(Data1, {
    plot(Datetime, Sub_metering_1, type="l", 
         xlab="", ylab="Energy sub metering")
    lines(Datetime, Sub_metering_2,col="red")
    lines(Datetime, Sub_metering_3,col="blue")    
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()


