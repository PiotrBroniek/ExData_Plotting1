library(dplyr)
setwd("C:/Users/Piotr/Documents/R/Coursera/Exploratory Analysis")
## reading file 
  read.table("household_power_consumption.txt",header = TRUE, sep = ";")->tabelka

## change of date format and filtering
  tabelka<-tabelka %>% mutate(Date = as.Date(tabelka$Date,"%d/%m/%Y")) %>% 
  filter(Date >="2007-02-01",Date <= "2007-02-02")
## change of Date time to as.Poxit 
  tabelka<-tabelka %>% mutate(DateTime = as.POSIXct(paste(tabelka$Date, tabelka$Time), 
                                                  format="%Y-%m-%d %H:%M:%S"))
### creating png and plot  

  png(filename = "plot3.png")
  with(tabelka,plot(DateTime,Sub_metering_1, type = "l", ylab = "Energy sub metering"))
  with(tabelka,lines(DateTime,Sub_metering_2, type = "l", col = "red"))
  with(tabelka,lines(DateTime,Sub_metering_3, type = "l", col = "blue"))
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = c(1,1,1), col = c("black", "red","blue"))
  dev.off()
  