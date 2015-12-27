---
title: "CodeBook"
author: "C. Huff"
date: "December 25, 2015"
output: html_document
---

This analysis produces an extract of the feature set data in the Human Activity Recognition Using Smartphones (HARS) Dataset, Version 1.0, prepared by Reyes-Ortiz, et. al. of the SmartLab - Non-Linear Complex Systems Laboratory of the Università degli Studi di Genova (www.smartlab.ws).* The HARS dataset, with accompanying documentation, is available for download from [this archive page](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

**Source Data**

The original HARS data provide measurements of motion data for a group of volunteers wearing a smartphone on the waist. Each person performed six activities (from laying to walking upstairs). The experimenters captured 3-axial linear acceleration and 3-axial angular velocity data for the timed motion in each activity using the smartphone's embedded accelerometer and gyroscope. 

After preprocessing, the sensor signals were sampled into obervations of overlapping, fixed-width, sliding time windows for each activity and test subject. A 561-variable feature set of time and frequency domain measures, based on mean, standard deviation, and other summary statistics, was prepared for each windowed measurement period, the number of which observations ranges from 36 to 95, depending upon subject and activity. Each of the feature measurements was normalized and bounded within -1 and 1.

The obtained dataset was then randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. For purposes of machine learning research, the activity labels corresponding to the feature set observations were held out in a y (target) variable.

**Extracted Data**

The extracted data combine the features from the entire universe of test subjects, that is, both those in the training set and those in the test set. Only the feature variables based upon the mean and standard deviation statistics of sensor data in the observed time windows are included (79 variables out of the 561-element feature set).

Each reported measurement in the extracted data is the mean of the original windowed feature data observations for an individual subject over the entire measured period of  an activity. For example, the value -0.928056469 in observation 541 of the extract is the average for feature variable tBodyAcc-X of the standard deviations of the time-windowed phone accelerometer reading observations for subject 1 over the course of the LAYING activity.

**Variables**

The extracted data in file long-tidy.txt, produced by the accompanying scripts, includes 14,420 observations of 5 variables: subject, action, measure, stat, and value.

**subject** The subject who performed the activity for each window sample of the activity. Subjects are identified by the numbers from 1 to 30.

**action** The activity performed by the subject for a particular set of measurements. Each activity is denoted by the label LAYING, SITTING, STANDING, WALKING, WALKING DOWNSTAIRS, or WALKING UPSTAIRS.

**measure** The measurement on which the feature is based. A total of 79 of the 561 feature variables are included in the extract. 
The extract includes averages of the means and standard deviations for each of the following features.

*Time domain measurements - standard gravity unit g*

```
    tBodyAcc-XYZ        Body acceleration                                                X, Y, and Z  
    tGravityAcc-XYZ     Gravity acceleration                                             X, Y, and Z
    tBodyAccJerk-XYZ    Body acceleration (jerk)                                         X, Y, and Z
    tBodyAccMag         Body acceleration magnitude
    tGravityAccMag      Gravity acceleration magnitude
    tBodyAccJerkMag     Body acceleration (jerk) magnitude
```
*Time domain measurements - radians/second*
```
    tBodyGyro-XYZ       Body angular velocity                                            X, Y, and Z
    tBodyGyroJerk-XYZ   Body angular velocity (jerk)                                     X, Y, and Z
    tBodyGyroMag        Body angular velocity magnitude                                 
    tBodyGyroJerkMag    Body angular velocity (jerk) magnitude                           
```
*Frequency domain measurements*
```
    fBodyAcc-XYZ                 Body acceleration                                       X, Y, and Z
    fBodyAccJerk-XYZ             Body acceleration (jerk)                                X, Y, and Z
    fBodyGyro-XYZ                Body angular velocity                                   X, Y, and Z
    fBodyAccMag                  Body acceleration magnitude           
    fBodyAccJerkMag              Body acceleration (jerk) magnitude    
    fBodyGyroMag                 Body angular velocity magnitude       
    fBodyGyroJerkMag             Body angular velocity (jerk) magnitude
    fBodyAcc-Freq-XYZ*           Body acceleration frequency                             X, Y, and Z
    fBodyAccJerk-Freq-XYZ*       Body acceleration (jerk) frequency                      X, Y, and Z
    fBodyGyro-Freq-XYZ*          Body angular velocity magnitude frequency               X, Y, and Z
    fBodyAccMag-Freq*            Body acceleration magnitude frequency
    fBodyBodyAccJerkMag-Freq*    Body body acceleration (jerk) magnitude frequency
    fBodyBodyGyroMag-Freq*       Body body angular velocity magnitude frequency
    fBodyBodyGyroJerkMag-Freq*   Body body angular velocity (jerk) magnitude frequency
    
    * Average of mean measurement only.
```
**stat** Indicates whether the average value reported in the extract is based upon the mean or the standard deviation (std) of the
original measure on which the feature is based.

**value** The average value of the measure over the period of activity for a subject.

For further information on the measured data, including the full list of 561 features, see the files *features.txt*, *features_info.txt*, and *README.txt* in the documentation included in the HARS dataset download.