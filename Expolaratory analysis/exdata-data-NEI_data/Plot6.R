library(ggplot2)
#Reading File
NEI <- readRDS("summarySCC_PM25.rds")
SCC <-readRDS("Source_Classification_Code.rds")

# data associated with Motor vechicle.
vehicleNEI<-subset(NEI,type=='ON-ROAD')

#data associated with Baltimore and LA.
balLaVehicleNEI <- subset(vehicleNEI, fips == "24510" | fips == "06037")

# Calculating total emission due to cal combustion.
emByYear <- aggregate(balLaVehicleNEI$Emissions, by=list(year=balLaVehicleNEI$year, fips=balLaVehicleNEI$fips), FUN=sum)

png(filename="Plot6.png", width=480, height=480)
qplot(year, x, data=emByYear, xlab="Year", ylab="Total Emissions", colour=fips, main="PM2.5 Emissions for Baltimore and LA from vehicles") + geom_line(size=1) + geom_point(size=5)
axis(1, xaxp=c(1999, 2008, 3), las=1)
dev.off()