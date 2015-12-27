
**Coursera Getting and Cleaning Data**
Course Project
C. Huff
Dec. 25, 2015



The accompanying R scripts *run_analysis.R* and *fix_names.R* extract and summarize a 79-element 
feature set for 30 human volunteers engaged in six motion activities measured with the built-in 
accelerometer and gyroscope in a smartphone worn by the volunteers. The original HAR data provided 
triaxial acceleration from the accelerometer (total acceleration),the estimated body acceleration 
and triangular triaxial angular velocity from the gyroscope, along with a 561-feature vector with 
time and frequency domain variables. 

Each of the 10,299 observations of the 516-feature vectors represents a single reading of the 
processed, time-windowed sensored results for a single subject engaged in a specific motion activity. 
Out of the 10,299 total observations, the number of observations for a specific person and activity 
ranged from 36 to 95, depending on the person and activity. The extract selects those elements of 
the original feature vector that are based on means or standard deviations of the original sensor readings, 
with each observation of the extract providing the mean of all mean or standard deviation observations 
in the original data set of a specific feature element for a single activity for a single test person. 

The final extract includes mean data for 30 test subjects, 6 activities, and 79 features, 
including a number of features based on readings in the X, Y, and Z directions. For more detailed information, 
see the accompanying *CodeBook*.

**Using the Scripts**

1. Download to a convenient location the zipped HARS dataset from "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones".

2. Unzipping the zipped dataset will produce a base directory "UCI HAR Dataset" as well as several subdirectories.

3. Set your R working directory and place the R scripts *run_analysis.R* and *fix_names.R* in the working directory. 
The output of the scripts will be written to this working directory.

4. Modify the 8th line of run_analysis.R to reference the full path to the HAR Dataset base directory, 
for example, path <- "C:/data/UCI HAR Dataset".

5. Run the script *run_analysis.R*. Run time will be lengthy. (The script *fix_names.R* is a utility function 
called by run_analysis.R)

6. The final product of the script will be a single data set written to your working directory: "long-tidy.txt", 
a long-format version of the extract. In addition, two data sets will be produced in your workspace: tidy, the data set written to disk as 
"long-tidy.txt"; and df_stats, a wide-format version of the extract that is not written to disk.

**Action of the Scripts**

Due to space limitations, it was not possible to process the entire HARS test and training data sets in memory. 
Instead, reduced versions of these data sets were produced by reading in only the target columns of interest -- that is, 
columns of the feature vector that were based on the means and standard deviations of the underlying sensor readings. These 
columns were identified and read from disk one-by-by one and then added to a temporary data frame for each of the test and 
training data sets. The two temporary data frames were then combined for final processing.

-  Read in feature vector names, standardize the names of those features based on mean() and std() using fix_names.R, 
   and create a vector of column numbers of variables with those names.

-  Via an inline function, sequentially read in the target columns from the source feature vector data set, add descriptive 
   names for columns, subject numbers for the observations, and descriptive names for the activities of the observations 
   and return the resulting data frame.

-  Combine the resulting data frames for the training and test feature vector sets into a single 10,229 row by 81 column data frame.

-  Summarize the observations in the combined data frame by averaging the observations for each feature, subject, and 
   activity across the time-sampled windowed observations. The result is the wide-format tidy dataset 'df_stats'.

-  Convert the wide-format tidy dataset to the long-format dataset 'tidy'. This dataset is written to disk as 
   'long-tidy.txt'.