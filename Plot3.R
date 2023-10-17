# Assignment: Exploratory Data Analysis_Course Project_1
# author: Willian Miranda
# date: 15/10/2023
# Individual household electric power consumption Data Set


# Loading the data
path <- "C:\\Users\\willi\\OneDrive\\Área de Trabalho\\Coursera\\Hopkins - EDA R\\w1\\exdata_data_household_power_consumption\\"


# Filtering only the dates required
library(data.table)
base <- fread(paste0(path, "household_power_consumption.txt"))
base_1 <- base[Date %in% c('1/2/2007', '2/2/2007'),]
table(base_1$Date)
base_1[, Date := as.Date(Date, format = "%d/%m/%Y")]
head(base_1)

# Creating a variable date-time
as.POSIXlt(base_1$Time, format = "%H:%M:%S")
base_1[, date_time := paste(Date, Time)]
Sys.setlocale("LC_TIME", "en_US") #setting the plot language to English



# Plot3
par(las = 1)
plot(x = strptime(base_1$date_time, "%Y-%m-%d %H:%M:%S"), y = base_1$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(x =strptime(base_1$date_time, "%Y-%m-%d %H:%M:%S"), y = base_1$Sub_metering_2, col = "red")
lines(x =strptime(base_1$date_time, "%Y-%m-%d %H:%M:%S"), y = base_1$Sub_metering_3, col = "blue",
      xlab = "teste", ylab = "teste2")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), pch = "-")

dev.copy(png, "plot3.png")
dev.off()
