# Codebook

This dataset is based on the experiment regarding recognition of human activity using smartphones (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The following description was constructed using the description of the experiment raw data (Human Activity Recognition Using Smartphones Dataset by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto), available on the above link. Warning: this is complicated.

## Experimental design and background.
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The experiments have been video-recorded to label the data manually.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

## Raw data.
(1) Time domain signals: the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ, body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ), Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ), .the magnitude of these three-dimensional signals (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag);
(2) Frequency domain signals, obtained using a Fast Fourier Transform (fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag). 
(3) The set of variables that were estimated from these signals: mean value, standard deviation, median absolute deviation, largest value in array, smallest value in array, signal magnitude area, energy measure, Interquartile range, signal entropy, autorregresion coefficients with Burg order equal to 4, correlation coefficient between two signals, index of the frequency component with largest magnitude, weighted average of the frequency components to obtain a mean frequency, skewness of the frequency domain signal, kurtosis of the frequency domain signal, energy of a frequency interval within the 64 bins of the FFT of each window, angle between to vectors
Variables were normalized and bounded within [-1,1].

## Processed data.
The following operations were performed on the data: (1) the training data and the test data were merged into a combined dataset; (2) the variables that represented the mean and standard deviation for each measurement were kept, the others were excluded from the dataset; (3) the variable that represents types of activity was converted into a factor variable with the appropriate labels; (4) all variables were labeled with descriptive names; (5) each variable was averaged in order to obtain one observation per each combination of subject (person that participated in the experiment) and type  of activity.
The obtained dataset has 180 observations in 68 variables.

## Variables:
### Identifiers
subject: identifier of a participant 
activity: type of activity
             1 - WALKING
             2 - WALKING_UPSTAIRS
             3 - WALKING_DOWNSTAIRS
             4 - SITTING
             5 - STANDING
             6 -  LAYING

### Signals:
(the following indicators were given as a set of variables each, that is one variable for each combination of statistical measure (mean, standard deviation)  and dimension (X,Y,Z). For example, for 'tBodyAcc”: 'tBodyAcc-mean-X', 'tBodyAcc-mean-Y', 'tBodyAcc-mean-Z', 'tBodyAcc-std-X', 'tBodyAcc-std-Y', 'tBodyAcc-std-Z').
* tBodyAcc: body acceleration signal (time domain) 
* tGravityAcc: gravity acceleration signal (time domain)
* tBodyAccJerk: Jerk signal (linear acceleration, time domain)
* tBodyGyro:  angular velocity (time domain)
* tBodyGyroJerk: Jerk signal (angular velocity, time domain)
* fBodyAcc: body acceleration signal (frequency domain)
* fBodyAccJerk: Jerk signal (linear acceleration, frequency domain)
* fBodyGyro:  angular velocity (frequency domain)

### Magnitude
The magnitude of the above-mentioned three-dimensional signals (calculated using the Euclidean norm) 
(the following indicators were given as a set of variables each, that is one variable for each combination of statistical measure (mean, standard deviation)  and dimension (X,Y,Z) for each indicator. For example, for 'tGravityAccMag”: tGravityAccMag-mean' and 'tGravityAccMag-std').

* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAccMag
* fBodyBodyAccJerkMag
* fBodyBodyGyroMag
* fBodyBodyGyroJerkMag