#Reading File
NEI <- readRDS("summarySCC_PM25.rds")
SCC <-readRDS("Source_Classification_Code.rds")

dataBaltimore <- subset(NEI, fips==24510)
emByMonth <- aggregate(dataBaltimore$Emissions, by=list(year=dataBaltimore$year, sources=dataBaltimore$type), FUN=sum)
# Plotting data in png file.
png(filename="Plot3.png", width=480, height=480)
qplot(year, x, data=emByMonth, xlab="Year", ylab="Total Emissions", colour=sources, main="PM2.5 Emissions for Baltimore City from Different Sources") + geom_line(size=1) + geom_point(size=5)
dev.off()