library(dplyr)
setwd("C:/Users/Piotr/Documents/R/Coursera/Exploratory Analysis")
## reading file 
read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")->tabelka

## change of date format and filtering
tabelka2<-tabelka %>% mutate(Date = as.Date(tabelka$Date,"%d/%m/%Y")) %>% 
  filter(Date >="2007-02-01",Date <= "2007-02-02")
## change of Date time to as.Poxit 
tabelka2<-tabelka2 %>% mutate(DateTime = as.POSIXct(paste(tabelka2$Date, tabelka2$Time), 
                                                  format="%Y-%m-%d %H:%M:%S"))
### creating png and plot                             
png(filename = "plot2.png")
with(tabelka2,plot(DateTime,Global_active_power, type = "l", xlab = NULL,
    ylab = "Global Active Power (kilowatts)"))
dev.off()

###
