setwd("D:/Data cleaning/Course-Project")

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "./accelerometers.zip", mode="wb")
unzip("./accelerometers.zip")

#create a list of all directory names
full_files <- list.dirs("UCI HAR Dataset") 
datalist<- lapply(full_files, FUN = list.files)

setwd("D:/Data cleaning/Course-Project/UCI HAR Dataset/train")
subject_train <- read.table(datalist[[4]][2])
X_train <- read.table(datalist[[4]][3])
y_train <-  read.table(datalist[[4]][4])

setwd("D:/Data cleaning/Course-Project/UCI HAR Dataset/test")
subject_test <- read.table(datalist[[2]][2])
X_test <- read.table(datalist[[2]][3])
y_test <-  read.table(datalist[[2]][4])

setwd("..")#move up one directory 
activity_labels <- read.table(datalist[[1]][1])
features <- read.table(datalist[[1]][3])
setwd("..")

# Merges the training and the test sets to create one data set.
test <- data.frame(subject_test, y_test, type = "test", X_test)
train <- data.frame(subject_train, y_train, type = "train", X_train)
alldata <- rbind(test,train)

# Extracts only the measurements on the mean and standard deviation for each measurement.
names(alldata) <- c("subject","V1","type",as.character(features$V2))
index <- grepl("mean\\(\\)|std\\(\\)",names(alldata))
data <- cbind(alldata[,1:2],alldata[,index])

# Uses descriptive activity names to name the activities in the data set
data <- merge(activity_labels,data,by="V1")
names(data)[1:2] <- c("label", "activity")

# Appropriately labels the data set with descriptive variable names.
# all names to lower case
names(data) <- tolower(names(data))
# remove "- and ()"
names(data) <- gsub("-",".",names(data))
names(data) <- gsub("\\(\\)","",names(data))
names(data) <- gsub("^t","time.",names(data))
names(data) <- gsub("^f","freq.",names(data))

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr)
avgdata <- tbl_df(data) %>% select(-label) %>%
        group_by(subject,activity) %>%
        summarise_each(funs(mean)) 

write.table(avgdata,"avgdata.txt",row.name=FALSE)
