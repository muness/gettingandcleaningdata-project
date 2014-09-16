
# load activity names
activity_labels        <- read.table("./activity_labels.txt",col.names=c("activity_id", "activity"), row.names = NULL)

# load the data column names
data_features          <- read.table("features.txt",col.names=c("feature_id", "name"))

# load the test data
test_data              <- read.table("./test/X_test.txt",col.names=data_features$name)

# load the test subjects
test_subject_id        <- read.table("./test/subject_test.txt", col.names="subject_id")

# load the test activities
test_activity_id       <- read.table("./test/y_test.txt", col.names="activity_id")

# combine the test activities and subjects into the test data
test_data              <- cbind(test_subject_id, test_activity_id, test_data)

# repeat the same for the training data
train_data             <- read.table("./train/X_train.txt",col.names=data_features$name)
train_subject_id       <- read.table("./train/subject_train.txt", col.names="subject_id")
train_activity_id      <- read.table("./train/y_train.txt", col.names="activity_id")
train_data             <- cbind(train_subject_id, train_activity_id, train_data)

# combine test and training data into one data frame
data                   <- rbind(train_data,test_data)

# select just the columns we're interested in ("only the measurements on the mean and standard deviation for each measurement.")
data                   <- data[,c(grep("mean|std|activity_id|subject_id", colnames(data),ignore.case=TRUE, value=TRUE))]

# replace activity_id column with a readable activity column
data                   <- merge(data, activity_labels)
data$activity_id       <-NULL

colnames<-colnames(data)
colnames<-gsub('\\.', '', colnames)
colnames(data)<-colnames

# if reshape2 isn't installed, install it.
if (!is.element("reshape2", installed.packages()[,1]))
  install.packages("reshape2", dep = TRUE)
require("reshape2")

# first "melt" (aka unpivot in Excel) the data down
unpivoted_data         <- melt(data,id=c("activity","subject_id"))

# now for each activity and subject, summarize the variables by calculating its mean
tidy_data              <- dcast(unpivoted_data,activity + subject_id ~ variable,mean)

write.table(tidy_data, file = 'tidy_data.txt', row.names = FALSE)

