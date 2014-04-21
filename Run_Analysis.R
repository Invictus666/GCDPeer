extraction <-  function(subjectfile,datafile,labelfile)
{
  
  ## Extracts subject,x_file and y_file to build a dataset
  ## Combines subject, activity label and data into one dataset.
  
  
  subject <- read.table(subjectfile,sep=" ")
  label <- read.table(labelfile,sep=" ")
  data <- read.table(datafile,fill=TRUE)
  activeref <- read.table("activity_labels.txt")
  
  features <- read.table("features.txt")
  
  colnames(data) <- features$V2

  result <- cbind(subject, label, data[,c(grep("mean|std",features$V2))])
  
  colnames(result)[1] <- "subject"
  colnames(result)[2] <- "label"
  
  result$activity <- activeref$V2[result$label]
  
  result
}

Create_Data <- function()
{
  
  ## Calls the extraction function on all text files in this project.
  ## All files need to be in the working directory for this to work.
  
  ## Returns a dataset which combines train and test data
  
  test_result <- extraction("subject_test.txt", "x_test.txt","y_test.txt")
  train_result <- extraction("subject_train.txt", "x_train.txt","y_train.txt")
  
  final_result <- rbind(test_result,train_result)
  final_result

}

Mean_Table <- function(data,index)
{
  ## This function creates a table of mean values for one input variable.
  ## Table cross references activity and subject. 
  
  
  vtbl <- cbind(data$subject,data$activity,data[,index])
  colnames(vtbl) <- c("subject","activity","value")
  
  xtsum <- xtabs(value ~ subject + activity, data=vtbl)
  xtcount <- xtabs( ~ subject + activity, data=vtbl)
  
  result <- xtsum/xtcount
  result
}

Create_Neat_Table <- function(data)
{
  ## This function loops through the input data and create a vector of tables using the Mean_Table() function
  
  ## It returns a list of tables which cross references activity and subject for each variable.
  
  
  result <- vector(mode="list")
  
  for (i in 3:81)
  {
    vtl <- Mean_Table(data,i)
    result[[colnames(data)[i]]] <- vtl
  }
  result
}

Run_Analysis <- function()
{
  
  ## The final R_Analysis program creates a dataset and returns a vactor of tables which contains the means 
  ## of recorded variables cross referenced by activity and subject.
  
  dataset <- Create_Data()
  final <- Create_Neat_Table(dataset)
  
  final
  
}
