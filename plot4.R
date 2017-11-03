library(dplyr)
setwd("C:/Users/Piotr/Documents/R/Coursera/Exploratory Analysis/project")
#### Reading files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
### subsetting SSC for merging
  SCC2<-SCC %>% select(SCC, Short.Name)
  NEI_SCC<-merge(NEI, SCC2, by = "SCC" )
### subsetting coal 
  coal_NEI  <- grepl("coal", NEI_SCC$Short.Name, ignore.case=TRUE)
  NEI_SCC2<-NEI_SCC[coal_NEI,]
#### aggregating sum 
  aggregate(Emissions ~ year, NEI_SCC2, sum)->NEI_SCC2year
### open png, ggplot, close png
  png(filename = "plot4.png")
  ggplot(NEI_SCC2year, aes(factor(year), Emissions/1000))+geom_bar(stat="identity")+
    ylab(expression('Total PM'[2.5]*" Emission in US by coal 1999-2008 in TMT"))+
    ggtitle(expression('Total PM'[2.5]*" Emission in US by coal activities 1999-2008"))+
    xlab("Year")
  dev.off()
    