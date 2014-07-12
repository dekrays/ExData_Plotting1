library(sqldf)

colClasses <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
sqlStatement <- "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'"
df <- read.csv2.sql("household_power_consumption.txt", sqlStatement, colClasses = colClasses)

png("plot1.png", 480, 480)

hist(df$Global_active_power, col = "red", main= "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()