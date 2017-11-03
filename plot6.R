library(dplyr)
setwd("C:/Users/Piotr/Documents/R/Coursera/Exploratory Analysis/project")
#### Reading files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
### subsetting data to Baltimore
road<-subset(NEI, (fips == "24510" | fips == "06037") & type == "ON-ROAD") 
with(road, tapply(Emissions,list(fips,year), sum, na.rm = TRUE))->t1
View(t1)

### preparing t1 to data frame  
t1[1:2,]->c1
rep(colnames(t1),each = 2)->c2
rep(c("LA County", "Baltimore"),times = 4)->c3
df2<-data.frame(cbind(as.numeric(c1),c2,c3), stringsAsFactors = FALSE)
colnames(df2)<-c("Emissions", "Year", "City")
df2$Emissions<-as.numeric(df2$Emissions)
df2$City<-as.factor(df2$City)

### open png, ggplot, close png
png(filename = "plot6.png")
par(mar = c(6,2,6,2))
ggplot(df2, aes(Year, Emissions))+geom_point(aes(color = City), size = 3)+
  facet_grid(.~City)+ylab(expression('Total PM'[2.5]*" Emission"))+
  ggtitle(expression('Total PM'[2.5]*" Emission in Baltimore and LA 1999-2008"))
dev.off() 
