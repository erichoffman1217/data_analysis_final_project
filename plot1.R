if(!exists("emission")){
        emission <- readRDS("C:/Users/ehoff_000/Documents/GitHub/data_analysis_final_project/summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("C:/Users/ehoff_000/Documents/GitHub/data_analysis_final_project/Source_Classification_Code.rds")
}

total_by_year <- aggregate(Emissions ~ year, emission, sum)

png('plot1.png')
barplot(height=total_by_year$Emissions, names.arg=total_by_year$year, 
        ylab=expression('total PM'[2.5]*' emission'),
        xlab= 'year',
        main=expression('Total PM'[2.5]*' emissions for 1999, 2002, 2005 and 2008'))
dev.off()
