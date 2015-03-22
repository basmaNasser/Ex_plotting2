
setwd("D:/88MA/ebooks/big_data/explotary data/course project/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
aggTotals <- aggregate(Emissions ~ year,NEI[NEI$fips=="24510",],sum)
png("plot2.png",width=480,height=480)
barplot(
        (aggTotals$Emissions),
        names.arg=aggTotals$year,
        xlab="Year",
        ylab="PM2.5 Emissions (10^6 Tons)",
        main="Total PM2.5 Emissions From All Baltimore City Sources"
)

dev.off()
