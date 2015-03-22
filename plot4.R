
library(ggplot2)

setwd("D:/88MA/ebooks/big_data/explotary data/course project/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# coal combustion
combustion <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE)
coalCombustion <- (combustion & coal)
SCCcombustion <- SCC[coalCombustion,]$SCC
combustionNEI <- NEI[NEI$SCC %in% SCCcombustion,]


png("plot4.png",width=480,height=480)
ggplot(combustionNEI,aes(factor(year),Emissions/10^5)) +
        geom_bar(stat="identity") +
         guides(fill=FALSE) +
        labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) +
        labs(title=expression("PM"[2.5]*" Emission in US 1999-2008 by Source Type"))
        
dev.off()
