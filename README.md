Wearable Data Analysis
========
Get Data course project

## Background

## Data Source
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Operation
1. Download the data set zip file and put it in the same directory as the run_analysis.R script
2. Extract the zip file: "unzip getdata-projectfiles-UCI HAR Dataset.zip"
    This should create a directory call "UCI HAR Dataset"
3. Run the run_analysis.R script

## Result
The script outputs a CSV file call `tidy.csv`. The file summarizes the collected feature data by providing
an average (mean) value for each feature collected for each subject by activity.

The file has following format:

- SubjectID: Numeric identifying a unique subject associated with the data
- Activity: A factor specifying the type of activity--
    - LAYING
    - SITTING
    - STANDING
    - WALKING
    - WALKING_DOWNSTAIRS
    - WALKING_UPSTAIRS
- Features: The remaining fields are the summary data associated with the feature information collected.
    - The features listed include only those that provide a mean or standard deviation. Other features have been dropped.
    
