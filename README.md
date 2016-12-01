# README for Tidy Human Activity Recognition Using Smartphones Dataset
This is an R project to tidy the raw Human Activity Recognition Using Smartphones dataset. [1]

To run the script, ensure that the full data set [2] is uncompressed in the subdirectory "UCI HAR Dataset" of the working directory. This should include a features.txt file in the subdirectory and two other folders: test and train, each of which should include three text files.

Also, ensure the `data.table` and `stringr` libraries have been installed.

After these prerequisites are met, run the script by sourcing run_analysis.R. If successful, it will produce 2 text files:

* combined.txt
* averages.txt

The data contained in these files are described in CodeBook.md.

### References
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

[2] Available here: [d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
