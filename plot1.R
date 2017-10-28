library(dplyr)
setwd("C:/Users/Piotr/Documents/R/Coursera/Exploratory Analysis")
## reading file 
read.table("household_power_consumption.txt",header = TRUE, sep = ";")->tabelka
head(tabelka)
## change of date format and filtering 
tabelka<-tabelka %>% mutate(Date = as.Date(tabelka$Date,"%d/%m/%Y")) %>% 
  filter(Date >="2007-02-01",Date <= "2007-02-02")

### creating png and plot
png(filename = "plot1.png")
hist(as.numeric(tabelka$Global_active_power)/1000, main = "Global Active Power", 
     col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()

###