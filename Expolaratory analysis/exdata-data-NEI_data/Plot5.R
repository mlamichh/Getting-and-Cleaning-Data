#Reading File
NEI <- readRDS("summarySCC_PM25.rds")
SCC <-readRDS("Source_Classification_Code.rds")

# Baltimore vehicle associated with Motor vechicle.
balVehicleNEI<-subset(NEI, fips == "24510" & type=='ON-ROAD' )

# Calculating total emission due to cal combustion.
emByYear <- aggregate(balVehicleNEI$Emissions, by=list(year=balVehicleNEI$year), FUN=sum)

png(filename="Plot5.png", width=480, height=480)
plot(emByYear$year, emByYear$x, cex=1.5, lwd=2, xlab="Year", ylab="Total emissions", type="o", main="PM2.5 Emssions from Vehicles in Baltimore", xaxt="n", pch=19, col="red")
axis(1, xaxp=c(1999, 2008, 3), las=1)
dev.off()