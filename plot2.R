# Read the file in to NEI
NEI <- readRDS("summarySCC_PM25.rds")

# Read the Source Classification Code in to SCC
SCC <- readRDS("Source_Classification_Code.rds")

# FIlter observations relating to Baltimore MD
Baltimore <- subset(NEI, fips == "24510")

# Total all emissions in Baltimore MD, for the years 1999 to 2008
totalBaltimore <- tapply(Baltimore$Emissions, Baltimore$year, sum)

# Plot to file
png("plot2.png",width=480,height=480,units="px",bg="transparent")
barplot(totalBaltimore, col = "red", xlab = "Year", ylab = "Total PM 2.5 Emissions in Tons", main = "Yearly Emissions in Baltimore City, Maryland")

dev.off()