#dplyr package installed on local RStudio unit
library(dplyr)

setwd("./UCI HAR Dataset/")

#read test data
testSet<-read.table("./test/X_test.txt")
testLabels<-read.table("./test/y_test.txt")
testSet$activity<-unlist(testLabels)
testSubject<-read.table("./test/subject_test.txt")
testSet$subject<-unlist(testSubject)

#read train data
trainSet<-read.table("./train/X_train.txt")
trainLabels<-read.table("./train/y_train.txt")
trainSet$activity<-unlist(trainLabels)
trainSubject<-read.table("./train/subject_train.txt")
trainSet$subject<-unlist(trainSubject)

#Merg test and train data
full_data<-rbind(testSet,trainSet)

#Define column names
columnNames<-read.table("features.txt")
colnames(full_data)<-c(as.character(columnNames$V2),"activity","subject")

#Define list of measurements on mean and standart deviation
selected_column<-grepl("std|mean", c(as.character(columnNames$V2),"activity","subject"))
selected_column[562:563]<-TRUE

#Select mean and standart deviation measurement
selected_data<-full_data[,selected_column]

#Define activity names
activityNames<-read.table("activity_labels.txt")
resultSet<-merge(selected_data,activityNames,by.x="activity",by.y="V1")
names(resultSet)[81]<-"activity"

#Remove some symbols from activity names
names(resultSet)<-gsub("()", "", names(resultSet), fixed=TRUE)
names(resultSet)<-gsub("-", ".", names(resultSet), fixed=TRUE)
names(resultSet)<-gsub("mean", "Mean", names(resultSet), fixed=TRUE)
names(resultSet)<-gsub("std", "Std", names(resultSet), fixed=TRUE)

#Define final version of tidy Set
tidySet<-aggregate(resultSet[1:79], list(resultSet$activity,resultSet$subject), mean)
names(tidySet)[1]<-"activity"
names(tidySet)[2]<-"subject"
tidySet<-arrange(tidySet,activity,subject)
write.table(tidySet,"tidy.txt", row.names=FALSE,col.names=TRUE)