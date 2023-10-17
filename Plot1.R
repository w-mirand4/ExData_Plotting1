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

# Making Plots

# Plot1
par(las = 1)
hist(x =as.numeric(base_1$Global_active_power), col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, "plot1.png")
dev.off()

