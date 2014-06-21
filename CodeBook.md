Cleaning Data Coursera: CodeBook
====================

Data Source:
--------------------
    http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
  
Data Full Description:
--------------------
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#### Variables Used For Project Task #1
* sub.train - table extracted from the file "train/subject_train.txt"
* y.train - table extracted from the file "train/x_train.txt"
* x.train - table extracted from the file "train/y_train.txt"
* sub.test - table extracted from the file "test/subject_test.txt"
* y.test - table extracted from the file "test/x_test.txt"
* x.test - table extracted from the file "test/y_test.txt"
* set.train - sub.train, y.train, x.train together in one table
* set.test - sub.test, y.test, x.test together in one table
* set.all - final data set of set.train and set.test

##### Column Names explanation for set.all table

    I kept most of the column names the same with the exception of: SubjectID, and Activity
    to avoid error messages when cbinding the tables together because of similarly named
    columns.

#### Variables Used For Project Task #2
* features - table extracted from the file "features.txt"
* feat1 - table of only features that are means or standard deviations
* charvec - character vector of the column names which correspond to the features that
            I wanted to select from the whole set.
 
#### Variables Used For Project Task #3
* act.labels - table extracted from the file "activity_labels.txt"
  
##### Explanation 
    I needed act.labels to decrypt the Activity column of set.all - by merging the two tables
  
#### Variables Used For Project Task #4
* features.names - character vector of the feature names

##### Explanation
    I needed features.names in order to change the column names of set.all table

#### Variables Used For Project Task #5
* tidy.set - independent tidy data frame with the average of each variable for each activity 
              and each subject. 
  
#### Final Output File
* "tidyset.txt" - text file to write tidy.set table to