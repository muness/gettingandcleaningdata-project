Getting and cleaning data project
==============================

This is my implementation of the project for the Coursera course Getting and cleaning data. Instructions are included here for reference.

## Instructions

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Notes

The data referenced in the instructions was expanded into this directory for easier execution.

* Input: See features_info for details on the data used for input.
* Output: In tidy_data.txt, each of the collected variables has been summarized (using the mean function) by subject and activity.
* Process: See run_analysis.R . It reads the input, combines it. It is then grouped by subject and activity type and summarized. Finally, this is saved to a data table, tidy_data.txt.
* Codebook: no codebook was warranted given the simplicity of the process. No cleanup was necessary, and the data was only processed as described in the assignment. The variables names were left mostly unchanged (except for remove spurious .s) for easier refernce back to the original data set, wherein they are fully described (see features_info.txt)
