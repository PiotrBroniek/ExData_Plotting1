library(dplyr)
setwd("C:/Users/Piotr/Documents/R/Coursera/Exploratory Analysis")
## reading file 
read.table("household_power_consumption.txt",header = TRUE, sep = ";")->tabelka

## change of date format and filtering 
tabelka<-tabelka %>% mutate(Date = as.Date(tabelka$Date,"%d/%m/%Y")) %>% 
  filter(Date >="2007-02-01",Date <= "2007-02-02")

### creating png and plot
png(filename = "plot4.png")
par(mfcol = c(2,2))
par(mar = c(3,4,3,2))
with(tabelka,plot(DateTime,as.numeric(Global_active_power)/1000, type = "l", ylab = "Global Active Power"))
with(tabelka,plot(DateTime,Sub_metering_1, type = "l", ylab = "Energy sub metering"))
with(tabelka,lines(DateTime,Sub_metering_2, type = "l", col = "red"))
with(tabelka,lines(DateTime,Sub_metering_3, type = "l", col = "blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n",
       lty = c(1,1,1), col = c("black", "red","blue"), cex = .7 )
with(tabelka, plot(DateTime, Voltage, type = "l", ylab = "Voltage"))
with(tabelka, plot(DateTime, Global_reactive_power,type = "l"))
dev.off()
##
