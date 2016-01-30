# Tidy data set: Human Activity Recognition Using Smartphones Dataset
Getting and Cleaning Data
=========================================================================

The variables selected for this data set represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Using the dataset collected from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, They captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. This raw data was used as input for the next step of clean up the data described below. 

The "orgdata.txt" data set contains the average for each measured variable (from 3 to 68) according each subject and each activity. 

Variables
========================================================================
1                        subject                 
2                       activity                
3            time.bodyacc.mean.x
4            time.bodyacc.mean.y
5            time.bodyacc.mean.z
6             time.bodyacc.std.x
7             time.bodyacc.std.y
8             time.bodyacc.std.z
9         time.gravityacc.mean.x
10        time.gravityacc.mean.y
11        time.gravityacc.mean.z
12         time.gravityacc.std.x
13         time.gravityacc.std.y
14         time.gravityacc.std.z
15       time.bodyaccjerk.mean.x
16       time.bodyaccjerk.mean.y
17       time.bodyaccjerk.mean.z
18        time.bodyaccjerk.std.x
19        time.bodyaccjerk.std.y
20        time.bodyaccjerk.std.z
21          time.bodygyro.mean.x
22          time.bodygyro.mean.y
23          time.bodygyro.mean.z
24           time.bodygyro.std.x
25           time.bodygyro.std.y
26           time.bodygyro.std.z
27      time.bodygyrojerk.mean.x
28      time.bodygyrojerk.mean.y
29      time.bodygyrojerk.mean.z
30       time.bodygyrojerk.std.x
31       time.bodygyrojerk.std.y
32       time.bodygyrojerk.std.z
33          time.bodyaccmag.mean
34           time.bodyaccmag.std
35       time.gravityaccmag.mean
36        time.gravityaccmag.std
37      time.bodyaccjerkmag.mean
38       time.bodyaccjerkmag.std
39         time.bodygyromag.mean
40          time.bodygyromag.std
41     time.bodygyrojerkmag.mean
42      time.bodygyrojerkmag.std
43           freq.bodyacc.mean.x
44           freq.bodyacc.mean.y
45           freq.bodyacc.mean.z
46            freq.bodyacc.std.x
47            freq.bodyacc.std.y
48            freq.bodyacc.std.z
49       freq.bodyaccjerk.mean.x
50       freq.bodyaccjerk.mean.y
51       freq.bodyaccjerk.mean.z
52        freq.bodyaccjerk.std.x
53        freq.bodyaccjerk.std.y
54        freq.bodyaccjerk.std.z
55          freq.bodygyro.mean.x
56          freq.bodygyro.mean.y
57          freq.bodygyro.mean.z
58           freq.bodygyro.std.x
59           freq.bodygyro.std.y
60           freq.bodygyro.std.z
61          freq.bodyaccmag.mean
62           freq.bodyaccmag.std
63  freq.bodybodyaccjerkmag.mean
64   freq.bodybodyaccjerkmag.std
65     freq.bodybodygyromag.mean
66      freq.bodybodygyromag.std
67 freq.bodybodygyrojerkmag.mean
68  freq.bodybodygyrojerkmag.std

Description
=======================================================================
- subject: Each row identifies the subject who performed the activity wearing a smartphone (Samsung Galaxy S II) on the waist. Its range is from 1 to 30.
- activity: Each row identifies one of the six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) recorded. 

Prefixs descriptions of the following files are equivalent. 

- time/freq: Time domain signals or frequency domain signals.
- bodyacc: The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- bodygyro: The angular velocity vector measured by the gyroscope for each sample. The units are radians/second. 
- gravityacc:gravity acceleration signals. The units are radians/second. 
- jerk: Jerk signals, calculated using the body linear acceleration and angular velocity derived in time.
- mag: Magnitude of the Jerk signals three-dimensional signals calculated using the Euclidean norm. 
- mean/std: Mean value or Standard deviation.
- x/y/z: feature used to denote 3-axial signals in the X, Y and Z directions.