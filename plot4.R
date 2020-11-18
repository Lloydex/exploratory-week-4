
## Assignment #Q4: Across the United States, how have emissions from coal 
## combustion-related sources changed from 1999-2008?
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC.sub <- SCC[grepl("Coal" , SCC$Short.Name), ]
NEI <- NEI[NEI$SCC %in% SCC.sub$SCC, ]

png("plot4.png",width=500,height=480)

ggp <- ggplot(NEI, aes(x = factor(year), y = Emissions, fill =type)) + 
  geom_bar(stat= "identity", width = .4) + xlab("year") +
  ylab("Coal-Related PM2.5 Emissions") + 
  ggtitle("Total Coal-Related PM2.5 Emissions")

print(ggp)
dev.off()