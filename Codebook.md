---
title: UCI HAR Tidy data Codebook
 
## Project Description
To create a tidy data set out of a given dataset after manipulating and cleaning up the data.
The data contains triaxial measurements from accelerometers and gyroscope for training and test, measured for 30 subjects and 6 activities.
 
##Creating the tidy datafile
run_analysis.R script contains all steps that were involved in creating the tidy data set. That involves, downloading and reading the files, filtering the data based on certain variables, and then carrying out steps for properly labelling the data and extracting out a tidy data set.

###Guide to create the tidy data file
1. The text files are read through read.table()
2. cbind() and rbind() are used to create a data frame that contains both test and training data
3. Based on the features variables, the coulmn number corresponding to the features is exteacted from the total data set
4. The variables are labelled and the activities are labelled
5. ddply() is usd to extract the tidy data set with average values for each measurement, each activity and each subject.

##Description of the variables in the tiny_data.txt file
Tidy data : 180 obs and 68 variables
For every subject, contains mean and standard deviation values for each of the 6 activities and each of the 66 variables.
_bold_
1 "tBodyAcc-mean()-X"
2 "tBodyAcc-mean()-Y"
3 "tBodyAcc-mean()-Z"
4 "tBodyAcc-std()-X"
5 "tBodyAcc-std()-Y"
6 "tBodyAcc-std()-Z"
41 "tGravityAcc-mean()-X"
42 "tGravityAcc-mean()-Y"
43 "tGravityAcc-mean()-Z"
44 "tGravityAcc-std()-X"
45 "tGravityAcc-std()-Y"
46 "tGravityAcc-std()-Z"
81 "tBodyAccJerk-mean()-X"
82 "tBodyAccJerk-mean()-Y"
83 "tBodyAccJerk-mean()-Z"
84 "tBodyAccJerk-std()-X"
85 "tBodyAccJerk-std()-Y"
86 "tBodyAccJerk-std()-Z"
121 "tBodyGyro-mean()-X"
122 "tBodyGyro-mean()-Y"
123 "tBodyGyro-mean()-Z"
124 "tBodyGyro-std()-X"
125 "tBodyGyro-std()-Y"
126 "tBodyGyro-std()-Z"
161 "tBodyGyroJerk-mean()-X"
162 "tBodyGyroJerk-mean()-Y"
163 "tBodyGyroJerk-mean()-Z"
164 "tBodyGyroJerk-std()-X"
165 "tBodyGyroJerk-std()-Y"
166 "tBodyGyroJerk-std()-Z"
201 "tBodyAccMag-mean()"
202 "tBodyAccMag-std()"
214 "tGravityAccMag-mean()"
215 "tGravityAccMag-std()"
227 "tBodyAccJerkMag-mean()"
228 "tBodyAccJerkMag-std()"
240 "tBodyGyroMag-mean()"
241 "tBodyGyroMag-std()"
253 "tBodyGyroJerkMag-mean()"
254 "tBodyGyroJerkMag-std()"
266 "fBodyAcc-mean()-X"
267 "fBodyAcc-mean()-Y"
268 "fBodyAcc-mean()-Z"
269 "fBodyAcc-std()-X"
270 "fBodyAcc-std()-Y"
271 "fBodyAcc-std()-Z"
345 "fBodyAccJerk-mean()-X"
346 "fBodyAccJerk-mean()-Y"
347 "fBodyAccJerk-mean()-Z"
348 "fBodyAccJerk-std()-X"
349 "fBodyAccJerk-std()-Y"
350 "fBodyAccJerk-std()-Z"
424 "fBodyGyro-mean()-X"
425 "fBodyGyro-mean()-Y"
426 "fBodyGyro-mean()-Z"
427 "fBodyGyro-std()-X"
428 "fBodyGyro-std()-Y"
429 "fBodyGyro-std()-Z"
503 "fBodyAccMag-mean()"
504 "fBodyAccMag-std()"
516 "fBodyBodyAccJerkMag-mean()"
517 "fBodyBodyAccJerkMag-std()"
529 "fBodyBodyGyroMag-mean()"
530 "fBodyBodyGyroMag-std()"
542 "fBodyBodyGyroJerkMag-mean()"
543 "fBodyBodyGyroJerkMag-std()"

Some information on the variable including:
 - Class of the variable
 - Unique values/levels of the variable
 - Unit of measurement (if no unit of measurement list this as well)
 - In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels). 
 
(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)
 
####Notes on variable 1:
If available, some additional notes on the variable not covered elsewehere. If no notes are present leave this section out.
 
##Sources
Sources you used if any, otherise leave out.
 
##Annex
If you used any code in the codebook that had the echo=FALSE attribute post this here (make sure you set the results parameter to 'hide' as you do not want the results to show again)
