This document describes the run_analysis.R script, which takes data from eight files downloaded from the following UCI websites:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The script is divided into four basic parts, although there are sub tasks performed within each of these four broad parts. The first part initializes the environment by pointing the R session to the directory that contains the eight files, and initializing the "data.table" library. The second part of the script reads in the data from the eight files downloaded from the abovementioned website. The third part of the sript reformats, cleans, and merges the data files, including deleting unwanted columns with the "tidy[,89:563]=NULL script line." 

The final part of the script creates a merged and cleaned tidy data set, which is the base data set for the final tidy data file ("tidy.txt").

Note: I used a data.table because it allowed me to use the "tidy[,89:563]=NULL" script to eliminate unwanted columns. Otherwise when I tried to apply this script to the tidy data frame I received a fatal error.

Please refer to the Code Book for additional information about the underlying data and tidy data file.

