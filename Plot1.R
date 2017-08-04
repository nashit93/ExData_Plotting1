setwd("/Users/Allu/Downloads/")
df_raw <- read.table("household_power_consumption.txt",sep = ";",header=T)
df_raw$Date <- as.Date(df_raw$Date, format="%d/%m/%Y")
df <- df_raw[(df_raw$Date=="2007-02-01") | (df_raw$Date=="2007-02-02"),]


#Plot 1
png(filename="plot1.png",width = 480,height = 480)
hist(as.numeric(df$Global_active_power),col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")
dev.off()
