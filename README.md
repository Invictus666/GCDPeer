GCD Peer Assignment Submission
==============================

##Run_Analysis() Function

To run this script simply load the source file Run_Analysis.R.

Run the Run_Analysis() function without any parameters. It returns the "tidy-dataset"

eg. result <- Run_Analysis()

Variable result will contain a list of tables containing the mean of each recorded variable broken down by acitivity and subjects  

The system requires the following to be the same directory to work.

+ Features.txt
+ Activity_labels.txt
+ subject_test.txt
+ x_test.txt
+ y_test.txt
+ subject_train.txt
+ x_train.txt
+ y_train.txt

##Tidy_data_set.txt

You can load the data set by issuing the following commands.

Load("Tidy_data_set.txt")

The variable result contains the vector of tables.

