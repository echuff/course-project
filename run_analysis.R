library(plyr)
library(dplyr)
library(tidyr)

## MODIFY THE FOLLOWING LINE TO REFER TO THE FULL PATH TO THE UCI HAR Dataset BASE DIRECTORY
path <- 'C:/Users/Chuff/Google Drive/Coursera/Getting and Cleaning Data/crs_proj/UCI HAR Dataset'

source("fix_names.R")

# read feature names
filename <- 'features.txt'
URL      <- paste(path, filename, sep="/")
features <- read.delim(URL, header=FALSE, sep=" ", stringsAsFactors=FALSE)
names(features) <- c("Num", "Name")
features$Stats <- 0

# standardize names of mean and standard deviation (std) variables and create vector of column numbers of those names
for (i in 1:length(features$Name)) {
  if (!(length((grep("mean",features$Name[i]))) == 0) | !(length((grep("std",features$Name[i]))) == 0)) {
    features$Name[i] <- fix_names(features$Name[i])    
    features$Stats[i] <- 1
  }
}
statCols <- features[features$Stats==1, 1]

# PREPROCESSING FUNCTION: read mean & std dev variables of data set, add identifier variables, and return as a data frame
get_set <- function(x) {
#  x = 'train' or 'test' data set
  folder <- x
  filename <- paste('X_', x, '.txt', sep='')
  URL <- paste(path, folder, filename, sep="/")
  varTemp <- read.table(file = URL, header = FALSE, col.names = features$Name)
  # subset to select the 79 feature variables
  temp_df <- varTemp[, statCols]

  # add subject IDs to the temporary data frame
  filename <- paste('subject_', x, '.txt', sep='')
  URL <- paste(path, folder, filename, sep="/")
  varTemp <- read.table(URL, header=FALSE, sep="", stringsAsFactors=FALSE)
  names(varTemp) <- "subject"
  temp_df <- cbind(temp_df, varTemp)
  
  # add activity numbers to the temporary data frame
  filename <- paste('y_', x, '.txt', sep='')
  URL <- paste(path, folder, filename, sep="/")
  varTemp <- read.table(URL, header=FALSE, sep="", stringsAsFactors=FALSE)
  names(varTemp) <- "action"
  temp_df <- cbind(temp_df, varTemp)
  
  # add activity labels to the temporary data frame
  filename <- "activity_labels.txt"
  URL <- paste(path, filename, sep="/")
  activities <- read.delim(URL, header=FALSE, sep=" ", stringsAsFactors=FALSE)
  names(activities) <- c("Num", "Name")
  temp_df$action <- mapvalues(temp_df$action, from=activities$Num, to=activities$Name)
  return(temp_df)
}

# merge the training and test data frames
df1 <- get_set('train')
df2 <- get_set('test')
df <- rbind(df1, df2)

# calculate means of measurements across windowed observations by subject, action, and measurement
by_subj_act <- group_by(df, subject, action)
df_stats <- summarize_each(by_subj_act, funs(mean))
write.table(df_stats, file="wide-tidy.txt", row.names=FALSE)

# create final long-format tidy data set
tidy <- df_stats %>% gather(measurement, value, -subject, -action) %>%
  separate(col=measurement, into=c("measure", "stat"), sep="_")

# write result to file
write.table(tidy, file="long-tidy.txt", row.names=FALSE)

# clean up
rm(filename, URL, features, i, path, statCols, df1, df2, df, by_subj_act, fix_names, get_set)