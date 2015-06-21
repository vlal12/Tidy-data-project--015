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

##Description of the tidy_data.txt file
Tidy data : data frame with 180 obs(rows) and 68 variables(columns)
For every subject, contains mean and standard deviation values for each of the 6 activities and each of the 66 variables.

__Variables__
1. Subject: 1-30, numeric values 
2. Activity: 1-6. numeric values provided in the original data set  and their corresponding activity labels in "Activity.txt" file. Numeric values replaced by to their character values in tidy data.
3. tBodyAcc-mean()-X
4. tBodyAcc-mean()-Y
5. tBodyAcc-mean()-Z
6. tBodyAcc-std()-X
7. tBodyAcc-std()-Y
8. tBodyAcc-std()-Z
9. tGravityAcc-mean()-X
10. tGravityAcc-mean()-Y
11. tGravityAcc-mean()-Z
12. tGravityAcc-std()-X
13. tGravityAcc-std()-Y
14. tGravityAcc-std()-Z
15. tBodyAccJerk-mean()-X
16. tBodyAccJerk-mean()-Y
17. tBodyAccJerk-mean()-Z
18. tBodyAccJerk-std()-X
19. tBodyAccJerk-std()-Y
20. tBodyAccJerk-std()-Z
21. tBodyGyro-mean()-X
22. tBodyGyro-mean()-Y
23. tBodyGyro-mean()-Z
24. tBodyGyro-std()-X
25. tBodyGyro-std()-Y
26. tBodyGyro-std()-Z
27. tBodyGyroJerk-mean()-X
28. tBodyGyroJerk-mean()-Y
29. tBodyGyroJerk-mean()-Z
30. tBodyGyroJerk-std()-X
31. tBodyGyroJerk-std()-Y
32. tBodyGyroJerk-std()-Z
33. tBodyAccMag-mean()
34. tBodyAccMag-std()
35. tGravityAccMag-mean()
36. tGravityAccMag-std()
37. tBodyAccJerkMag-mean()
38. tBodyAccJerkMag-std()
39. tBodyGyroMag-mean()
40. tBodyGyroMag-std()
41. tBodyGyroJerkMag-mean()
42. tBodyGyroJerkMag-std()
43. fBodyAcc-mean()-X
44. fBodyAcc-mean()-Y
45. fBodyAcc-mean()-Z
46. fBodyAcc-std()-X
47. fBodyAcc-std()-Y
48. fBodyAcc-std()-Z
49. fBodyAccJerk-mean()-X
50. fBodyAccJerk-mean()-Y
51. fBodyAccJerk-mean()-Z
52. fBodyAccJerk-std()-X
53. fBodyAccJerk-std()-Y
54. fBodyAccJerk-std()-Z
55. fBodyGyro-mean()-X
56. fBodyGyro-mean()-Y
57. fBodyGyro-mean()-Z
58. fBodyGyro-std()-X
59. fBodyGyro-std()-Y
60. fBodyGyro-std()-Z
61. fBodyAccMag-mean()
62. fBodyAccMag-std()
63. fBodyBodyAccJerkMag-mean()
64. fBodyBodyAccJerkMag-std()
65. fBodyBodyGyroMag-mean()
66. fBodyBodyGyroMag-std()
67. fBodyBodyGyroJerkMag-mean()
68. fBodyBodyGyroJerkMag-std()

 
