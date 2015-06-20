# Tidy-data-project--015
==================================================================
The aim of this project is to create a tidy data set from the data provided for the project, named as the UCI HAR Dataset. This data contains 3-axial linear acceleration and 3-axial angular velocity measurements from the accelerometer and gyroscope respectively for 30 subjects and 6 activities per subject. The provided data is not exactly raw; it has been pre-processed to remove noise. The actual data is contained in two folders, one for the training and one for the test measurements respectively.
In this project, we are required to combine the given sets of data and apply certain procedures to eventually extract a tidy data set. As has been covered in the lectures for this course, in tidy data (Wickham, Hadley. "Tidy data." Under review (2014).):
* Each variable forms a column
* Each observation forms a row
* Each type of observational unit forms a table
 
Extracting tidy data
 It involves writing an R script that does the following things:
==================================================================
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


From the data link provided for the project, the data is downloaded and unzipped in the same folder containing the R script. This folder is made the current working directory for simplified access to all files. Thee only files considered are the subject_test and subject_train text files in their respective test and train folders. The inertial signal data are not considered here (reasons mentioned in the forum).


======================================
Here is a link for the script: 
Tidy-data-project--015/run_analysis.R

The script flows in the following manner:

* The script reads all the required files (in .txt format) using read.table() and stores them in individual data frames. This step is carried out for the X, Y and subject files in both test and train folders. 
* Using cbind(), the data frames created in step 1 are combined to produce total_test and total_train data frames. The files are combined in the order (subject, y, x). Y here contains the activity numbers.
* Using rbind(), the test and train data frames are joined together to make a "total" data frame.
* The feature.txt file is read in with read.table() to extract the mean and standard deviation variables to be put in the tidy data set. A function is created which for this purpose that employs a built-in grep() function. We require only the mean and std dev variables that correspond to the triaxial measurements, and not variables like meanFreq. The grep() function does exactly that, in matching the pattern and selecting all the relevant variables. All these variables are finally arranged in order using the arrange() function and put in a data frame named features_subset.
* When the "total" data set was created by appending the subject and activity columns to the actual data, the columns names in the "total" data frame became redundant, with the first three columns named as V1. So the dataframe here is again broken in two: subset1 (subject and activity columns) and subset2 ( values for measurement variables), and functions carried out separately on both.
* An "extract_features()" function is written that extracts the variable names from the subset2 corresponding to the feature names in the features_subset.
* 

The github repository includes the following files:
=========================================

- 'README.md'

- 'run_analysis.R': Contains the code that creates the tidy data

- 'Codebook.md': List and details of all variables.



The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
