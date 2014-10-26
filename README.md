Course Project
=============================

The script called *run_analysis.R* takes a number of files from the Samsung data set accelerometer data from the  Human Activity Recognition Using Smartphones Dataset Version 1.0. 

This data set comes from:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws.
www.smartlab.ws. 

The **X_train.txt** and **X_test.txt** imported to separate data.frames in R. Two columns are  added to data.frames. One column with **Subject**, which is what person that was holding the handset. There are 30 different persons and each is represented with one identification number in the column Subject. Also, a column containg the **Activity** that the person performed is added. This column contains 6 different activities. Activity label is picked from the file **activity_labels.txt**, which provides a mapping between the 6 different activity id's to a label(WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING).

These two data.frames are then together into one large data.frame containing all data. This data frame is called **total_df** in the script.

In the next step the total_df data.frame is reduced into a smaller data.frame with less columns. Only the columns containg the word "mean" and "std" are kept together with "Subject" and "Activity" column. These data is stored in a smaller data.frame called **final_df**.

In the last step the final_df is divided into data per Subject and Activity and then the mean of the variables are calculated and stored in the data.frame called **FINAL**.




