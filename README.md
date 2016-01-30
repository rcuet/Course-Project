# Tidy data set: Human Activity Recognition Using Smartphones Dataset
Rosa Cueto  
30 de enero de 2016  

This repo explains how all of the scripts work and how they are connected.

First, the working directory was selected. Then I downloaded, and unzipped the data set from the web. The resulting file was named "UCI HAR Dataset". In order to know what files are into, I called the list.dir function and then explore with lapply function which docs are inside the files.


```r
setwd("D:/Data cleaning/Course-Project")
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(url, destfile = "./accelerometers.zip", mode="wb")
#unzip("./accelerometers.zip")

full_files <- list.dirs("UCI HAR Dataset") 
datalist<- lapply(full_files, FUN = list.files)
```

After that, the files required for the course project were read with the read.table function. The file location and the defaults arguments were used. When It was required, the working directory was changed to call the files location. 


```r
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
```

Then the proccesing was carried out. In order to get the first requirement, I assigned two variables called "test" and "train" which contain a data.frame with the subject_test, y_test, type (means if the data came from test or train files), and X_test files. Then I bound these variables by rows creating a new one called "alldata".


```r
test <- data.frame(subject_test, y_test, type = "test", X_test)
train <- data.frame(subject_train, y_train, type = "train", X_train)
alldata <- rbind(test,train)
```

In order to extract only the measurements on the mean and standard deviation for each measurement, I named the variables according their kind. Here, the measurements were named according the second column of the "features" file, also I called "V1" to the second column (activity labels) to use it in the next steps. Then an "index" logical variable which select the "mean()" and the "std()" conteins in the column names from "alldata" was created. Then the columns of alldata was subset by index, and I bound this output with the two first column from "alldata" to create the "data" variable.


```r
names(alldata) <- c("subject","V1","type",as.character(features$V2))
index <- grepl("mean\\(\\)|std\\(\\)",names(alldata))
data <- cbind(alldata[,1:2],alldata[,index])
```

To name the activities in the data set I use the merge function with activity_labels and data as the first two arguments, the third argument was by set equal to "V1", which was the specification of the column used. After that, the first two columns were renamed as "label" and "activity" .


```r
data <- merge(activity_labels,data,by="V1")
names(data)[1:2] <- c("label", "activity")
```

Later, in order to get appropriately labels the data set with descriptive variable names, I put all the names in lower case using the tolower function, I replaced the "-" by ".", I removed the "()" and I replaced the first letter "t" or "f" by "time." or "freq." respectively.


```r
names(data) <- tolower(names(data))
names(data) <- gsub("-",".",names(data))
names(data) <- gsub("\\(\\)","",names(data))
names(data) <- gsub("^t","time.",names(data))
names(data) <- gsub("^f","freq.",names(data))
```

Finally, the data set was procesed with the average of each variable for each subject and each activity. Thus I called the "dplyr" package and used the select, group_by and summarise_each (calling the mean function) functions with the "data" data.frame and create a new and tidy data frame called "avgdata". After that the output was written as a text file called "avgdata.txt".


```r
library(dplyr)
avgdata <- tbl_df(data) %>% select(-label) %>%
        group_by(subject,activity) %>%
        summarise_each(funs(mean)) 

write.table(avgdata,"avgdata.txt",row.name=FALSE)
```

