library("data.table")

#Reads in data from file then subsets data for specified dates
Data1 <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?")

# Making a POSIXct date to filter and graph by time of the day
Data1[, Datetime := as.POSIXct(paste(Date, Time), 
                                 format = "%d/%m/%Y %H:%M:%S")]

# Filter Dates for 2007-02-01 and 2007-02-02
Data1 <- Data1[(Datetime >= "2007-02-01") & (Datetime < "2007-02-03")]

png("plot2.png", width=480, height=480)

## Plot 2
plot(x=Data1[,Datetime], y=Data1[,Global_active_power], type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")

dev.off()


