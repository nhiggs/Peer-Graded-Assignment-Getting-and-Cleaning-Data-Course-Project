#load libraries we will need
library(plyr)
library(dplyr)

#load the raw datasets we will be working with
X_train <- read.table('UCI HAR Dataset/train/X_train.txt')
y_train <- read.table('UCI HAR Dataset/train/y_train.txt')
subject_train <- read.table('UCI HAR Dataset/train/subject_train.txt')
X_test <- read.table('UCI HAR Dataset/test/X_test.txt')
y_test <- read.table('UCI HAR Dataset/test/y_test.txt')
subject_test <- read.table('UCI HAR Dataset/test/subject_test.txt')
feature_names <- read.table('UCI HAR Dataset/features.txt')

#concatenate the train and test datasets
X_cat <- rbind(X_train, X_test)
y_cat <- rbind(y_train, y_test)
subject_cat <- rbind(subject_train, subject_test)

#give the datasets their proper variable names
colnames(X_cat) <- tolower(feature_names$V2)
colnames(X_cat) <- gsub('-', '', colnames(X_cat))
colnames(X_cat) <- gsub('\\(\\)', '', colnames(X_cat))
colnames(y_cat) <- 'activity'
colnames(subject_cat) <- 'subject'

#extract columns from X concerned with mean or standard dev
xNames <- names(X_cat)
xFilteredNames <- grep("mean|std", xNames, ignore.case = TRUE)
X_cat_filtered <- X_cat[,xFilteredNames]

#remap activities(y's) to be more descriptive
y_cat$activity <- mapvalues(y_cat$activity, from = c(1,2,3,4,5,6),
                          to = c('walking', 'walking upstairs',
                                 'walking downstairs', 'sitting',
                                 'standing', 'laying'))

#combine the subjects, activites, and X's to create master dataset
master <- cbind(subject_cat, y_cat)
master <- cbind(master, X_cat_filtered)

#make use of dplyr to tidy the dataset as required by the assignment
master_df <- tbl_df(master)
tidy_averages <- master_df %>%
              group_by(subject, activity) %>%
              summarise_each(funs(mean))

#write the tidy dataset
write.table(tidy_averages, file = 'tidydata.txt', row.names = FALSE)