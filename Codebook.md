# Getting and Cleaning Data - codebook

It describes the variables, the data, and any transformations or work, which must be performed to clean up the data.

##The data source
Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Data Set Information
The dataset includes the following files:
- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

#Transformation
1. Preparing a test dataset with all variables - subject, label and measurements.
2. Preparing a train dataset with all variables - subject, label and measurements.
3. Merging test and train datasets.
4. Selecting the following columns: subject, label, means and std.
5. Gathering the value of measurements and grouping by subject and label.

#Variables

The tidy data contain the following variables:

1. Subject - values from 1 to 30

2. Activity - 1 of 6 names of activity

3. Measurements - 86 different names for measurement

4. Mean - a range from -1 to 1
