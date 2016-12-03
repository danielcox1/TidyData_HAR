library(data.table)
library(stringr)

# read the 6 activity labels (each row in raw data set corresponds to 1 activity)
activity_labels <- fread('UCI HAR Dataset/activity_labels.txt')
setnames(activity_labels, c('ActivityID', 'ActivityName'))

# read the different features of the dataset
# (these describe what are in the columns of the data set)
features <- fread('UCI HAR Dataset/features.txt')
setnames(features, c('FeatureID', 'FeatureName'))


### Training data
# read the subject data (each row here corresponds to which subject the data came from)
train_subject <- fread('UCI HAR Dataset/train/subject_train.txt')
setnames(train_subject, c('SubjectID'))

# read the activity data (each row here corresponds to which activity the data came from)
train_activity <- fread('UCI HAR Dataset/train/y_train.txt')
setnames(train_activity, c('ActivityID'))

# read the training data, name the columns with the correct feature, and drop
# all columns that do not correspond to a mean or std measurement
train_data <- fread('UCI HAR Dataset/train/X_train.txt')
setnames(train_data, features$FeatureName)
train_data[, which(!grepl('^.+-mean\\(\\)|-std\\(\\).*$', colnames(train_data))) := NULL]

# add corresponding subject and activity data, identify this data set as the training data,
# and add a time record identifier 
train_data[, SubjectID := train_subject$SubjectID]
train_data[, ActivityID := train_activity$ActivityID]
train_data[, DataSet := 'Training']
train_data[, RecordID := 1:.N, by=SubjectID]

# merge activity label
setkey(activity_labels, 'ActivityID')
setkey(train_data, 'ActivityID')
train_data[activity_labels, ActivityName := ActivityName, by=.EACHI]
train_data[, ActivityID := NULL]



### Test Data
# read the subject data (each row here corresponds to which subject the data came from)
test_subject <- fread('UCI HAR Dataset/test/subject_test.txt')
setnames(test_subject, c('SubjectID'))

# read the activity data (each row here corresponds to which activity the data came from)
test_activity <- fread('UCI HAR Dataset/test/y_test.txt')
setnames(test_activity, c('ActivityID'))

# read the training data, name the columns with the correct feature, and drop
# all columns that do not correspond to a mean or std measurement
test_data <- fread('UCI HAR Dataset/test/X_test.txt')
setnames(test_data, features$FeatureName)
test_data[, which(!grepl('^.+-mean\\(\\)|-std\\(\\).*$', colnames(test_data))) := NULL]

# add corresponding subject and activity data, identify this data set as the training data,
# and add a time record identifier 
test_data[, SubjectID := test_subject$SubjectID]
test_data[, ActivityID := test_activity$ActivityID]
test_data[, DataSet := 'Test']
test_data[, RecordID := 1:.N, by=SubjectID]

# merge activity label
setkey(activity_labels, 'ActivityID')
setkey(test_data, 'ActivityID')
test_data[activity_labels, ActivityName := ActivityName, by=.EACHI]
test_data[,ActivityID := NULL]


### Join test and training data sets and save
tidy_data <- rbind(train_data, test_data)
write.table(tidy_data, 'combined.txt', row.name=FALSE)

### Compute averages and save
averages <- tidy_data[, lapply(.SD, mean), by=.(SubjectID, ActivityName), .SDcols=names(tidy_data)[1:66]]
write.table(averages, 'averages.txt', row.name=FALSE)
