library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
baltimore<- NEI[NEI$fips=="24510",]

png("plot3.png",width=500,height=480)

plt <- ggplot(baltimore,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

print(plt)
dev.off()