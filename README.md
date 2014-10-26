Course Project
=============================
####The script called run_analysis.R takes a number of files from the Samsung data set accelerometer data from the  Human Activity Recognition Using Smartphones Dataset Version 1.0. This data set comes from:
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit‡ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws.
www.smartlab.ws. 
==================================================================
The training and test data sets of this data is the put together into one large data.frame containing all data called "total_df".

Two columns are then added to "total_df. One column with Subject, which is what person that was holding the handset. There are 30 different persons and each is represented with one identification number in the column "Subject". Also, a column containg the activity that the person performed. This column contains 6 different activities.

In the next step the "total_df" data.frame is reduced into a smaller data.frame with less columns. Only the columns containg the word "mean" and "std" are kept together with "Subject" and "Activity" coumnd. These data is stored in a smaller data.frame called "final_df".

In the last step the final_df is divided into data per Subject and Activity and then the mean of the data is calculated and stored in the data.frame called "FINAL".




