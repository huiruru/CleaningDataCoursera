## Please uncomment the section below if the dataset has not been 
## downloaded into your working directory already. 
## If you have, please proceed.

## Download file and unzip
#   temp <- tempfile()
#   download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)
#   unzip(temp)
#   unlink(temp)

## set working directory (if not already in /UCI HAR Dataset directory)
## please comment out the code below if already in.
  setwd("./UCI HAR Dataset")
  
## Project task 1: Merge the training and the test sets to create one data set.
  sub.train <- read.table("train/subject_train.txt", sep ="", na.strings = "NA")
  colnames(sub.train) <- "SubjectID"
  y.train <- read.table("train/y_train.txt", sep ="", na.strings = "NA")
  colnames(y.train) <- "Activity"
  x.train <- read.table("train/x_train.txt", sep ="", na.strings = "NA")

  # training set
  set.train <- cbind(sub.train, y.train, x.train)
  
  sub.test <- read.table("test/subject_test.txt", sep ="", na.strings = "NA")
  colnames(sub.test) <- "SubjectID"
  y.test <- read.table("test/y_test.txt", sep ="", na.strings = "NA")
  colnames(y.test) <- "Activity"  
  x.test <- read.table("test/x_test.txt", sep ="", na.strings = "NA")

  # test set
  set.test <- cbind(sub.test, y.test, x.test)

  # final set
  set.all <- rbind(set.train, set.test)
  
  # remove unused tables
  rm(set.test, set.train, sub.test, sub.train, x.test, x.train, y.test, y.train)
  
## Project Task 2 Extract only the measurements on the mean and standard deviation.

    # First create table mapping of column names in train and test files from features.txt
    features <- read.table("features.txt", check.names = FALSE)
    feat1 <- rbind(features[grep("mean()",features$V2),], features[grep("std()",features$V2),])
    feat1 <- cbind(feat1, varname=mapply(function(x) paste(c("V",x),collapse=""),feat1$V1)) 
    feat1[,"V2"] <- sub("\\(\\)","",feat1$V2)
    feat1[,"V2"] <- gsub("-","",feat1$V2)
  
    # select column names matching features for mean and std into charactervector
    charvec <- as.character(feat1$varname)
  
    # set table to only have those feature measurements
    set.all <- set.all[,c("SubjectID","Activity", charvec)]

## Project Task 3 Use descriptive activity names to name the activities in the data set
  act.labels <- read.table("activity_labels.txt")
  colnames(act.labels) <- c("ActCode","Descript")
  set.all <- merge(act.labels, set.all, by.x = "ActCode", by.y = "Activity")
  set.all <- set.all[,-1]
  
## Project Task 4 Appropriately label the data set with descriptive variable names
  features.names  <- feat1[,"V2"]
  colnames(set.all) <- c("Activity", "SubjectID",features.names)
    
## Project Task 5 Create a second, independent tidy data set with the average of each 
## variable for each activity and each subject. 
  tidy.set <- aggregate(set.all[,-c(1:2)], by=list(set.all$SubjectID,set.all$Activity), FUN=mean)
  colnames(tidy.set) <- c("SubjectID", "Activity", features.names)

## Clean up 
  rm(set.all, features, feat1, act.labels, charvec, features.names)  
  
## Write tidy set to csv file 
  write.table(tidy.set, file="tidyset.txt", sep = " ")
