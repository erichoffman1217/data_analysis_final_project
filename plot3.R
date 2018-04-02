if(!exists("emission")){
        emission <- readRDS("C:/Users/ehoff_000/Documents/GitHub/data_analysis_final_project/summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("C:/Users/ehoff_000/Documents/GitHub/data_analysis_final_project/Source_Classification_Code.rds")
}
library(ggplot2)

subset_emission  <- emission[emission$fips=="24510", ]

total_year_type <- aggregate(Emissions ~ year + type, subset_emission, sum)



png("plot3.png", width=640, height=480)
g <- ggplot(total_year_type, aes(year, Emissions, color = type))
g <- g + geom_line() +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions in Baltimore City, Maryland for 1999, 2002, 2005 and 2008')
print(g)
dev.off()
