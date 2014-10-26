The R script run\_analysis.R generates a tidy set from the source Samsung UCI HAR Dataset
as described below :-

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each 
measurement.
3. Uses descriptive activity names to name the activities in the data set
using the data in activity_labels.txt
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set 
with the average of each variable for each activity and each subject.

Refer the subsequent sections and the comments in run|analysis.R for more 
information on these steps.

The detailed listing of the variables in the output tidy data set are provided
in CodeBook.md.

Running the script
===================
run_analysis.R script generates the tidy data set.

It expects the unzipped Samsung UCI HAR dataset in the current working 
directory i.e. we should have the following structure under the current 
directory :-  
    UCI HAR Dataset  
                    activity_labels.txt, features.txt,  
                    features_info.txt,README.txt  
                    + test  
                       ...  
                    + train  
                       ...  


Output File
============
run\_analysis.R produces output file avg\_data\_tidy.txt in the current directory.

This output file contains a tidy data set. For each activity and each subject, it 
contains the average/mean of certain _selected_ variables from the source 
Samsung UCI HAR dataset. The training and test subsets of the source dataset
are combined together before the averages are computed.

The _selected_ variables from the source dataset referred to above are the 
ones which are the mean and standard deviation of certain measured signals 
i.e. they have _mean()_ or _std()_ in their names as per the 
features_info.txt document. Out of the 561 variables that are present in the
source data set, 66 variables get selected by this criterion.

The corresponding output file variable names are suffixed with _.avg_ to indicate 
that they are averages, per activity+subject, of the source variables, which in 
turn are either the mean() or std() of the measured signal variables all within the 
source dataset as explained above. Note that the '(', ')' and '-' characters in 
variable names are not allowed by read.table and are automatically converted into
'.'. So we strip '(' and ')' and replace '-' with '.' for the feature variable
names.  
e.g. for the source variable fBodyAccMag-mean(), the output average variable is
fBodyAccMag.mean.avg and it contains the mean of fBodyAccMag-mean() values for
each SubjectId and ActivityName (which are the other 2 variables).

Since there are 30 SubjectIds and 6 ActivityNames, the output dataset has 30x6=180
rows plus the header with variable names. The number of variables are 66+2=68.

The generated tidy dataset can be read into an R data frame as follows :-  
avg\_data <- read.table('avg\_data_tidy.txt', header=TRUE)