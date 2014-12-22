
## download and unzip the dataset
# uri <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# download.file(uri, destfile = "dataset.zip", method = "curl")                
# unzip("dataset.zip")

## assign variables for directories to facilitate navigation
dir.main <- getwd()
dir.dataset.main <- paste(dir.main,"/","UCI HAR Dataset", sep="")
dir.test <- paste(dir.dataset.main,"/","test", sep="")
dir.train <- paste(dir.dataset.main,"/","train", sep="")

## get the test and train dataset, merge them
setwd(dir.main)
source("getData.R")
test <- getData(dir.test, "test")
train <- getData(dir.train, "train")
dataset <- rbind(test, train)
rm(test, train, getData)
message("... merged the datasets")

## replace variables' labels
setwd(dir.dataset.main)
labels <- read.table("features.txt")
labels[2] <- lapply(labels[2], as.character)
for (i in 1:nrow(labels)) {
    names(dataset)[i+2] <- labels[i, 2]
}
rm(labels, i)
message("... replaced the variables' labels")

## convert the 'subject' and 'activity' varibles to factor variables
setwd(dir.dataset.main)
labels <- read.table("activity_labels.txt")
dataset$subject <- factor(dataset$subject, levels=sort(unique(dataset$subject)))
dataset$activity <- factor(dataset$activity, levels=sort(unique(dataset$activity)), labels = labels[,2])
rm(labels)
message("... converted 'subject' and 'activity' into factor variables")

## remove the columns that do not contains means and st.deviations
## (the columns which names contain 'meanFreq()' are also removed) 
keywords <- c("subject", "activity", "mean()", "std()")
key.matrix <- sapply(keywords, grepl, names(dataset), fixed=T)
key.vector <- apply(key.matrix, 1, function(x) {x[1]||x[2]||x[3]||x[4]})
dataset <- dataset[key.vector]
for (i in 1:length(names(dataset))) {
    names(dataset)[i] <- gsub("\\(|\\)", "", names(dataset)[i])
}
rm(keywords, key.matrix, key.vector, i)
message("... removed unnecessary columns")

## compute the average value of each variable by subject and activity
result <-aggregate(dataset, by=list(dataset$subject, dataset$activity), FUN=mean)
result$subject <- result$activity <- NULL
names(result)[1] <- "subject"
names(result)[2] <- "activity"
message("... computed averages")

## write the output table to a file
setwd(dir.main)
write.table(result, "uci_har_dataset_clean.txt", row.names=F)
rm(dataset, dir.main, dir.dataset.main, dir.test, dir.train)
message("... wrote the result to the file 'uci_har_dataset_clean.txt' ")
message("Done.")
