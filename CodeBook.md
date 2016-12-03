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

## 2. Summary Data Set
Averages of each variable for each activity and subject have been calculated and are available in the space separated text file "averages.txt".

### 2.1 Transformations Performed
The subject information, activity information, and measured data for both training and test datasets were merged into a single dataset. Only measurements on the mean and standard deviation were retained. The average of the observed means and standard devations was calculated for each measurement for each subject and activity.

Note: this is a **wide** dataset, as the first round of student reviewers did not understand that **long** datasets are acceptable as tidy data. In my opinion, this data will be much harder to work with, but to each his or her own.

### 2.2 Column Descriptions
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
    
3. tBodyAcc-mean()-X
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
4. tBodyAcc-mean()-Y
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
5. tBodyAcc-mean()-Z
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
6. tBodyAcc-std()-X
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
7. tBodyAcc-std()-Y
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
8. tBodyAcc-std()-Z
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
9. tGravityAcc-mean()-X
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
10. tGravityAcc-mean()-Y
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
11. tGravityAcc-mean()-Z
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
12. tGravityAcc-std()-X
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
13. tGravityAcc-std()-Y
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
14. tGravityAcc-std()-Z
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
15. tBodyAccJerk-mean()-X
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
16. tBodyAccJerk-mean()-Y
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
17. tBodyAccJerk-mean()-Z
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
18. tBodyAccJerk-std()-X
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
19. tBodyAccJerk-std()-Y
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
20. tBodyAccJerk-std()-Z
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
21. tBodyGyro-mean()-X
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
22. tBodyGyro-mean()-Y
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
23. tBodyGyro-mean()-Z
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
24. tBodyGyro-std()-X
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
25. tBodyGyro-std()-Y
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
26. tBodyGyro-std()-Z
27. tBodyGyroJerk-mean()-X
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
28. tBodyGyroJerk-mean()-Y
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
29. tBodyGyroJerk-mean()-Z
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
30. tBodyGyroJerk-std()-X
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
31. tBodyGyroJerk-std()-Y
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
32. tBodyGyroJerk-std()-Z
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
33. tBodyAccMag-mean()
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
34. tBodyAccMag-std()
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
35. tGravityAccMag-mean()
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
36. tGravityAccMag-std()
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
37. tBodyAccJerkMag-mean()
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
38. tBodyAccJerkMag-std()
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
39. tBodyGyroMag-mean()
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
40. tBodyGyroMag-std()
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
41. tBodyGyroJerkMag-mean()
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
42. tBodyGyroJerkMag-std()
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
43. fBodyAcc-mean()-X
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
44. fBodyAcc-mean()-Y
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
45. fBodyAcc-mean()-Z
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
46. fBodyAcc-std()-X
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
47. fBodyAcc-std()-Y
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
48. fBodyAcc-std()-Z
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
49. fBodyAccJerk-mean()-X
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
50. fBodyAccJerk-mean()-Y
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
51. fBodyAccJerk-mean()-Z
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
52. fBodyAccJerk-std()-X
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
53. fBodyAccJerk-std()-Y
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
54. fBodyAccJerk-std()-Z
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
55. fBodyGyro-mean()-X
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
56. fBodyGyro-mean()-Y
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
57. fBodyGyro-mean()-Z
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
58. fBodyGyro-std()-X
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
59. fBodyGyro-std()-Y
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
60. fBodyGyro-std()-Z
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
61. fBodyAccMag-mean()
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
62. fBodyAccMag-std()
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
63. fBodyBodyAccJerkMag-mean()
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
64. fBodyBodyAccJerkMag-std()
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
65. fBodyBodyGyroMag-mean()
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
66. fBodyBodyGyroMag-std()
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
67. fBodyBodyGyroJerkMag-mean()
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 
68. fBodyBodyGyroJerkMag-std()
 * Average measurement for this feature (see feature descriptions in Section 1).
 * Values may span [-1, 1]
 