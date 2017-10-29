library(dplyr)
setwd("C:/Users/Piotr/Documents/R/Coursera/Exploratory Analysis")
## reading file 
read.table("household_power_consumption.txt",header = TRUE, sep = ";",na.strings="?")->tabelka
class(tabelka$Global_active_power)
head(tabelka)
## change of date format and filtering 
tabelka2<-tabelka %>% mutate(Date = as.Date(tabelka$Date,"%d/%m/%Y")) %>% 
  filter(Date >="2007-02-01",Date <= "2007-02-02")
View(tabelka2)
### creating png and plot
png(filename = "plot1.png")
hist(tabelka2$Global_active_power, main = "Global Active Power", 
     col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()

###