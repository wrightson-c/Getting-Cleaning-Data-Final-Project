

#Read in all raw data and labels from unzipped directory
X_train <- read.table("Data/train/X_train.txt")
y_train <- read.table("Data/train/y_train.txt")
X_test <- read.table("Data/test/X_test.txt")
y_test <- read.table("Data/test/y_test.txt")
subject_test <- read.table("Data/test/subject_test.txt")
subject_train <- read.table("Data/train/subject_train.txt")
activity_labels <- read.table("Data/activity_labels.txt")
features <- read.table("Data/features.txt")


#Provide more descriptive names for the activity and subject variables
names(y_test)[1] <- "Activity"
names(y_train)[1] <- "Activity"

names(subject_test)[1] <- "Subject"
names(subject_train)[1] <- "Subject"


#Apply to the accelerometer and gyroscope measurement data the feature labels
names(X_test) <- features$V2
names(X_train) <- features$V2


#Combine the subject, activity, and measurement data into a single dataframe,
#       separately for the test and training data
test <- cbind(subject_test, y_test, X_test)
train <- cbind(subject_train, y_train, X_train)


#Create a variable to identify test vs. training subjects for the test
#       and training data sets
test$Population <- "test"
train$Population <- "train"


#Combine the test and train data sets
combined <- rbind(test, train)


#Remove all measurements except for std and mean
combined <- combined[ , grepl("mean\\(\\)|std\\(\\)|Subject|Activity|Population", names(combined))]


#Transform the activity data from numbers to the activity labels themselves
combined <- mutate(combined, Activity = activity_labels[Activity, 2])


#Label data set with the descriptive variable names
names(combined) <- gsub("^t", "Time ", names(combined))
names(combined) <- gsub("^f", "Frequency ", names(combined))
names(combined) <- gsub("BodyBody", "Body", names(combined))
names(combined) <- gsub("Body", "Body ", names(combined))
names(combined) <- gsub("Gravity", "Gravity ", names(combined))
names(combined) <- gsub("Acc", "Accelerometer ", names(combined))
names(combined) <- gsub("Gyro", "Gyrometer ", names(combined))
names(combined) <- gsub("Jerk", "Jerk ", names(combined))
names(combined) <- gsub("Mag", "Magnitude ", names(combined))
names(combined) <- gsub("-mean\\(\\)", "Mean", names(combined))
names(combined) <- gsub("-std\\(\\)", "SD", names(combined))
names(combined) <- gsub("-", " ", names(combined))


################################################################################

#Create a second tidy data set with the average of each variable, by activity
#       and subject
averages <- combined[, -69] %>% 
                group_by(Subject, Activity) %>% 
                summarize_all(mean)


#Rename the variables in this data set to all begin with "Mean"
names(averages)[3:68] <- paste("Mean", names(averages)[3:68])