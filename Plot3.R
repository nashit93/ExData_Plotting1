setwd("/Users/Allu/Downloads/")
df_raw <- read.table("household_power_consumption.txt",sep = ";",header=T)
df_raw$Date <- as.Date(df_raw$Date, format="%d/%m/%Y")
df <- df_raw[(df_raw$Date=="2007-02-01") | (df_raw$Date=="2007-02-02"),]
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")


#plot 3
png(filename="plot3.png",width = 480,height = 480)
plot(df$timestamp,df$Sub_metering_1,type="l",ylab = "Enery Sub Metering",col="black")
lines(df$timestamp,df$Sub_metering_2,type = "l",col="red")
lines(df$timestamp,df$Sub_metering_3,type = "l",col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

dev.off()
