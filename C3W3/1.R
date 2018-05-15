library("dplyr")

##question1
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url,"week3quiz.csv")
task1<-read.csv("week3quiz.csv", header = TRUE, sep = ",")
agricultureLogical<-(task1$ACR == 3 & task1$AGS == 6)
question1 <- which(agricultureLogical)
question1[1:3]

##question2
install.packages("jpeg")
library(jpeg)
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(url,"pict.jpg", mode="wb")
data<-readJPEG("pict.jpg",native=TRUE)
quantile(data, c(0.3,0.8))

##question3
url1<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url1,"countries.csv")
countries<-read.csv("countries.csv", skip = 4, nrows = 215, header = TRUE, sep = ",")
countries2<-subset(countries, !is.na(X) & X != "", select = c("X", "X.1", "X.3", "X.4"))
countries3<-rename(countries2, CountryCode = X, rankingGDP = X.1, Long.Name = X.3, gdp = X.4)

url2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(url2,"education.csv")
education<-read.csv("education.csv", header = TRUE, sep = ",")

mergedData<-merge(countries,education,by="CountryCode", all=TRUE)
orderedData<-order(mergedData, mergedData$Gross.domestic.product.2012, decreasing = TRUE, na.last = NA)
question3.1<-sum(!is.na(unique(mergedData$rankingGDP)))
question3.2<-subset(mergedData, select=c(rankingGDP,Long.Name.x))
question3.2a <- question3.2[order(question3.2$rankingGDP, decreasing = TRUE), "Long.Name.x"][13]

##question4
question4.1<-subset(mergedData, mergedData$Income.Group == "High income: OECD")
question4.1<-mean(as.numeric(question4.2$rankingGDP), na.rm=TRUE)
question4.2<-subset(mergedData, mergedData$Income.Group == "High income: nonOECD")
question4.2<-mean(as.numeric(question4.2$rankingGDP), na.rm=TRUE)

##question5
library(Hmisc)
library(data.table)
Data1<-subset(mergedData, select = c(Income.Group, rankingGDP))
Data2<-data.table(mutate(Data1, quantileGDP = cut2(rankingGDP, g = 5)))
Data3<-Data2[Income.Group == "Lower middle income", .N, by = c("Income.Group", "quantileGDP")]
question5<-subset(Data3, quantileGDP == "[  1, 39)", select = N)