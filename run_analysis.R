# Point directory to the folder that houses the files and activates the data.table package
setwd("C:/Users/Derek/Desktop/Assignment 3/Data/UCI HAR Dataset/data")
library(data.table)

# Read all of the files that are to be merged
features<-read.table("features.txt")
act<-read.table("activity_labels.txt")
xtrain<-read.table("x_train.txt")
trsubject<-read.table("subject_train.txt")
ytrain<-read.table("y_train.txt")
xtest<-read.table("x_test.txt")
tesubject<-read.table("subject_test.txt")
ytest<-read.table("y_test.txt")

# Merge the training sets and add variable headings to the training set data
alldat<-rbind(xtrain,xtest)
colnames(alldat)<-factor(features[,2])

# Extract the mean and standard deviation for each measurement
colnames(alldat) = grep(".*Mean.*|.*Std.*|.*mean*.|.*std.*", colnames(alldat))
features1<-grep(".*Mean.*|.*Std.*|.*mean*.|.*std.*", features[,2])
features<-features[features1,]

# Create more descriptive variable names
features[,2] = gsub('-mean', 'Mean', features[,2]);features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])
features[,2] = gsub('tBodyAcc', 'Body Acceleration (time)', features[,2])
features[,2] = gsub('tGravityAcc', 'Gravity Acceleration (time)', features[,2])
features[,2] = gsub('tBodyGyro', 'Body Gyro (time)', features[,2])
features[,2] = gsub('fBodyGyro', 'Body Gyro (frequency)', features[,2])
features[,2] = gsub('fGravityAcc', 'Gravity Acceleration (frequency)', features[,2])
features[,2] = gsub('fBodyAcc', 'Body Acceleration (frequency)', features[,2])
features[,2] = gsub('fBodyBodyAcc', 'Body  Body Acceleration (frequency)', features[,2])
features[,2] = gsub('fBodyBodyGyro', 'Body  Body Gyro (frequency)', features[,2])
colnames(alldat)<-factor(features[,2])

# Merge the training and test data subjects into a single file and append it to the merged measurement file
allsubjects<-rbind(trsubject,tesubject)
combine1<-cbind(allsubjects,alldat)
colnames(combine1)[1]<-"Subject"

# Merge the training and test activities files, append these activities labels to the merged measurement file
allacts<-rbind(ytrain,ytest)
tidydat<-cbind(allacts,combine1)
tidydat$V1[which(tidydat$V1==1)]<-as.character(factor(act[,2][1]))
tidydat$V1[which(tidydat$V1==2)]<-as.character(factor(act[,2][2]))
tidydat$V1[which(tidydat$V1==3)]<-as.character(factor(act[,2][3]))
tidydat$V1[which(tidydat$V1==4)]<-as.character(factor(act[,2][4]))
tidydat$V1[which(tidydat$V1==5)]<-as.character(factor(act[,2][5]))
tidydat$V1[which(tidydat$V1==6)]<-as.character(factor(act[,2][6]))
colnames(tidydat)[1]<-"Activity"

# Eliminate unwanted columns and write the tidy data set to the working directory
tidy<-data.table(tidydat)
tidy[,89:563]=NULL
write.table(tidy,"tidy1.txt", sep="\t", col.names = NA)

# Create a second independent tidy data set with the average of the extracted measurements and write the data set to the working directory
tidy<-aggregate(tidy,list(Activity=tidy$Activity,Subject=tidy$Subject),mean)
tidy[,4]=NULL
tidy[,3]=NULL
write.table(tidy,"tidy2.txt", sep="\t", col.names = NA)
