# Load the required libraries
library(plyr)
library(ggplot2)
library(grid)

# Read the file in to NEI
NEI <- readRDS("summarySCC_PM25.rds")

# Read the Source Classification Code in to SCC
SCC <- readRDS("Source_Classification_Code.rds")

# Total all emissions for the years 1999 to 2008
totalNEI <- tapply(NEI$Emissions, NEI$year, sum)

# Plot to file
png("plot1.png",width=480,height=480,units="px",bg="transparent")
barplot(totalNEI, col = "red", xlab = "Year", ylab = "Total PM 2.5 Emissions in Tons", main = "Total PM 2.5 Emissions in USA")

dev.off()