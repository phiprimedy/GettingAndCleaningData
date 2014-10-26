#
# Expects unzipped Samsung UCI HAR dataset in current directory i.e.
# Under working directory we should have
#    UCI HAR Dataset
#                    activity_labels.txt, features.txt, features_info.txt,...
#                    + test
#                       ...
#                    + train
#                       ...
#
# Produces output file avg_data_tidy.txt in current directory. This output
# file contains a tidy data set. For each activity and each subject, it 
# contains the average/mean of certain selected variables from the source 
# Samsung UCI HAR dataset. 
# These selected variables are the ones which are the mean and standard deviation 
# of certain measured signals i.e. they have mean() or std() in their names as per
# the features_info.txt document.
# The corresponding output file variable names are suffixed with ".avg" to indicate 
# that they are averages (per activity+subject) of the source variables (which in 
# turn are either mean() or std() of the measured signal variables all within the 
# source dataset)
#

# for inner_join function
library(dplyr)

# Read the feature names file and set column names
features <- read.csv('UCI HAR Dataset/features.txt',sep="",header=FALSE, stringsAsFactors=FALSE)
dim(features)
names(features) <- c("Serial","FeatureName")

# Find the fetaures which are mean() or std(). Related to Step 2 of project
meanstd_features <- features[grep("(-mean\\(\\))|(-std\\(\\))",features$FeatureName),]
dim(meanstd_features)

# Read the activity names and set column names. Related to step 3 of project
activities <- read.csv('UCI HAR Dataset/activity_labels.txt',sep="",header=FALSE, stringsAsFactors=FALSE)
dim(activities)
names(activities) <- c("ActivityId", "ActivityName")

# Read training data for X, y and samples
train_X <- read.csv('UCI HAR Dataset/train/X_train.txt', sep="", header=FALSE, stringsAsFactors=FALSE)
train_y <- read.csv('UCI HAR Dataset/train/y_train.txt', sep="", header=FALSE, stringsAsFactors=FALSE)
train_subject <- read.csv('UCI HAR Dataset/train/subject_train.txt', sep="", header=FALSE, stringsAsFactors=FALSE)
dim(train_X)
dim(train_y)
dim(train_subject)

# Read test data for X, y and samples
test_X <- read.csv('UCI HAR Dataset/test/X_test.txt', sep="", header=FALSE, stringsAsFactors=FALSE)
test_y <- read.csv('UCI HAR Dataset/test/y_test.txt', sep="", header=FALSE, stringsAsFactors=FALSE)
test_subject <- read.csv('UCI HAR Dataset/test/subject_test.txt', sep="", header=FALSE, stringsAsFactors=FALSE)
dim(test_X)
dim(test_y)
dim(test_subject)

# Combine the X training and test data. Related to step 1 of project
combined_X <- rbind(train_X, test_X)

# Combine the y training and test data. Related to step 1 of project
combined_y <- rbind(train_y, test_y)
names(combined_y) <- c("ActivityId")

# Combine the subject training and test data. Related to step 1 of project
combined_subject <- rbind(train_subject, test_subject )
names(combined_subject) <- c("SubjectId")

dim(combined_X)
dim(combined_y)
dim(combined_subject)

# Extract out the mean and std features only from the combined X data. Related 
# to step 2 of project
combined_X_meanstd_features <- combined_X[, meanstd_features$Serial]
dim(combined_X_meanstd_features)

# Name all the variables. Use the source name but strip ( and ) characters and also
# replace - with '.'. Suffix it with .avg. 
# Note that (, ) and - are not valid characters for column names and will get read in
# as . when using read.table
# Related to step 4 of project.
col_names <- gsub("-",".",meanstd_features$FeatureName)
col_names <- gsub("\\(|\\)","",col_names)
col_names <- paste(col_names, ".avg", sep="")
names(combined_X_meanstd_features) <- col_names

length(names(combined_X_meanstd_features))

# NOTE: produces unpredictable order which results in incorrect operation. Hence not used.
# combined_y_named <- (merge(x=combined_y, y=activities, by="ActivityId"))[c("ActivityName")]

# Replace activity identifiers with activity names in the y data. Related to step 3
# of project
combined_y_named <- inner_join(x=combined_y, y=activities, by="ActivityId")[c("ActivityName")]
dim(combined_y_named)

# Put together the combined X, subject and y data into a single data frame
combined_data <- cbind(combined_X_meanstd_features, combined_subject, combined_y_named)
dim(combined_data)
names(combined_data)

# Create a dataset by aggregating the combined data by Activity Name and subject and 
# then find the mean for all the other variables for each aggregated group. Related 
# to step 5 of project
tidy_data <- aggregate(. ~ ActivityName+SubjectId, data=combined_data, mean)

# Sort by Activity Name for easier grouping. Not really essential.
tidy_data_sorted <- tidy_data[order(tidy_data$ActivityName),]

# Write new tidy data set to file
write.table(tidy_data_sorted, file="avg_data_tidy.txt", row.names=FALSE, quote=FALSE)
