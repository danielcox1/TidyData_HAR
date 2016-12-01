# Codebook for Tidy Human Activity Recognition Using Smartphones Dataset
This is a tidy version of the data[1] available here: https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

## 1. Background on Data Collected
The following is the original description of the features of the original dataset:

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
>
> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
>
> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
>
> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
>
> These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
>
> Features are normalized and bounded within [-1,1].

## 2. Combined Training and Test Data
The combined training and test data is available in the space separated text file "combined.txt".

### 2.1 Transformations Performed
The subject information, activity information, and measured data for both training and test datasets were merged into a single dataset. Only measurements on the mean and standard deviation were retained. The data were then transformed into a long table, so each observation of each measurement constitutes a single row. The measurement descriptions are split into two columns, one that describes the measurement feature and one that describes the axis of the measurement, if applicable. Additionally, a column denoting the domain of the measurement (time or frequency) was added, and whether the data originated in the testing or training data set.

### 2.2 Column Descriptions
1. RecordID
 * Data were collected at 50 Hz. This column contains an index of the temporal dimension of the data.
 * Values span from 1 to 409, and restart at 1 for each participant

2. SubjectID
 * Each participant was assigned a unique number.
 * Values span from 1 to 30

3. ActivityName
 * The activity that was being performed.
 * Values can be:
    * WALKING
    * WALKING_UPSTAIRS
    * WALKING_DOWNSTAIRS
    * SITTING
    * STANDING
    * LAYING

4. DataSet
 * Subjects were randomly grouped into a "Training" group and a "Test" group.
 * Values can be:
    * Training
    * Test

5. Domain
 * Specifies the domain of the measurements.
 * Values can be:
    * Time
    * Frequency

6. Feature
 * The type of measurement of the row. See background section for more details.
 * Values can be:
    * fBodyAcc
    * fBodyAccJerk
    * fBodyAccMag
    * fBodyBodyAccJerkMag
    * fBodyBodyGyroJerkMag
    * fBodyBodyGyroMag
    * tBodyAcc
    * tBodyAccJerk
    * tBodyAccJerkMag
    * tBodyAccMag
    * tBodyGyro
    * tBodyGyroJerk
    * tBodyGyroJerkMag
    * tBodyGyroMag
    * tGravityAcc
    * tGravityAccMag

7. Axis
 * The axis of measurement.
 * Values can be:
    * X
    * Y
    * Z
    * NA

8. Mean
 * The normalized mean value of the signal.

9. Std
 * The normalized standard deviation of the signal.


## 3. Summary Data Set
Averages of each variable for each activity and subject have been calculated and are available i nthe space separated text file "averages.txt".

### 3.1 Transformations Performed
The subject information, activity information, and measured data for both training and test datasets were merged into a single dataset. Only measurements on the mean and standard deviation were retained. The data were then transformed into a long table, so each observation of each measurement constitutes a single row. The measurement descriptions are split into two columns, one that describes the measurement feature and one that describes the axis of the measurement, if applicable. Additionally, a column denoting the domain of the measurement (time or frequency) was added. The average of the observed means and standard devations was calculated for each measurement for each subject and activity.

### 3.2 Column Descriptions
1. SubjectID
 * Each participant was assigned a unique number.
 * Values span from 1 to 30

2. ActivityName
 * The activity that was being performed.
 * Values can be:
    * WALKING
    * WALKING_UPSTAIRS
    * WALKING_DOWNSTAIRS
    * SITTING
    * STANDING
    * LAYING

3. Domain
 * Specifies the domain of the measurements.
 * Values can be:
    * Time
    * Frequency

4. Feature
 * The type of measurement of the row. See background section for more details.
 * Values can be:
    * fBodyAcc
    * fBodyAccJerk
    * fBodyAccMag
    * fBodyBodyAccJerkMag
    * fBodyBodyGyroJerkMag
    * fBodyBodyGyroMag
    * tBodyAcc
    * tBodyAccJerk
    * tBodyAccJerkMag
    * tBodyAccMag
    * tBodyGyro
    * tBodyGyroJerk
    * tBodyGyroJerkMag
    * tBodyGyroMag
    * tGravityAcc
    * tGravityAccMag

5. Axis
 * The axis of measurement.
 * Values can be:
    * X
    * Y
    * Z
    * NA

6. Mean
 * The normalized mean value of the signal.

7. Std
 * The normalized standard deviation of the signal.

