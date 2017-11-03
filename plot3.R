library(dplyr)
setwd("C:/Users/Piotr/Documents/R/Coursera/Exploratory Analysis/project")
#### Reading files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### subsetting data to Baltimore
  baltimore<-subset(NEI, fips == "24510")
### sum to Emissions by type and year
  with(baltimore, tapply(Emissions,list(type,year), sum,na.rm = TRUE))->t1
### preparing t1 to data frame  
  (t1[1:4,])->c1
  rep(colnames(t1),each = 4)->c2
  rep(rownames(t1),times = 4)->c3
  df2<-data.frame(cbind(as.numeric(c1),c2,c3), stringsAsFactors = FALSE)
  colnames(df2)<-c("Emissions", "Year", "type")
  df2$Emissions<-as.numeric(df2$Emissions)
  df2$type<-as.factor(df2$type)
### open png, ggplot, close png
  png(filename = "plot3.png")
  par(mar = c(6,2,6,2))
  ggplot(df2, aes(Year, Emissions))+geom_point(aes(color = type), size = 3)+
    facet_grid(.~type)+ylab(expression('Total PM'[2.5]*" Emission in Baltimore 1999-2008"))+
    ggtitle(expression('Total PM'[2.5]*" Emission in Baltimore 1999-2008 by type"))
  dev.off() 
  
