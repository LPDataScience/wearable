Code Book Wearable Data Analysis
========

## Background
The data set consists of test data and training data sets. Each set has the same structure:

- subject_{test|train}.txt: Subject identifier
- X_{test|train}.txt: Feature data from the sensors
- y_{test|train}.txt: Activity identifier
- Inertial Signals: Raw data from the sensors (not used directly in this analysis)
    
The feature list and activities are described in the top directory files `features.txt` and 
`activity_lables.txt`, respectively.

Refer to the `README.txt` and `features_info.txt` files for more detailed description of the content.

## Merging Each Data Set
Each of the files in a data set consists of one row per observation: one row for feature data, one row
for the subject identifier, and one row for the activity. The merging of data for the test data
follows these steps:

1. Read in the feature names and activity identifiers
2. Read in the X, y, and subject information
    - Apply the feature names to the columns when reading in the X data
3. Convert the y activity identifiers to the activity names
4. Combine the three tables into a single table matching row to row

The training data is processed the same way. This results in two tables: one combined table for 
test data and one combined for training data.

## Merging Data Sets Together
The test and training data now have the same structure:

- Type: Test or Train
- Subject ID: subject identifier
- Activity Label: Type of activity performed
- Features: 561 columns of feature data

The training data is now appended to the test data creating a single table of all data collected.

> *Note: Once combined, the data loses its source category, training or test data. It is possible to prepend a column to identify whether the row is "Test" data or "Train" data.*

## Drop Columns
Columns that do not hold the mean or standard deviation for a measurement are dropped. 
Type, SubjectID, and Activity are retained.

## Aggregate Data
Gather the mean of all features remaining and aggregate them by Activity and SubjectID.

## Save Data
The collected data frame gets written to the current directory as a CSV file called `tidy.csv`.