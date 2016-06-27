After X_test.txt is read in as testdata, the column names are taken from the second column of features.txt. 
The activity is read from y_test.txt. And the people who performed the measurements is read from subject_test.txt. 
Then data frame testdata and activity, performer are combined into a new data frame using cbind.
The same process is repeated for training data.
Then the resulted test data and training data are combined into a data frame all_data using rbind.
In order to grab those variables related to mean and standard deviation, grep function and regular expression are used to identify them. Afterwards, subset to those columns as well as performer and activity columns.
Finally, "aggregate()" function is used to calculate the mean for each performer and activity combination group.

