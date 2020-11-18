## read in emissions data and classification code
NEI <- readRDS("summarySCC_PM25.rds")


## subset data from Baltimore City from type "on road"
balt_car <- subset(NEI, NEI$fips=="24510" 
                             & NEI$type=="ON-ROAD")

baltimore_car_year <- aggregate(balt_car$Emissions, 
                                by=list(balt_car$year), FUN=sum)
colnames(baltimore_car_year) <- c("Year", "Emissions")

## create plot showing car related emissions in Baltimore City from 1999-2008
png("plot5.png",width=500,height=480)
plot(baltimore_car_year$Year, baltimore_car_year$Emissions,
     type = "b",
     xlab = "year",
     ylab = "Total Emissions (tons)",
     main = "Total Emissions of PM2.5 related to motor Vehicles",
     sub = "Baltimore City")
dev.off()