## Assignment #Q6: Compare emissions from motor vehicle sources in Baltimore 
## City with emissions from motor vehicle sources in Los Angeles County, 
## California (fips == "06037"). Which city has seen greater changes over time 
## in motor vehicle emissions?
NEI <- readRDS("summarySCC_PM25.rds")
Baltimore <- NEI[NEI$fips == 24510,]
Baltimore$city <- "Baltimore City"
LA <- NEI[NEI$fips=="06037",]
LA$city <- "Los Angeles County"
bothNEI <- rbind(Baltimore,LA)

library(ggplot2)

png("Plot6.png",width=500,height=480)

ggp <- ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE) + theme_bw() +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

print(ggp)
dev.off()