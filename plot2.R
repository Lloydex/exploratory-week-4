
## read in emissions data and classification code
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
Datasub<-NEI[NEI[,1] == "24510",]

#BaltCty <- tapply(Datasub$Emissions, Datasub$year, sum)

sum_by_year <- aggregate(Datasub$Emissions, by=list(year=Datasub$year), FUN=sum)

png("plot2.png",width=500,height=480)

plot(sum_by_year$year,sum_by_year$x,type = "o", main = "Total PM2.5 Emissions in Baltimore County", 
     xlab = "Year", ylab = "PM2.5 Emissions", pch = 18, col = "darkblue", 
     lty = 5)
dev.off()
