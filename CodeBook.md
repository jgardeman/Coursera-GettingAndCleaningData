###CodeBook

####The Data:
The data came from the UCI machine learning repository.  The data is available: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  A description of the data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

####Variables:
* Activity: 6 different types of exercise (sitting, laying, etc)
* Subject: numbered 1-30, the 30 subjects in the experiment, the test subjects and training subjects were combined for simplification.
* The rest of the variables are various measurements such as "tbodyaccmeanx", "tbodyaccstdx", "tbodygyrojerkmeany", etc. These variables were extracted from the larger list based on mean() and std()

####The Code:
The code merged the test and training data sets into a single data set, replaced activity codes with descriptive names, filtered only variables wtih mean() and std(), added descriptive column names, and finally produced a tidy data set based on each subject and activity.  The final data set (tidy) was exported to a file "tidydata.txt"
