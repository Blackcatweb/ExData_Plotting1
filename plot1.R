library("data.table")

#Reads in data from file then subsets data for specified dates
Data1 <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?")

# Change Date Column to Date Type
Data1[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates for 2007-02-01 and 2007-02-02
Data1 <- Data1[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Plot 1
hist(Data1[,Global_active_power],main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()


