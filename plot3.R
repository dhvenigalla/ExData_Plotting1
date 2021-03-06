
## set the directory for location of the Household Power consumption dataset ;
setwd("C:/coursera/Prog_Assign")

## Read in the dataset
hp_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",  
                    stringsAsFactors=F, quote='' ) 

##format the date into date format
hp_data$Date <- as.Date(hp_data$Date,format="%d/%m/%Y")


## Subsetting the data 
data <- subset(hp_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 

head(data)
datetime <- paste(as.Date(data$Date), data$Time) 
data$Datetime <- as.POSIXct(datetime) 



png("plot3.png",width=480,height=480) 

plot(data$Datetime,data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="") 
lines(data$Datetime,data$Sub_metering_2, type="l", col="red") 
lines(data$Datetime,data$Sub_metering_3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off() 
