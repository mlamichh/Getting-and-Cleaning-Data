#Reading data from data sets. 
xTest <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
xTrain <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
yTrain <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)

subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)

features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)
activityType <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE)

# Providing header for datas.
colnames(xTrain) <- features[,2]
colnames(yTrain) <- "activityID"
colnames(subjectTrain) = "subjectID"
colnames(activityType) <- c("activityID", "activityType")

colnames(xTest) <- features[,2]
colnames(yTest) <- "activityID"
colnames(subjectTest) = "subjectID"

# Merging datas to form train and test data frame.
trainData <- cbind(yTrain, subjectTrain, xTrain)
testData <- cbind(yTest, subjectTest, xTest)

# merged Data
mergedData = rbind(testData, trainData)

# Select Data associated with mean and SD.
colNames <- colnames(mergedData)
selectMeanSD <- (grepl("activity",colNames)|grepl("subject",colNames) |grepl("mean",colNames)|grepl("Mean",colNames)|grepl("std",colNames))
finalData <- mergedData[selectMeanSD]

# Merge data with activity Type
finalData = merge(finalData,activityType,by='activityID', all.x=TRUE)

colNames <- colnames(finalData)

# Cleaning names of the variables

colNames <- gsub("\\()", "", colNames)
colNames <- gsub("-mean", "Mean", colNames)
colNames <- gsub("-std", "SD", colNames)
colNames <- gsub("BodyBody", "Body", colNames)

# Providing new variable names for finalData.

colnames(finalData) <- colNames

# Removing Activity type.
finalData$activityType <- NULL

# final clean data.
cleanData <- aggregate(finalData, by=list(activityID=finalData$activityID, subjectID=finalData$subjectID), mean)

# Activity ID and Subject ID appeared data frame twice hence removed repeated presence of the column.
cleanData[,1] <- NULL
cleanData[,3] <- NULL

write.table(cleanData, file="tidyData.txt", row.names=FALSE)