### Overview

This document describes the run_analysis.R script, which takes data from eight files downloaded from the following UCI websites:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The script is divided into four basic parts, although there are sub tasks performed within each of these four broad parts (which are explained by comments within the script). The first part initializes the environment by pointing the R session to the directory that contains the eight files, and initializing the "data.table" and "dplyr" libraries. The second part of the script reads in the data from the eight files downloaded from the abovementioned website. The third part of the sript reformats, cleans, and merges the data files, including deleting unwanted columns with the "tidy<-select(tidy1, 1:88)". I used the data.table and dplyr libraries to transform the data frame to a data table. The sequence of scripts eliminating the unwanted columns is as follows:

tidydat<-data.table(tidydat)

tidy1<-tbl_df(tidydat)

tidy<-select(tidy1, 1:88)

The final part of the script creates a merged and cleaned tidy data set, which is the base data set for the final tidy data file ("tidy.txt"). The two lines "tidy[,4]=NULL," "tidy[,3]=NULL," eliminate the columns generated by    
tidy<-suppressWarnings(aggregate(tidy,list(Activity=tidy$Activity,Subject=tidy$Subject),mean)) for the Activity and Subject columns.

### Notes: 
- I purposely avoided the use of loops to make the code viusally easy to follow, although this resulted in a script that   
  was less parsimonious, especially with respect to changing the variable names and mapping the activities.
- The script created a warning message, which had no effect on the results. I suppressed warnings that arose from the  
  following script:  
      tidy<-suppressWarnings(aggregate(tidy,list(Activity=tidy$Activity,Subject=tidy$Subject),mean))
      Warning messages:
      In mean.default(X[[i]], ...): argument is not numeric or logical: returning NA
      
### Please refer to the Code Book for additional information about the underlying data, variable name changes, and tidy data file.

