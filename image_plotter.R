setwd("/Users/Allu/Downloads/")
df_raw <- read.table("household_power_consumption.txt",sep = ";",header=T)
df_raw$Date <- as.Date(df_raw$Date, format="%d/%m/%Y")
df <- df_raw[(df_raw$Date=="2007-02-01") | (df_raw$Date=="2007-02-02"),]


#Plot 1
png(filename="plot1.png",width = 480,height = 480)
hist(as.numeric(df$Global_active_power),col = "red", main = paste("Global Active Power"), xlab = "Global Active Power (kilowatts)")
dev.off()


#Plot 2 
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
png(filename="plot2.png",width = 480,height = 480)
dev.off()


#plot 3

plot(df$timestamp,df$Sub_metering_1,type="l",ylab = "Enery Sub Metering",col="black")
lines(df$timestamp,df$Sub_metering_2,type = "l",col="red")
lines(df$timestamp,df$Sub_metering_3,type = "l",col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
png(filename="plot3.png",width = 480,height = 480)
dev.off()


# plot 4

par(mfrow=c(2,2))

#plot 1
plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#plot 2
plot(df$timestamp,df$Voltage, type="l", xlab="datetime", ylab="Voltage")

#plot 3
plot(df$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df$timestamp,df$Sub_metering_2,col="red")
lines(df$timestamp,df$Sub_metering_3,col="blue")
//legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
plot(df$timestamp,df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

png(filename="plot4.png",width = 480,height = 480)
dev.off()

