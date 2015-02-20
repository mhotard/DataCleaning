# in the working directory of UCI HAR Dataset

library(data.table)
library(plyr)
library(dplyr)

#loading in the activity code and the features list
#features will be used as the variable names for the dataset

activ <- read.table("activity_labels.txt")
features <- read.table("features.txt", stringsAsFactors=FALSE)


#loading in the training data
dataTrain <- read.table(".\\train\\X_train.txt")
dataTrainLabel <- read.table(".\\train\\y_train.txt")
dataTrainSubject <- read.table(".\\train\\subject_train.txt")


#naming columns in the dataTrain file

names(dataTrain) <- features[,2]
names(dataTrainLabel) <- "Activity"
names(dataTrainSubject) <- "Subject"

#adding the activity label and subject columns to the dataTrain file
dataTrain <- cbind(dataTrainLabel, dataTrainSubject, dataTrain)

#loading in the testing data
dataTest <- read.table(".\\test\\X_test.txt")
dataTestLabel <- read.table(".\\test\\y_test.txt")
dataTestSubject <- read.table(".\\test\\subject_test.txt")

#giving the variables names for the dataset
names(dataTest) <- features[,2]
names(dataTestLabel) <- "Activity"
names(dataTestSubject) <- "Subject"

#combining the columns to one dataset for test data
dataTest <- cbind(dataTestLabel, dataTestSubject, dataTest)


#combining the test and train data into one set
moveData <- rbind(dataTest, dataTrain)

#creates a vector of all the variables names that contain mean or std
test <- grep("mean|std", names(moveData))

#adds the first two columns for activities and subjects to 
#this list since we want to keep those
test <- c(1,2, test)

#creates our new table with just the variables that we want
newData <- moveData[,test]

#renames the activities from numbers to the actual activity
newData$Activity <- as.character(newData$Activity)
newData$Activity <- sapply(newData$Activity, switch, '1'='Walking', '2'='Walking_Upstairs',
        '3'='Walking_Downstairs', '4'='Sitting', '5'='Standing', '6'='Laying')


#clean up the variables names some
dataNames <- names(newData)

dataNames <- gsub("BodyBody","Body",dataNames)
dataNames <- gsub("-","_", dataNames)
dataNames <- gsub("\\(\\)","", dataNames)

names(newData) <- dataNames

#step 5 calculating the means per activity per subject
tidyData <- newData %>% group_by(Activity,Subject) %>% summarise_each(funs(mean))

#writes the tidy data table to a file
write.table(tidyData, "tidy_data.txt", row.name=FALSE)

