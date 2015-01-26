library(ggplot2)

# Read the file in to NEI
NEI <- readRDS("summarySCC_PM25.rds")

# Read the Source Classification Code in to SCC
SCC <- readRDS("Source_Classification_Code.rds")

# Filter with regular expression names containing "Vehicles" or "vehicles"
vehicles1 <- unique(grep("Vehicles", SCC$EI.Sector, ignore.case = TRUE, value = TRUE))
vehicles <- SCC[SCC$EI.Sector %in% vehicles1, ]["SCC"]

# Select observations relating to Baltimore MD
vehiclesBaltimore <- NEI[NEI$SCC %in% vehicles$SCC & NEI$fips == "24510",]

# Plot to file
png("plot5.png",width=480,height=480,units="px",bg="transparent")
ggp <- ggplot(vehiclesBaltimore,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="red", width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="Year", y=expression("Total PM 2.5 Emission in Tons")) + 
  labs(title=expression("Total PM 2.5 Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(ggp)

dev.off()