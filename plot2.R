if(!exists("emission")){
        emission <- readRDS("C:/Users/ehoff_000/Documents/GitHub/data_analysis_final_project/summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("C:/Users/ehoff_000/Documents/GitHub/data_analysis_final_project/Source_Classification_Code.rds")
}

subset_emission  <- emission[emission$fips=="24510", ]

total_by_year <- aggregate(Emissions ~ year, subset_emission, sum)

png('plot2.png')
barplot(height=total_by_year$Emissions, 
        names.arg=total_by_year$year, 
        xlab="year", 
        ylab=expression('total PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions for 1999, 2002, 2005 and 2008'))
dev.off()
