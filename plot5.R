library(dplyr)
setwd("C:/Users/Piotr/Documents/R/Coursera/Exploratory Analysis/project")
#### Reading files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
### subsetting data to Baltimore
baltimore_road<-subset(NEI, fips == "24510"& type == "ON-ROAD")
with(baltimore_road, tapply(Emissions,year, sum, na.rm = TRUE))->t1
data.frame(year = names(t1),value = t1)->df1

### open png, plot, close png
png(filename = "plot5.png")
par(mar = c(6,5,6,3))
plot(df1$year,df1$value, type = "l", ylab = expression('Total PM'[2.5]*" Emissions"), 
     xlab = "Years", main = expression('Total PM'[2.5]*" Emission in Baltimore from motor 1999-2008"))
dev.off()
###