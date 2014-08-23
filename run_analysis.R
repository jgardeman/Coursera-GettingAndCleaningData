
## Merge the training and the test sets to create one data set.
x_train <- read.table("./proj1/train/X_train.txt", sep = "")
x_test <- read.table("./proj1/test/X_test.txt", sep = "")
y_train <- read.table("./proj1/train/Y_train.txt", sep = "")
y_test <- read.table("./proj1/test/Y_test.txt", sep = "")
subject_train <- read.table("./proj1/train/subject_train.txt", sep = "")
subject_test <- read.table("./proj1/test/subject_test.txt", sep = "")
x_merge <- rbind(x_train, x_test)
y_merge <- rbind(y_train, y_test)
subject_merge <- rbind(subject_train, subject_test)
features <- read.table("./proj1/features.txt", sep="")

## Extract only the measurements on the mean and standard deviation for each measurement. 
mean_std <- grep("mean\\(\\)|std\\(\\)", features[,2])
x_merge_limited <- x_merge[,mean_std]
data <- cbind(y_merge, subject_merge, x_merge_limited)

## Uses descriptive activity names to name the activities in the data set
activities <- read.table("./proj1/activity_labels.txt")
activities[,2] <- tolower(activities[,2])
activities[,2] <- gsub('_', '', activities[,2])
allactivities <- activities[y_merge[,1], 2]
data[,1] <- allactivities

## Appropriately label the data set with descriptive variable names. 
new_features <- gsub('[()-]', '', features[mean_std,2])
new_features <- gsub('[0-9]', '', new_features)
new_features <- gsub(' ', '', new_features)
new_features <- tolower(new_features)
colnames(data) <- c("activity", "subject", new_features)

## Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
almosttidy <- melt(data, id.vars = c("activity", "subject"))
tidy <- dcast(almosttidy, activity + subject ~ variable, mean)

## Export tidy table to a text file.
write.table(tidy, file = "tidydata.txt", row.names = FALSE)
