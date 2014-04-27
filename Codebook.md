# Codebook

a) Transformation of variables are performed this way :

The extraction function combines subject, x_file and y_file into one large dataset called result. 
Within the result data frame, a column called activity is added which contains descriptive names instead of numeric variabled.

b) The Create_data function combines training and test data into one dataset. It calls the extraction function.

c) The mean_table function creates a table of mean values for one column given a data frame produced by the Create_data.

d) Neat_table calls mean_table to create a list of xtabs corresponding to each column in the data frame.

e) Run_Analysis is the final function : 
+ It calls the Create_data to combine the training and test values into a data frame called dataset.
+ It also calls Neat_Table() to generate a list of xtabs which cross reference subject with activity.
