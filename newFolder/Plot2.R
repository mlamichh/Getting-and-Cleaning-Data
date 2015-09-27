#Reading File
NEI <- readRDS("summarySCC_PM25.rds")
SCC <-readRDS("Source_Classification_Code.rds")

dataBaltimore <- subset(NEI, fips==24510)
emByMonth <- aggregate(dataBaltimore$Emissions, by=list(year=dataBaltimore$year), FUN=sum)

# Opening plot device.
png(filename="Plot2.png", width=480, height=480)
plot(emByMonth$year, emByMonth$x,xlab="Year", ylab="Total emissions", type="o", main="Total PM2.5 Emissions for Baltimore City", xaxt="n", pch=19, col="red")
axis(1, xaxp=c(1999, 2008, 3), las=1)
dev.off()