 
getData <- function(directory, keyword) {
    
    ## set the necessary working directory
    setwd(directory)
    
    ## get source file names
    subject.file <- paste("subject_", keyword, ".txt", sep="")
    y.file <- paste("y_", keyword, ".txt", sep="")
    x.file <- paste("X_", keyword, ".txt", sep="")
    
    ## get the data
    s <- read.table(subject.file)
    y <- read.table(y.file)
    x <- read.table(x.file)
    
    ## merge files
    result <- cbind(s, y)
    names(result)[1] <- "subject"
    names(result)[2] <- "activity"
    result <- cbind(result, x)
    
    message(paste("... got the", keyword, "dataset"))
    return(result)
}

