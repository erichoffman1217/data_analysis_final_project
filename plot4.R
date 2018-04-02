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

# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# fetch all NEIxSCC records with Short.Name (SCC) Coal
match_coal  <- grepl("coal", scc_emission$Short.Name, ignore.case=TRUE)
subset_scc_emission <- scc_emission[match_coal, ]

total_by_year <- aggregate(Emissions ~ year, subset_scc_emission, sum)



png("plot4.png", width=640, height=480)
g <- ggplot(total_by_year, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions from coal sources for 1999, 2002, 2005 and 2008')
print(g)
dev.off()
