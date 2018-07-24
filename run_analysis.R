### Peer-graded Assignment: Getting and Cleaning Data ###

library(data.table)
library(dplyr)

###################################################################
### Merge the training and the test sets to create one data set ###
###################################################################

### Read data from the train folder
data_train_X<-read.table("/.../UCI_HAR_Dataset/train/X_train.txt")
data_train_y<-read.table("/.../UCI_HAR_Dataset/train/y_train.txt")

data_train_subject<-read.table("/.../UCI_HAR_Dataset/train/subject_train.txt")

### Read data from the test folder
data_test_X<-read.table("/.../UCI_HAR_Dataset/test/X_test.txt")
data_test_y<-read.table("/.../UCI_HAR_Dataset/test/y_test.txt")

data_test_subject<-read.table("/.../UCI_HAR_Dataset/test/subject_test.txt")

### Read information on activity labels and features
activity_labels<-read.table("/.../UCI_HAR_Dataset/activity_labels.txt")
features<-read.table("/.../UCI_HAR_Dataset/features.txt")

### The data sets merging process
data_X<-rbind.data.frame(data_train_X,data_test_X)
data_y<-rbind.data.frame(data_train_y,data_test_y)

data_subject<-rbind.data.frame(data_train_subject,data_test_subject)

#########################################################################
### Extracts only the measurements on the mean and standard deviation ###
### for each measurement                                              ###
#########################################################################

mean_sd_index<-grep("-mean\\(\\)|-std\\(\\)",features[,2]) #indices
data_X_extracted<-data_X[,mean_sd_index]

##############################################################################
### Uses descriptive activity names to name the activities in the data set ###
##############################################################################

names(data_y)<-"Activity"
names(data_subject)<-"Subject"

#########################################################################
### Appropriately labels the data set with descriptive variable names ###
#########################################################################

names(data_X_extracted)<-features[mean_sd_index,2]

####################################################################################
### From the data set in step above, creates a second, independent tidy data set ### 
### with the average of each variable for each activity and each subject         ###
####################################################################################

data_new_cleaned<-cbind(data_X_extracted,data_y,data_subject)

### The new tidy data set ###
data_tidy<-aggregate(.~Activity+Subject,data_new,mean)

### Creating a text file with the new tidy data set ###
write.table(data_tidy,file="Clean_And_Tidy_Data.txt",row.name=FALSE)



