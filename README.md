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
The script outputs a text file called `tidy.txt`. The file summarizes the collected feature data by providing
an average (mean) value for each feature collected for each subject by activity.

The file has following format:

- SubjectID: Numeric integer (starting at 1) identifying a unique subject and data set associated with the data
    - Training Data Subjects
        - 1  3  5  6  7  8 11 14 15 16 17 19 21 22 23 25 26 27 28 29 30
    - Test Data Subjects
        - 2  4  9 10 12 13 18 20 24
- Activity: A factor specifying the type of activity--
    - LAYING
    - SITTING
    - STANDING
    - WALKING
    - WALKING_DOWNSTAIRS
    - WALKING_UPSTAIRS
- Features: The remaining fields are the summary data associated with the feature information collected.
    - The features listed include only those that provide a mean or standard deviation. Other features have been dropped.
    - Refer to the FeatureColDescription.txt file for a detailed description of the fields.
    - See FeatureColList.txt for a full list of field names.
