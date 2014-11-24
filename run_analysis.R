## Run analysis script

## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average 
##      of each variable for each activity and each subject.

#   Load data
dataFolder<-"UCI\ HAR\ Dataset"
testFolder<-"test"
trainFolder<-"train"
testDir<-file.path(dataFolder,testFolder)
trainDir<-file.path(dataFolder,trainFolder)

# General data
features<-read.table(file.path(dataFolder, "features.txt"))
# Clean names for uses as column names
features$V2<-make.names(features$V2)
names(features)[2]<-"cleanNames"
activityLabels<-read.table(file.path(dataFolder, "activity_labels.txt"))

# Test data
testXData<-read.table(file.path(testDir, "X_test.txt"), col.names=features$cleanNames)
testYData<-read.table(file.path(testDir, "y_test.txt"), col.names=c("Activity"))
testSubjectData<-read.table(file.path(testDir, "subject_test.txt"), col.names=c("SubjectID"))
# Rename activity levels
testYData$Activity<-factor(testYData$Activity,labels=activityLabels$V2)
# Combine test data
## If identifying train v. test is needed, add use this code
# testCombined <- cbind(c(rep("Test", nrow(testYData))), testSubjectData, testYData, testXData)
# names(testCombined)[1]<-"Type"
testCombined <- cbind(testYData, testSubjectData, testXData)

# Train data
trainXData<-read.table(file.path(trainDir, "X_train.txt"), col.names=features$cleanNames)
trainYData<-read.table(file.path(trainDir, "y_train.txt"), col.names=c("Activity"))
trainSubjectData<-read.table(file.path(trainDir, "subject_train.txt"), col.names=c("SubjectID"))
# Rename activity levels
trainYData$Activity<-factor(trainYData$Activity,labels=activityLabels$V2)
# Combine training data
## If identifying train v. test is needed, add use this code
# trainCombined <- cbind(c(rep("Train", nrow(trainYData))), trainSubjectData, trainYData, trainXData)
# names(trainCombined)[1]<-"Type"
trainCombined <- cbind(trainYData, trainSubjectData, trainXData)

# Combine into a single table. Append training data to end of test data
allData <- rbind(testCombined, trainCombined)

## Extract measurements (mean & std deviation)
# Essentially drop all metrics that don't have "std" or "mean" in the column name
for (n in features$cleanNames){
    # if this name does not have "std" or "mean" (case insensitive)
    if (length(grep("(std|mean)",n,ignore.case=TRUE,value=TRUE)) == 0) {
            allData[[n]]<-NULL
    }
}
# Get condensed list of feature names
conNames<-names(allData)[4:ncol(allData)]

## Create new tidy data set
tidy <- aggregate(. ~ Activity + SubjectID, data=allData, FUN=mean)

## Save tidy data
write.csv(tidy, "tidy.csv", row.names=FALSE)