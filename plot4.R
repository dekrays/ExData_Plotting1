library(sqldf)

colClasses <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
sqlStatement <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
df <- read.csv2.sql("household_power_consumption.txt", sqlStatement, colClasses = colClasses)

df <- transform(df, DateTime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%OS"))

png("plot4.png", 480, 480)

par(mfrow = c(2, 2))

with(df, {
    plot(DateTime, Global_active_power, type="l", xlab = "", ylab = "Global Active Power")
    
    plot(DateTime, Voltage, type="l", xlab = "datetime", ylab = "Voltage")
    
    plot(DateTime, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering")
    lines(DateTime, Sub_metering_2, col="red")
    lines(DateTime, Sub_metering_3, col="blue")
    legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
    
    plot(DateTime, Global_reactive_power, type="l", xlab = "datetime")
})

dev.off()