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

# melt so that there is only one observation per row and split up the feature column to its components
train_data_melt <- melt(train_data, id.vars=c('RecordID', 'SubjectID', 'ActivityName', 'DataSet'))
train_data_melt[, Domain := substr(variable, 1, 1)]
train_data_melt[Domain == 't', Domain := 'time']
train_data_melt[Domain == 'f', Domain := 'frequency']
train_data_melt[, Feature := sapply(str_split(train_data_melt$variable, '-'), function(x){x[1]})]
train_data_melt[, Measurement := sapply(str_split(train_data_melt$variable, '-'), function(x){x[2]})]
train_data_melt[, Measurement := gsub('\\(\\)', '', Measurement)]
train_data_melt[, Axis := sapply(str_split(train_data_melt$variable, '-'), function(x){x[3]})]
train_data_melt[, variable := NULL]

# merge with self to get one observation of mean and std per row
train_data_tidy <- merge(train_data_melt[Measurement=='mean'], 
                         train_data_melt[Measurement=='std'],
                         by=c('RecordID', 'SubjectID', 'ActivityName', 'DataSet', 'Domain', 'Feature', 'Axis'))
setnames(train_data_tidy, old=c('value.x', 'value.y'), new=c('Mean', 'Std'))
train_data_tidy[,Measurement.x := NULL]
train_data_tidy[,Measurement.y := NULL]



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

# melt so that there is only one observation per row and split up the feature column to its components
test_data_melt <- melt(test_data, id.vars=c('RecordID', 'SubjectID', 'ActivityName', 'DataSet'))
test_data_melt[, Domain := substr(variable, 1, 1)]
test_data_melt[Domain == 't', Domain := 'time']
train_data_melt[Domain == 'f', Domain := 'frequency']
test_data_melt[, Feature := sapply(str_split(test_data_melt$variable, '-'), function(x){x[1]})]
test_data_melt[, Measurement := sapply(str_split(test_data_melt$variable, '-'), function(x){x[2]})]
test_data_melt[, Measurement := gsub('\\(\\)', '', Measurement)]
test_data_melt[, Axis := sapply(str_split(test_data_melt$variable, '-'), function(x){x[3]})]
test_data_melt[is.na(Axis), Axis := 'NA']
test_data_melt[, variable := NULL]

# merge with self to get one observation of mean and std per row
test_data_tidy <- merge(test_data_melt[Measurement=='mean'], 
                        test_data_melt[Measurement=='std'],
                        by=c('RecordID', 'SubjectID', 'ActivityName', 'DataSet', 'Domain', 'Feature', 'Axis'))
setnames(test_data_tidy, old=c('value.x', 'value.y'), new=c('Mean', 'Std'))
test_data_tidy[,Measurement.x := NULL]
test_data_tidy[,Measurement.y := NULL]


### Join test and training data sets and save
tidy_data <- rbind(train_data_tidy, test_data_tidy)
write.table(tidy_data, 'combined.txt', row.name=FALSE)

### Compute averages and save
averages <- tidy_data[, .(AverageMean=mean(Mean), AverageStd=mean(Std)), by=.(SubjectID, ActivityName, Domain, Feature, Axis)]
write.table(averages, 'averages.txt', row.name=FALSE)
