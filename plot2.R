
## set the directory for location of the Household Power consumption dataset ;
setwd("C:/coursera/Prog_Assign")

## Read in the dataset
hp_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",  
         stringsAsFactors=F, quote='' ) 

##format the date into date format
hp_data$Date <- as.Date(hp_data$Date,format="%d/%m/%Y")


## Subsetting the data 
 data <- subset(hp_data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
 
 datetime <- paste(as.Date(data$Date), data$Time) 
 data$Datetime <- as.POSIXct(datetime) 
 

 
 png("plot2.png",width=480,height=480) 
 
 plot(data$Datetime,data$Global_active_power, type="l",lwd=1, ylab="Global Active Power (kilowatts)", xlab="") 
 
 dev.off() 
 
