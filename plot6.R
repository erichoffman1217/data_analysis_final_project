if(!exists("emission")){
        emission <- readRDS("C:/Users/ehoff_000/Documents/GitHub/data_analysis_final_project/summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("C:/Users/ehoff_000/Documents/GitHub/data_analysis_final_project/Source_Classification_Code.rds")
}
if(!exists("scc_emission")){
        scc_emission <- merge(emission, SCC, by="SCC")
}
library(ggplot2)

subset_scc_emission <- scc_emission[(scc_emission$fips=="24510"|scc_emission$fips=="06037") & 
                                  scc_emission$type=="ON-ROAD",  ]

total_year_fips <- aggregate(Emissions ~ year + fips, subset_scc_emission, sum)
total_year_fips$fips[total_year_fips$fips=="24510"] <- "Baltimore, MD"
total_year_fips$fips[total_year_fips$fips=="06037"] <- "Los Angeles, CA"

png("plot6.png", width=1040, height=480)
g <- ggplot(total_year_fips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions from motor vehicle in Baltimore City and  Los Angeles, CA for 1999, 2002, 2005 and 2008')
print(g)
dev.off()
