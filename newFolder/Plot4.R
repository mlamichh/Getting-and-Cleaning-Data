#Reading File
NEI <- readRDS("summarySCC_PM25.rds")
SCC <-readRDS("Source_Classification_Code.rds")

# Selecting data frame only with "EI.Sector" variable has "Coal" and "Comb" in the SCC file.
coalSCC <- SCC[grepl("Coal", SCC$EI.Sector) & grepl("Comb", SCC$EI.Sector),]

# SCC code associated with term "Coal" and "Comb".
coalCode <- unique(coalSCC$SCC)
# subsetting NEI frame on the bassis of SCC code associted with Coal.

coalNEI <- NEI[NEI$SCC %in% coalCode, ]

# Calculating total emission due to cal combustion.
emByYear <- aggregate(coalNEI$Emissions, by=list(year=coalNEI$year), FUN=sum)

png(filename="Plot4.png", width=480, height=480)
plot(emByYear$year, emByYear$x, cex=1.5, lwd=2, xlab="Year", ylab="Total emissions", type="o", main="Total PM2.5 Emssions from Coal Combustion", xaxt="n", pch=19, col="red")
axis(1, xaxp=c(1999, 2008, 3), las=1)
dev.off()