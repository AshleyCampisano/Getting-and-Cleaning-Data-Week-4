#Getting and Cleaning Data - Week 4 Notes

#Editing Text Variables

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/cameras.csv", method = "curl")
cameraData <- read.csv("./data/cameras.csv")
names(cameraData)

#fixing character vectors
tolower(names(cameraData))

#splitting variable names

splitNames = strsplit(names(cameraData), "\\.")
splitNames[[5]]
splitNames[[6]]

#lists

mylist <- list(letters = c("A", "b", "c"), numbers = 1:3, matrix(1:25, ncol = 5))
head(mylist)

mylist[1]
mylist$letters
mylist[[1]]

splitNames[[6]][1]

firstElement <- function(x){x[1]}
sapply(splitNames, firstElement)
#will take the first element out of the list

#Peer review data

Url1 <- "https://raw.githubusercontent.com/jtleek/dataanalysis/master/week2/007summarizingData/data/solutions.csv"
download.file(Url1, destfile = "./data/solutions.csv", method = "curl")
solutionsdata <- read.csv("./data/solutions.csv")

Url2 <- "https://raw.githubusercontent.com/jtleek/dataanalysis/master/week2/007summarizingData/data/reviews.csv"
download.file(Url2, destfile = "./data/reviews.csv")
reviewsdata <- read.csv("./data/reviews.csv")

head(reviewsdata,2)
head(solutionsdata,2)

names(reviewsdata)

sub("_", "", names(reviewsdata),)

testName <- "this_is_a_test"
sub("_", "", testName)
gsub("_", "", testName)

#searching for specific values

grep("Alameda", cameraData$intersection)

table(grepl("Alameda", cameraData$intersection))

cameraData2 <- cameraData[!grepl("Alameda", cameraData$intersection),]
cameraData2

grep("Alameda", cameraData$intersection, value=TRUE)
#values where Alameda appears

grep("JeffStreet", cameraData$intersection)
#value does not appear

length(grep("JeffStreet", cameraData$intersection))

install.packages("stringr")
library(stringr)

nchar("Jeffrey Leek")
substr("Jeffrey Leek", 1, 7)
paste0("Jeffrey", "Leek")
str_trim("Jeff      ")
#trim off extra space

#Regular Expressions

#regular expressions can be thought of as a combination of literals and metacharacters
#match occurs only if the exact sequenc of literals occur
#need a way to express: whitespace, sets of literal, the beginning and end of a line

# $ represents the end of a line

#character classes with [] - can list a set of characters we will accept at a given point in the match

#can specify a range of lettesr [a-z] or [a-zA-Z]

#. is used to refer to any character
# | can be used to combine two separate expressions
# ? indicates that the indicated expression is optional
# * repeat any numbers of the time (none) of the item
# + means at least one of the items
# {} are referred to as interval quantifiers -- let us specify the min and max number of matches in an expression
#can use ? to "turn off the greedniess" of *

#working with dates

d1 = date()
d1
class(d1)

d2 = Sys.Date()
d2
class(d2)

#formatting dates
format(d2, "%a %b %d")

#creating dates

x=c("1jan1960", "2jan1960", "31mar1960", "30jul1960"); z=as.Date(x, "%d%b%Y")
z
z[1] - z[2]

as.numeric(z[1]-z[2])

weekdays(d2)
months(d2)
julian(d2)

install.packages("lubridate")
library(lubridate)

ymd("20140108")

mdy("08/04/2014")

dmy("03-04-2014")

#times

ymd_hms("2018-08-03 10:15:03")

x = dmy("1jan2013", "2jan2013", "31mar2013", "30jul2013")
wday(x[1])

#data resources

library(swirl)
install_course("Getting and Cleaning Data")
swirl()

