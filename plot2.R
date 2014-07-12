library(sqldf)

colClasses <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
sqlStatement <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
df <- read.csv2.sql("household_power_consumption.txt", sqlStatement, colClasses = colClasses)

df <- transform(df, DateTime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%OS"))

png("plot2.png", 480, 480)

with(df, plot(DateTime, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.off()