library(dplyr)
library(tidyr)


#Importing the list of all features, they will be used as a column names
#for test and train set od data (X_test.txt and X_train.txt).
features<-read.csv("./UCI HAR Dataset/features.txt",header=FALSE, sep="")

#Importing the list of all activities.
activity<-read.csv("./UCI HAR Dataset/activity_labels.txt",header=FALSE, sep="")
names(activity)<-c("ID","activity")
  
#Importing the dataset for test data.
test_subject<-read.csv("./UCI HAR Dataset/test/subject_test.txt",header=FALSE, 
                       sep=" ", col.names="subject")
test_labels<-read.csv("./UCI HAR Dataset/test/y_test.txt",header=FALSE, 
                      sep=" ", col.names="label")
test_set<-read.csv("./UCI HAR Dataset/test/X_test.txt",header=FALSE, 
                   sep="", dec=".")

#4. Appropriately labels the data set with descriptive variable names. 
names(test_set)<-features$V2

#Preparing one data frame for test data.
test<-bind_cols(test_subject, test_labels, test_set)

#Removing duplicated columns from the test_set
unique_test<-test[, !duplicated(colnames(test))]

#2. Extracts only the measurements on the mean and standard deviation 
#for each measurement. 
final_test<-select(unique_test, subject, label, contains("mean"), contains("std"))

#Importing the dataset for train data.
train_subject<-read.csv("./UCI HAR Dataset/train/subject_train.txt",header=FALSE,
                        sep=" ", col.names="subject")
train_labels<-read.csv("./UCI HAR Dataset/train/y_train.txt",header=FALSE, 
                       sep=" ", col.names="label")
train_set<-read.csv("./UCI HAR Dataset/train/X_train.txt",header=FALSE, 
                    sep="", dec=".")

#4. Appropriately labels the data set with descriptive variable names. 
names(train_set)<-features$V2

#Preparing one data frame for train data.
train<-bind_cols(train_subject, train_labels, train_set)

#Removing duplicated columns from the train_set
unique_train<-train[, !duplicated(colnames(train))]

#2. Extracts only the measurements on the mean and standard deviation for 
#each measurement. 
final_train<-select(unique_train, subject, label, contains("mean"), contains("std"))

#1. Merges the training and the test sets to create one data set.
all<-bind_rows(final_test, final_train)

#3. Uses descriptive activity names to name the activities in the data set.
#5. From the data set in step 4, creates a second, independent tidy data set
#with the average of each variable for each activity and each subject.
final<-merge(all, activity, by.x="label", by.y="ID") %>%
  select(-label) %>%
  gather(measurements, value, -subject, -activity) %>%
  group_by(subject, activity, measurements) %>%
  summarize(mean=mean(value))

#Writing the tidy dataset into a new txt file.
write.table(final, file="tidy_data_set.txt", sep="\t", quote=FALSE, row.names=FALSE)