Cleaning Data Coursera: ReadMe
====================

Data Source:
--------------------
    http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
  
Data Full Description:
--------------------
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#### "run_analysis.R" script Step by Step:  

##### General Remarks  

_This is a very straight forward R script. I did not try to create functions to create the final tidy data._
__If the user did not download the dataset required or unzipped it, please uncomment lines 6 to 9 and then run.__
__If the user has the dataset unzipped in the working directory, s/he should just run this script to create a txt file of the final tidy data set.__   

---
1. Project task 1: Merge the training and the test sets to create one data set.
    * The script extracts from the relevant files from the unzipped data folder in to separate, appropriately named tables. First column binds the each of the tables to create either training or test set tables, then I row bind them to create one table and store it in set.all. Note: I prefer to remove unused tables from the global environment.

2. Project Task 2: Extract only the measurements on the mean and standard deviation.
    * Reads features.txt into its own table
    * Use grep function to grab only the features, column names that pertain to mean and standard deviation - e.g. any feature with mean, or std in the name.
    * Cleans up the feature names column - e.g. remove "()" and "-"
    * Creates another column with the proper column names ... e.g. with "V" infront of the column number called "varname"
    * Stores varname column values into a character vector called charvec
    * Set set.all table to only have those feature measurements by using charvec

3. Project Task 3: Use descriptive activity names to name the activities in the data set.
    * Reads activity_lables.txt into a table called act.labels
    * Corrects act.labels column names
    * Uses merge function to merge set.all with act.labels table
    * Removes duplicate column

4. Project Task 4: Appropriately label the data set with descriptive variable names.
    * Reads the column containing feature names from features table into a character vector named features.names
    * Renames the columns in set.all to finish the task

5. Project Task 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject.
    * Uses the aggregate function to grab the averages grouped by subjectid and activity and stores into a final table called tidy.set
    * Renames the columns in set.all to finish the task

6. Finally, writes tidy.set into a txt file in the directory.