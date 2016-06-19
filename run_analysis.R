library(plyr)
library(dplyr)


#downloaded the file from the site
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "./week4/smartphonedata.zip")

#unzipped the file in a local folder
unzip(zipfile="./week4/smartphonedata.zip", exdir = "./week4")

#reading files
names <- read.table("./week4/UCI HAR Dataset/features.txt")
activity<-read.table("./week4/UCI HAR Dataset/activity_labels.txt")
train_x<-read.table("./week4/UCI HAR Dataset/train/X_train.txt")
train_y<-read.table("./week4/UCI HAR Dataset/train/y_train.txt")
train_subject<-read.table("./week4/UCI HAR Dataset/train/subject_train.txt")
test_x<-read.table("./week4/UCI HAR Dataset/test/X_test.txt")
test_y<-read.table("./week4/UCI HAR Dataset/test/y_test.txt")
test_subject<-read.table("./week4/UCI HAR Dataset/test/subject_test.txt")

#combine the x data files for training and test
total_xdata<-rbind(train_x, test_x)

#change variable names to descriptive
colnames(total_xdata)<-names[,2]

#merging the activity and subject data sets
train_activitysubject<-cbind(train_y, train_subject)
test_activitysubject<-cbind(test_y, test_subject)
total_activitysubject<-rbind(train_activitysubject, test_activitysubject)

#using grep to exrtact only the columns wiht variables mean or std
subset_totalx<-total_xdata[,grep("mean|std", colnames(total_xdata), value=TRUE)]

#replace activity numbers with labels
labels<-activity[,2]
total_activitysubject[,1]<-factor(total_activitysubject[,1], labels=labels)
colnames(total_activitysubject)<-c("Activity", "Subject")

#creating total data set
total_data<-cbind(total_activitysubject, subset_totalx)

tidy_data<-ddply(total_data, c("Subject", "Activity"), colwise(mean))


