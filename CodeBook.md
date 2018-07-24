# Getting and Cleaning Data Course Projekt 

## The Data

The data used for this assignment is the **Human Activity Recognition Using Smartphones Dataset Version 1.0** which was provided through the course homepage.
A brief information regarding the data was given trought the included README.txt file. 

The main part of UCI_HAR_Dataset consists of a test data set, a train data set, activity labels and features and this was the part which would be relevant for the analysis. The data was provided trought text files and had to be read into R.

The **test data** and the **train data** were divided into **the X set of data**, **the y set of data** and **the subject set of data**.

The **activity labels** come in **five stages**: 1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING.

The **features** where more detailed. The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. The complete list of variables of each feature vector is available in **features.txt** .

## The Variables and the Transformation

In order to start with the analysis I had to read the files into R: the train data files for X and y, the test data files for X and y, the subject files, the feature file and the activity labels file.

I merged **the train data set for X** with **the test data set for X**, the same for **the y files** and **the subject files**.

After that I worked with the merged X data set and the features data set. First, I extracted (with **grep()** ) the position for the measurements on mean and sd from the features file. I then created a new X data set only with measurements on mean and sd:

tBodyAccMeanX
tBodyAccMeanY
tBodyAccMeanZ
tBodyAccStdX
tBodyAccStdY
tBodyAccStdZ
tGravityAccMeanX
tGravityAccMeanY
tGravityAccMeanZ
...

The next step was to put a label on the variables.
I used descriptive activity names to name the activities in the data set. Using **names()**, I named the merged y data set and the merged subject data set. After that I labeled the extracted X data with descriptive variable names by using **names()** again.

The last and final step was to create a second tidy data set from the data set above as an independent tidy data set, with the average of each variable for each activity and each subject.
First I just used **cbind()** to put the extracted X data and the data sets of y and subject together.
Using **aggregate()** on the new data set, Icalculated the mean for each variable for each activity and each subject.

My last step was to write the tidy data into a text file.
