##CodeBook
### ver1.0 from 15.05.2018

###This code book describes variables, data, and data transformations. Final Data set presented in tidy.txt.	

###The “activity” variable

###Possible values of the “activity” are: WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING STANDING LAYING

###The “subject” variable

###The subject variable is an integer between 1 and 30, corresponding to the 30 volunteers that participated in measurements.

###The mean measurements contain "Mean" into their names
###The standart deviation measurements contain "Std" into their names

###Transformations:

###1. Merged the training and the test sets into one data set
###2. Extracted only measurements on the mean and standard deviation 
###3. Names of measurement updated for better readability:
###      - deleted "()" and "-" symbols from names of measurements
###      - changed "str" into "Str" and "mean" into "Mean" 
###4. Created the tidy data set with the average of each variable for each activity and each subject

###The full list of measurements names:

"tBodyAcc.Mean.X"
"tBodyAcc.Mean.Y"
"tBodyAcc.Mean.Z"
"tBodyAcc.Std.X"
"tBodyAcc.Std.Y"
"tBodyAcc.Std.Z"
"tGravityAcc.Mean.X" tGravityAcc.Mean.Y"
"tGravityAcc.Mean.Z"
"tGravityAcc.Std.X"
"tGravityAcc.Std.Y"
"tGravityAcc.Std.Z"
"tBodyAccJerk.Mean.X"
"tBodyAccJerk.Mean.Y"
"tBodyAccJerk.Mean.Z"
"tBodyAccJerk.Std.X"
"tBodyAccJerk.Std.Y"
"tBodyAccJerk.Std.Z"
"tBodyGyro.Mean.X"
"tBodyGyro.Mean.Y"
"tBodyGyro.Mean.Z"
"tBodyGyro.Std.X"
"tBodyGyro.Std.Y"
"tBodyGyro.Std.Z"
"tBodyGyroJerk.Mean.X"
"tBodyGyroJerk.Mean.Y"
"tBodyGyroJerk.Mean.Z"
"tBodyGyroJerk.Std.X"
"tBodyGyroJerk.Std.Y"
"tBodyGyroJerk.Std.Z"
"tBodyAccMag.Mean"
"tBodyAccMag.Std"
"tGravityAccMag.Mean"
"tGravityAccMag.Std"
"tBodyAccJerkMag.Mean"
"tBodyAccJerkMag.Std"
"tBodyGyroMag.Mean"
"tBodyGyroMag.Std"
"tBodyGyroJerkMag.Mean"
"tBodyGyroJerkMag.Std"
"fBodyAcc.Mean.X"
"fBodyAcc.Mean.Y"
"fBodyAcc.Mean.Z"
"fBodyAcc.Std.X"
"fBodyAcc.Std.Y"
"fBodyAcc.Std.Z"
"fBodyAcc.MeanFreq.X"
"fBodyAcc.MeanFreq.Y"
"fBodyAcc.MeanFreq.Z"
"fBodyAccJerk.Mean.X"
"fBodyAccJerk.Mean.Y"
"fBodyAccJerk.Mean.Z"
"fBodyAccJerk.Std.X"
"fBodyAccJerk.Std.Y"
"fBodyAccJerk.Std.Z"
"fBodyAccJerk.MeanFreq.X"
"fBodyAccJerk.MeanFreq.Y"
"fBodyAccJerk.MeanFreq.Z"
"fBodyGyro.Mean.X"
"fBodyGyro.Mean.Y"
"fBodyGyro.Mean.Z"
"fBodyGyro.Std.X"
"fBodyGyro.Std.Y"
"fBodyGyro.Std.Z"
"fBodyGyro.MeanFreq.X"
"fBodyGyro.MeanFreq.Y"
"fBodyGyro.MeanFreq.Z"
"fBodyAccMag.Mean"
"fBodyAccMag.Std"
"fBodyAccMag.MeanFreq"
"fBodyBodyAccJerkMag.Mean"
"fBodyBodyAccJerkMag.Std"
"fBodyBodyAccJerkMag.MeanFreq"
"fBodyBodyGyroMag.Mean"
"fBodyBodyGyroMag.Std"
"fBodyBodyGyroMag.MeanFreq"
"fBodyBodyGyroJerkMag.Mean"
"fBodyBodyGyroJerkMag.Std"
"fBodyBodyGyroJerkMag.MeanFreq"




