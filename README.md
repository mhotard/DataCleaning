# DataClearning
February Coursera Class

This analysis takes data from the following data source:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

It uses data taken from experiments in which test subjects performed various activities with a smart phone attached to their body. The researchers wanted to gather data from the accelerometer and gyroscope of the smart phone while participants were walking, walking upstairs, walking downstairs, sitting, standing, and lying down. They would analyze the data to try and predict what activity the subject was doing.  The phone's instruments captured data on 3-axes at periodic intervals.

This analysis of the data was done for the Coursera course "Getting and Cleaning Data." The assignment stated that we should create an R script that:
    "1) Merges the training and the test sets to create one data set.
    2) Extracts only the measurements on the mean and standard deviation for each measurement. 
    3) Uses descriptive activity names to name the activities in the data set
    4) Appropriately labels the data set with descriptive variable names. 
    5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each          activity and each subject."
    
The r script in this repo completes these steps. It should be run in the directory UCI Har Dataset which should contain the data files within their respective subfolders.  The r script contains comments to explain it steps, but it follows the baisc outline of the assignment presented above. The ultimate product is a data set that includes the mean for all of the variables in the UCI study that related to the mean or standard deviation grouped by participant by activity. 

This repo contains:

'README.md'
'CODEBOOK.txt' : explains the variables in the analysis
'run_analysis.R' : provides the script that pulls data from the UCI Datasets to create a tidy dataset


    
    
