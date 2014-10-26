Course Project
=============================

The script called *run_analysis.R* takes a number of files from the Samsung data set accelerometer data from the  Human Activity Recognition Using Smartphones Dataset Version 1.0. This data set comes from:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws.
www.smartlab.ws. 


#DESCRIPTION
This script is combining data from several files in this data set into one single data.frame. Then an average is calculated on subset of this data frame.

The **X_train.txt** and **X_test.txt** imported to separate data.frames in R. The column names in these two data.frames are added from the file **features.txt**.

Two columns are added to the data.frames. One column with **Subject**, which is what person that was holding the handset. There are 30 different persons and each is represented with one identification number in the column Subject. A second column is added containg the **Activity** that the person performed. This column contains 6 different activities. Activity labels are picked from the file **activity_labels.txt**, which provides a mapping between the 6 different activity id's to a label (WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING).

These two data.frames are then together into one large data.frame containing all data. This data frame is called **total_df** in the script.

In the next step the total_df data.frame is reduced into a smaller data.frame with less columns. Only the columns containg the word "mean" and "std" are kept as well as "Subject" and "Activity" column. These columns are stored in a smaller data.frame called **final_df**.

In the last step the final_df is divided into data per Subject and Activity and then the mean of the variables are calculated and stored in the data.frame called **FINAL**.

#HOW TO USE
First, put the data files and the **run_analysis.R** in the working directory.
Then, run the file **run_analysis.R**.
This will produce a file called FINAL.txt containing the calculated mean for the subsetted variables, per Subject and Activity.


