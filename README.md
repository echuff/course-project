
**Coursera Getting and Cleaning Data**
Course Project
C. Huff
Dec. 25, 2015



The accompanying R scripts *run_analysis.R* and *fix_names.R* extract and summarize a 79-element 
feature set for 30 human volunteers engaged in six motion activities measured with the built-in 
accelerometer and gyroscope in a smartphone worn by the volunteers. The original HAR data provided 
triaxial acceleration from the accelerometer (total acceleration),the estimated body acceleration 
and triangular triaxial angular velocity from the gyroscope, along with a 561-feature matrix with 
both time and frequency domain variables. 

Each of the 10,299 observations of the 561 feature vectors in the original HAR represents a single reading of the 
processed, time-windowed sensored results for a single subject engaged in a specific motion activity. 
Out of the 10,299 total observations, the number of observations for a specific person and activity 
ranged from 36 to 95, depending on the person and activity. The extract selects those elements of 
the original feature vector that are based on means or standard deviations of the original sensor readings, 
with each observation of the extract providing the mean of all mean or standard deviation observations 
in the original data set of the selected feature for a single activity by a single volunteer. 

The final extract includes mean data for 30 test subjects, 6 activities, and 79 features, 
including a number of features based on readings in the X, Y, and Z directions. The extract includes 14,220 observations of five variables, described in the accompanying *CodeBook*.

**Using the Scripts**

1. Download to a convenient location the zipped HARS dataset from "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones".

2. Unzipping the zipped dataset will produce a base directory "UCI HAR Dataset" as well as several subdirectories.

3. Set your R working directory and place the R scripts *run_analysis.R* and *fix_names.R* in the working directory. 
The output of the scripts will be written to this working directory.

4. Modify the 8th line of run_analysis.R to reference the full path to the HAR Dataset base directory, 
for example, path <- "C:/data/UCI HAR Dataset".

5. Run the script *run_analysis.R*. (The script *fix_names.R* is a utility function 
called by run_analysis.R)

6. The final product of the script will be a single data set written to your working directory: "long-tidy.txt", 
a long-format version of the extract. In addition, two data sets will be produced in your workspace: tidy, the data set written to disk as "long-tidy.txt"; and df_stats, a wide-format version of the extract that is not written to disk.

**Action of the Scripts**

The main script *run_analysis.R* first reads in the the HARS training data set and pre-processes it, then does the same for the HARS test data set, and finally combines the two for final processing.

Before either of the data sets are read in, the script begins by:

- reading in the names of the 561 features as a single vector
- standardizing the names of the 79 features in that vector which are based on mean() and std() using the auxiliary script *fix_names.R*, and then 
- creating a vector of the column numbers of the 79 variables with those standardized names.

In the preprocessing function, a data set (training or test) is read into a temporary data frame using the feature column names just obtained and then preprocessed. Preprocessing of the temporary data frame includes:
- subsetting the data frame to include only the 79 columns of feature variables that are based on mean and standard deviation statistisics of the original observations
- adding a column of subject id numbers for the observations 
- adding a column of descriptive names for the activity in each observation
- combining the temporary data frame into a results data frame of observations that include subject id numbers, activity names, and 79 feature variables.

This function is called twice, once for the training data set and once for the test set.

After preprocessing is complete, the results data frame will include 10,229 rows and 81 columns. This data frame is processed to:

- Summarize the observations by computing an average for each subject and activity in each of the 79 feature variables. The result is the wide-format tidy dataset 'df_stats', which includes 180 observations of 81 variables.

- Convert the wide-format tidy dataset to the long-format dataset 'tidy'. This dataset is written to disk as 
   'long-tidy.txt'.