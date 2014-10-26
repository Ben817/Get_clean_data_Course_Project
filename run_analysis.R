library(data.table)
library(reshape)
library(reshape2)
##### LOAD ALL THE FILES ######
#Here both the test data and training data are loaded
features <- read.table(file="UCI HAR Dataset/features.txt",header=F,sep="") #Loading  the feature names
features <- as.character(features$V2)

X_test <- read.table(file="X_test.txt",header=F,sep="",) #Loading  X_test data
X_test <- data.table(X_test) # Create a data.table for faster access
setnames(X_test,features)
subject_test <- read.table(file="subject_test.txt",header=F,sep="",) #Loading subejct_test data
total_X_test <- X_test #Create an empty total_X_test data.frame that will be filled in with data.
total_X_test$Subject <- subject_test #Added the subject to the X_testdata and created a total_X_test data.frame with everything
y_test <- read.table(file="y_test.txt",header=F,sep="",) #Loading y_test data
total_X_test$Activity <- y_test #Add a column with the Activity to tht total_X_test data.frame

X_train <- read.table(file="X_train.txt",header=F,sep="",) #Loading  X_train data
X_train <- data.table(X_train) # Create a data.table for faster access
setnames(X_train,features)
total_X_train <- X_train #Create an empty total_X_train data.frame that will be filled in with data.
subject_train <- read.table(file="subject_train.txt",header=F,sep="",) #Loading subejct_train data
total_X_train$Subject <- subject_train #add a "subject" column to the total_X_train data.frame
y_train <- read.table(file="y_train.txt",header=F,sep="",) #Loading y_train data
total_X_train$Activity <- y_train #Add a column with the Activity to tota_X_train data.frame

########## bind all data to one large data.frame
total_df <- rbindlist(list(total_X_test,total_X_train))

########## add activites to data frame
activity_labels <- read.table(file="activity_labels.txt",header=F,sep="",) #Loading  X_train data
colnames(activity_labels) <- c("Activity","Activity_label")

activity_labels <- merge(data.frame(Activity=total_df$Activity),activity_labels,by.x="Activity",by.y = "Activity")
total_df <- cbind(total_df,Activity_label=activity_labels$Activity_label)

##### Find Columns that contain the word "mean" or "std" "Subject" or "Activity_label"
mean_ind <- grep("mean",colnames(total_df))
std_ind <- grep("std",colnames(total_df))
subject_ind <- which(colnames(total_df)=="Subject")
activity_ind <- which(colnames(total_df)=="Activity_label")
total_indices <- c(mean_ind,std_ind,subject_ind,activity_ind)

##### Create final data.frame with only the mean and std columns
final_df <- total_df[,total_indices,with=FALSE] #Use with=FALSE since it is a data.table

##### Create a FINAL data.frame with the average per Subject and Activity
final_df_melt <- melt(final_df,id=c("Subject","Activity_label")) #Melt the final_df
FINAL <- dcast(final_df_melt,Subject+Activity_label~variable,mean)

###### Add the meanof
new_colnames <- c("Subject","Activity",paste0("meanof_",colnames(FINAL)[3:ncol(FINAL)]))
colnames(FINAL) <- new_colnames
                  
write.table(x = FINAL,file = "FINAL.txt",row.names = FALSE)
