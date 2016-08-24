# Peer-Graded-Assignment-Getting-and-Cleaning-Data-Course-Project
Final project for course 3: Getting and Cleaning Data, of the John Hopkins Coursera Data Science Specialization

#run_analysis.R
This script reads in the Samsung data and outputs a tidy data set named 'tidydata.txt' that has the averages of each variable that involves a mean or standard deviation, for each subject and activity.

The script itself has explanatory comments throughout that explain where it executes each of the following steps:
* loading datasets
* concatenating datasets
* properly naming variables
* extracting columns that deal with mean and standard deviation
* remapping the activites from numbers to descriptions (e.g. 1 = 'walking')
* creating a new tidy dataset with the average for each activity and each subject

###Additional notes
The instructions were ambiguous in a few places so the following assumptions were made:
*  The data is already downloaded and the unzipped folder 'UCI HAR Dataset' is located in your current working directory. In the script itself you will see that it reads in the file locations in the format: 'UCI HAR Dataset/folder name/filename.txt'.
*  The assignment asked to extract columns that involve a mean or standard deviation but did not specify any further. This left many questions on the forums as to whether this should only include variables that would have both a mean and std or just one. Due to the ambiguity, this script simply includes them all by extracting each column that contains the word 'mean' or 'std' irregardless of punctuation/capitalization.
*  The format for the final tidy data set was also ambiguous so more assumptions were needed to be made. As such, this script grouped the data by subject, then activity, and calculated the average for the corresponding variables. Since all the variables (other than subject and activity) were to be averages, the column names were left the same because it seemed redundant to add the word 'mean' or 'average' to all 80+ columns. 
*  This final data set is tidy because each row is made up of one observation (1 subject and 1 activity combination), each column is one variable (the average of said variable for each grouping), and the variable names are lower case, descriptive, and without unnecessary punctuation. Other variations could have been used that would also have been tidy, but this set-up appeared to be closest to the assignment instructions (as far as we could tell through discussion on the forums).

##codebook.txt
The codebook is included and has been updated with a note on the changes the script makes to the variable names for the tidy data set. The file 'features.txt' has also been included becuse it is referenced by the codebook.

##tidydata.txt
This is included because I was unsure if the output of our script should also be included here, so I played it safe and included it.
