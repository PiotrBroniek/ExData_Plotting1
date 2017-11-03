library(dplyr)
setwd("C:/Users/Piotr/Documents/R/Coursera/Exploratory Analysis/project")
#### Reading files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
#### applying sum to Emission by year
with(NEI, tapply(Emissions,year, sum, na.rm = TRUE))->pollyear
data.frame(year = names(pollyear),value = pollyear)->df
### open png, plot, close png
png(filename = "Plot1.png")
plot(df$year,df$value/1000000, type = "l", ylab = expression('Total PM'[2.5]*" Emissions in MT"), 
     xlab = "Years", main = expression('Total PM'[2.5]*" Emission in US 1999-2008"))
dev.off()
