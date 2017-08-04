setwd("/Users/Allu/Downloads/")
df_raw <- read.table("household_power_consumption.txt",sep = ";",header=T)
df_raw$Date <- as.Date(df_raw$Date, format="%d/%m/%Y")
df <- df_raw[(df_raw$Date=="2007-02-01") | (df_raw$Date=="2007-02-02"),]



#Plot 2 
png(filename="plot2.png",width = 480,height = 480)
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()

