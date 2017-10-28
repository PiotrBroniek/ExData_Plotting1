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
png(filename = "plot2.png")
with(tabelka,plot(DateTime,as.numeric(Global_active_power)/1000, type = "l", xlab = NULL,
    ylab = "Global Active Power (kilowatts)"))
dev.off()

###
