This document describes the run_analysis.R script, which takes data from eight files downloaded from the following UCI websites:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The script is divided into four basic parts, although there are sub tasks performed within each of these four broad parts (which are explained by comments within the script). The first part initializes the environment by pointing the R session to the directory that contains the eight files, and initializing the "data.table" library. The second part of the script reads in the data from the eight files downloaded from the abovementioned website. The third part of the sript reformats, cleans, and merges the data files, including deleting unwanted columns with the "tidy[,89:563]=NULL script line." 

The final part of the script creates a merged and cleaned tidy data set, which is the base data set for the final tidy data file ("tidy.txt").

Notes: 
- I used a data.table (requires the initialization of the data.table library) because it allowed me to use the           
  "tidy[,89:563]=NULL" script to eliminate unwanted columns. Otherwise when I tried to apply this script to the tidy data         frame I received a fatal error.
- I purposely avoided the use of loops to make the code viusally easy to follow, although this resulted in a script that   
  was less parsimonious, especially with respect to changing the variable names and mapping the activities.
- The script created two Warning messages, neither of which had an effect on the results:
  (1) The script "tidy[,89:563]=NULL"  created the following warning:
      In alloc.col(x): Attempt to reduce allocation from 627 to 152 ignored. Can only increase allocation via shallow copy.        While not efficient this script eliminated the unwanted (variable names that did not include mean or standard deviation) columns.

  (2) I suppressed warnings that arose from the following script:  
      tidy<-suppressWarnings(aggregate(tidy,list(Activity=tidy$Activity,Subject=tidy$Subject),mean))
      Warning messages:
      In mean.default(X[[i]], ...): argument is not numeric or logical: returning NA
      This warning arose because the script "tidy[,89:563]=NULL" creates non-numeric/logical elements (e.g., NULL cols)

Please refer to the Code Book for additional information about the underlying data, variable name changes, and tidy data file

