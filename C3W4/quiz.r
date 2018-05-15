##question1
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url,"IdahoHousing.csv")
task1<-read.csv("IdahoHousing.csv", header = TRUE, sep = ",")
splitNames<-strsplit(names(task1),"wgtp")
splitNames[123]

##question2
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url,"GDP.csv")
task2<-read.csv("GDP.csv", skip=4, nrows = 215, header = TRUE, sep = ",")
task2.1<-subset(task2,!is.na(X) & X != "", select = c("X", "X.1", "X.3", "X.4"))
task2.2<-rename(task2.1, CountryCode = X, rankingGDP = X.1, Name = X.3, gdp = X.4)
TotalSum<-as.numeric(gsub(",","",task2.2$gdp))
mean(TotalSum)

##question3
CountryNames<-task2.2$Name
question3<-length(grep("^United",CountryNames))

##question4
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url,"GDP.csv")
task3<-read.csv("GDP.csv", skip=4, nrows = 215, header = TRUE, sep = ",") %>%
       subset(!is.na(X) & X != "", select = c("X", "X.1", "X.3", "X.4")) %>%
      rename(CountryCode = X, rankingGDP = X.1, Name = X.3, gdp = X.4)
url2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url2,"Educational.csv")
educational<-read.csv("Educational.csv", header = TRUE, sep = ",")
mergedData<-merge(task3,educational,by="CountryCode", all=TRUE)
question4<-length(grep("*Fiscal year end: June*", mergedData$Special.Notes))

##question5
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)


library(lubridate)
question5.1<-year(sampleTimes)
sum(question5.1 == 2012)
##250 
# This request made for russian regional settings. 
#In case of different regional settings It should to change definition for weekdays as "понедельник"  
question5.2<-data.frame(weekdays(sampleTimes),year(sampleTimes))
sum((question5.2$year.sampleTimes. == 2012) & (question5.2$weekdays.sampleTimes. == "понедельник"))
##47