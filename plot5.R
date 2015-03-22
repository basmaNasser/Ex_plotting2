
library(ggplot2)

setwd("D:/88MA/ebooks/big_data/explotary data/course project/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

mvehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
SCCvehicles <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% SCCvehicles,]
# Subset the vehicles NEI data to Baltimore's fip
baltimoreVehicNEI <- vehiclesNEI[vehiclesNEI$fips=="24510",]


png("plot5.png",width=480,height=500)
ggplot(baltimoreVehicNEI,aes(factor(year),Emissions)) +
        geom_bar(stat="identity") +
         guides(fill=FALSE) +
        labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) +
        labs(title=expression("PM"[2.5]*" Baltimore City motor vechile emissions 1999-2008 by Source Type"))
        
dev.off()
