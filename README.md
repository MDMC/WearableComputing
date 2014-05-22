## WearableComputing
## Human Activity Recognition.
## Course Assignment "Getting and Cleaning Data"



Dataset downloaded from 

* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

into a directory named UCI HAR Dataset

The script run_analysis.R assumes that it is being run in the directory holding the dataset

* Input:  UCI HAR Dataset.  See the data description below.
* Output:    cleanData.txt  This file contains data from the original
           training and test data files.  Only the mean and standard
           deviation features are retained.  Descriptive labels are
           provided for subject activities.
           summaryData.txt  This file contains the mean of the features
           in cleanData.txt aggregated by subject and activity.
           Output files can be read with read.table("file_name")

## Data

For every one of 30 subjects, a 561-feature vector was created capturing data for each of 6 activities.


For the course summary data set, I have extracted the
data labeled "mean()" and "std()" from the test and training sets for
each of the 33 features listed below. (Data labeled XYZ consist of 3 data points)

* tBodyAccXYZ
* tGravityAccXYZ
* tBodyAccJerkXYZ
* tBodyGyroXYZ
* tBodyGyroJerkXYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAccXYZ
* fBodyAccJerkXYZ
* fBodyGyroXYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

Resulting variables, then are labeled as (e.g.) tBodyAccXMean or fBodyGyroMagStd

Although the following are listed as "Means", they had no matching
standard deviation so they were not included in the analysis set.

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

More details on each of the features in the data set can be found in
UCI HAR Dataset/features_info.txt
