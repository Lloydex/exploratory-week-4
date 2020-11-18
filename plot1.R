## read in emissions data and classification code
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## add up the total emissions for each year
sum_by_year <- aggregate(NEI$Emissions, by=list(year=NEI$year), FUN=sum)

## create the plot
png(filename = "plot1.png",width=500,height=480)
plot(sum_by_year$year, sum_by_year$x, type = "b", 
     main = "Total Emissions of PM2.5 in Baltimore City",
     ylab = "Total emissions of PM2.5 (tons)",
     xlab = "Year")
dev.off()




