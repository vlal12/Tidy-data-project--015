library(plyr)
library(dplyr)

#downloaded the file from the site
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "./vinny docs/smartphonedata.zip")

#unzipped the file in a local folder
unzip(zipfile="./vinny docs/smartphonedata.zip", exdir = "./vinny docs")

# loading test data
test_sub<-read.table("./vinny docs/UCI HAR Dataset/test/subject_test.txt")
test_ylab<-read.table("./vinny docs/UCI HAR Dataset/test/y_test.txt")
test_x<-read.table("./vinny docs/UCI HAR Dataset/test/X_test.txt")

# loading train data
train_sub<-read.table("./vinny docs/UCI HAR Dataset/train/subject_train.txt")
train_ylab<-read.table("./vinny docs/UCI HAR Dataset/train/y_train.txt")
train_x<-read.table("./vinny docs/UCI HAR Dataset/train/X_train.txt")

#Merging test data
total_test<-cbind(test_sub, test_ylab, test_x)

#Merging train data
total_train<-cbind(train_sub, train_ylab, train_x)

#Merging test and train data
total<-rbind(total_test, total_train)

#function for extracting mean and standard deviation row numbers from features file
features<-read.table("./vinny docs/UCI HAR Dataset/features.txt")
extract_features<-function(features){
  features_submean<-features[grep("mean()", features$V2, fixed=TRUE), ]
  features_substd<-features[grep("std()", features$V2, fixed=TRUE), ]
  features_subset<-arrange(rbind(features_submean, features_substd), V1)
  #features_subset contains the column numbers that need to be extracted from the merged data set total
  features_subset
}

#subsetting total dataset to allow working with duplicate column names (V1) entered by default
subset1<-total[,1:2]#gives the subject and activity numbers
subset2<-total[,3:563]#gives the values measured during activities(mean, std, etc...)

#extracting mean and standard deviation from the total
extract <- extract_features(features)
  for(i in 1:nrow(extract)){
      col<-extract[i,1]
      if (i==1){
        total_subset2<-cbind(subset2[col])
      }
      else{
        total_subset2<-cbind(total_subset2,subset2[col])#total_subset2 gives all the mean and std values
      }
      
  }

#Replacing activity numbers with names (col 2 of total_subset)
subset1[,2]<-as.character(factor(subset1[,2], labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITING", "STANDING", "LAYING")))

#labelling the data set
colnames(total_subset2)<-extract[,2]
colnames(subset1)<-c("Subject", "Activity")
total_subset<-cbind(subset1, total_subset2)

#arranging data by subject
total_subset<-arrange(total_subset, Subject)

#creating tidy data set
tidy_data<-ddply(total_subset, c("Subject", "Activity"), colwise(mean))

