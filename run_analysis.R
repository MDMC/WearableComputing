
# Script assumes that it is being run in the directory holding the dataset

#  Input:  UCI HAR Dataset.
#  Output:  cleanData.txt  This file contains data from the original
#           training and test data files.  Only the mean and standard
#           deviation features are retained.  Descriptive labels are
#           provided for subject activities.
#           summaryData.txt  This file contains the mean of the features
#           in cleanData.txt aggregated by subject and activity.
#  Output files can be read with read.table("file_name")

# Get the labels for the features
labels <- read.table("features.txt")

#  Get the test data
setwd("./test")
subject <- read.table("subject_test.txt")
y <- read.table("Y_test.txt")
x <- read.table("X_test.txt")
names(subject) <- "subject"
names(y) <- "activity"
names(x) <- labels[,2]
fy = factor(y$activity,labels=c("Walking", "WalkingUpstairs", "WalkingDownstairs", "Sitting", "Standing", "Laying"))
fsubject <- factor(subject$subject)
testData <- cbind(fsubject, fy, x)

# Repeat for the training data
setwd("../train")
subject <- read.table("subject_train.txt")
y <- read.table("Y_train.txt")
x <- read.table("X_train.txt")
names(subject) <- "subject"
names(y) <- "activity"
names(x) <- labels[,2]
fy = factor(y$activity,labels=c("Walking", "WalkingUpstairs", "WalkingDownstairs", "Sitting", "Standing", "Laying"))
fsubject <- factor(subject$subject)
trainData <- cbind(fsubject, fy, x)

#Concatenate the two sets
data <- rbind(trainData, testData)

#Extract out the columns which are identified as mean() or std() of a given measurement
means <- data[,grepl("mean\\(\\)", names(data))]
stds <- data[,grepl("std\\(\\)", names(data))]
data2 <- cbind(data$fsubject, data$fy, means, stds)

#Change odd "BodyBody" in the names to simple "Body"
#Remove punctuation from variable names
#Change lower case  mean and std to uppercase
names(data2) <- gsub("BodyBody", "Body", names(data2))
names(data2) <- gsub("[^[:alnum:]]", "", names(data2))
names(data2) <- gsub("mean", "Mean", names(data2))
names(data2) <- gsub("std", "Std", names(data2))
names(data2) <- gsub("datafsubject", "Subject", names(data2))
names(data2) <- gsub("datafy", "Activity", names(data2))

#Save the cleaned and column-reduced data set
setwd("..")
write.table(data2, "cleanData.txt")

#Now will compute the mean of the data by Subject and Activity
summaryData <- data2[order(data2$Subject, data2$Activity),]
summary2 <- aggregate(summaryData[,3:68], list(Subject = summaryData$Subject, Activity=summaryData$Activity), mean)

#Save this table as well
write.table(summary2, "summaryData.txt")
