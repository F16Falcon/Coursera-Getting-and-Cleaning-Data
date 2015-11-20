Code Book

This Code Book describes the process used to collect and transform (rearrange and clean) data from eight files downloaded from a University of Cal, Irvine website (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 
Overview of the Data Set
Experiments were performed for “Human Activity Recognition” on a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone (Samsung Galaxy S II) on their waists. The experimenters captured 3-axial linear acceleration and 3-axial angular velocity measurements from the 30 volunteers. The resulting dataset was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data. 

The data set is comprised of the following eight files:
• activity_labels_txt: this file contains the six activities performed by the 30 subjects
• subject_test.txt and subject_train.txt: these files contain numbers from 1 to 30 representing the group of 30 volunteers. The test file contains 9    subjects consistent with the 30% who generated the test data, while the train file contains 21 subjects who generated the data for the training data.
• features.txt: this file contains the set of the 561 variable names that were estimated from experiment. (See section under Feature Selection for   additional information)
• x_train.txt and x_test.txt: these files contain the measurements for each variable estimated in the features file obtained from the group of 30   subjects. It is decomposed into two groups to form training and test data.
• y_train.txt and y_test.txt: these files contain the numbers from 1 through 6 corresponding to the six performance activities (e.g., 1 corresponds to   “WALKING”).  The two files contain 10,299 rows of number from 1 through 6.

Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of the 561 variables of each feature vector is available in 'features.txt'

Simplification of Variable Names

In order to make the variable names more meaningful, I reformatted them to display the base measurement (e.g., Body Acceleration) and the domain (e.g., time or frequency). For example, instead of  tBodyAcc-mean()-X, the variable name was transformed to                                          Body Acceleration (time) MeanX to reflect the variable estimated along the domain (time or frequency).

Description of Result

The result of the script is the production of two files. The first file is the consolidation of the eight files from the UCI website into a single, cleaned data set named tidy1.txt. In addition to providing a cleaned data set, the tidy1.txt file filters the data along the variable names that contain measurements of the mean or standard deviation.  The tidy1.txt file contains 10,299 rows and 88 columns, where the first two columns display the “Activity” and “Subject,” respectively. The other columns display 86 of the 561 estimated variable names from the features.txt data set, which measures the mean or standard deviation.

The second file created is derived from the tidy1.txt file and contains the same 88 columns from the tidy1.txt file. However, it takes the average of each variable for each activity and each subject, resulting in a file 180 rows and 88 columns.

