
library(ggplot2)

setwd("D:/88MA/ebooks/big_data/explotary data/course project/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

mvehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
SCCvehicles <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% SCCvehicles,]
# Subset the vehicles NEI data to Baltimore's fip
baltimoreVehicNEI <- vehiclesNEI[vehiclesNEI$fips=="24510",]
LAVehicNEI <- vehiclesNEI[vehiclesNEI$fips == "06037",]

baltimoreVehicNEI$city <- "Baltimore City"
LAVehicNEI$city <- "Los Angeles County"


bothNEI <- rbind(baltimoreVehicNEI,LAVehicNEI)

png("plot6.png",width=480,height=500)
ggplot(bothNEI ,aes(x=factor(year), y=Emissions, fill=city)) +
        geom_bar(aes(fill=year),stat="identity") +
        facet_grid(scales="free", space="free", .~city) +
        guides(fill=FALSE) + 
        labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) +
        labs(title=expression("PM"[2.5]*" Baltimore vs LA City motor vechile\n emissions 1999-2008 by Source Type"))

dev.off()
