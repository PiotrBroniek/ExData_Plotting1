library(dplyr)
setwd("C:/Users/Piotr/Documents/R/Coursera/Exploratory Analysis/project")
#### Reading files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#### subsetting data to baltimore
baltimore<-subset(NEI, fips == "24510")
### applying sum to Emission by year
with(baltimore,tapply(Emissions,year,sum,na.rm = TRUE))->baltimore1
data.frame(year = names(baltimore1),value = baltimore1)->df1

### open png, plot, close png
png(filename = "Plot2.png")
plot(df1$year,df1$value/1000, type = "p",  ylab = expression('Total PM'[2.5]*" Emissions in TMT"), 
     xlab = "Years", main = expression('Total PM'[2.5]*" Emission in Baltimore 1999-2008"))
dev.off()
