#Getting and Cleaning Data - Week 4 Quiz

#1 
Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(Url, destfile = "./getdata%2Fdata%2Fss06hid.csv", method = "curl")
IdahoData <- read.csv("./getdata%2Fdata%2Fss06hid.csv")
names(IdahoData)

head(IdahoData)

?strsplit

split <- strsplit(names(IdahoData), "wgtp")
split[[123]]

#2
GDPrank <- data.table::fread('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv'
                             , skip=5
                             , nrows=190
                             , select = c(1, 2, 4, 5)
                             , col.names=c("CountryCode", "Rank", "Country", "GDP")
)

?gsub

nocommas <- gsub(',', replacement = '', x=GDPrank$GDP)
mean(as.integer(nocommas))

#3
grep("^United",GDPrank[, Country])


#4
eduDT <- data.table::fread('http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv')

mergedDT <- merge(GDPrank, eduDT, by = 'CountryCode')

names(mergedDT)
head(mergedDT)

mergedDT[grepl(pattern = "Fiscal year end: June 30;", mergedDT[, 'Special Notes']), .N]

#5
install.packages("quantmod")
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
timeDT <- data.table::data.table(timeCol = sampleTimes)

#
times <- timeDT[(timeCol >= "2012-01-01") & (timeCol < "2013-01-01"), .N]
times

days <- timeDT[(timeCol >= "2012-01-01") & (timeCol < "2013-01-01") 
                 & (weekdays(timeCol) == "Monday"), .N]
days
