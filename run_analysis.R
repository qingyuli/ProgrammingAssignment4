## Data Cleaning Week 4 Quiz
getwd()

activitylabel<- read.table(file="activity_labels.txt")
varnames<-read.table(file="features.txt")

# read in test data
testdata<-read.table(file="X_test.txt")
dim(testdata)
class(testdata)

testactivity<-read.table(file="y_test.txt")
dim(testactivity)
class(testactivity)

testperformer<-read.table(file="subject_test.txt")
dim(testperformer)

testdata2<-cbind(testdata, testactivity, testperformer)
as.character(varnames$V2)
names(testdata2)<-c(as.character(varnames$V2), c("activity","performer"))

class(testdata2)
dim(testdata2)
names(testdata2)

body_acc_x_test <- read.table(file="body_acc_x_test.txt")
body_acc_y_test <- read.table(file="body_acc_y_test.txt")
body_acc_z_test <- read.table(file="body_acc_z_test.txt")
body_gyro_x_test <- read.table(file="body_gyro_x_test.txt")
body_gyro_y_test <- read.table(file="body_gyro_y_test.txt")
body_gyro_z_test <- read.table(file="body_gyro_z_test.txt")
total_acc_x_test <- read.table(file="total_acc_x_test.txt")
total_acc_y_test <- read.table(file="total_acc_y_test.txt")
total_acc_z_test <- read.table(file="total_acc_z_test.txt")
body_acc_x_test_colname <- paste("body_acc_x_", colnames(body_acc_x_test),sep="")
body_acc_y_test_colname <- paste("body_acc_y_", colnames(body_acc_y_test),sep="")
body_acc_z_test_colname <- paste("body_acc_z_", colnames(body_acc_z_test),sep="")
body_gyro_x_test_colname <- paste("body_gyro_x_", colnames(body_gyro_x_test),sep="")
body_gyro_y_test_colname <- paste("body_gyro_y_", colnames(body_gyro_y_test),sep="")
body_gyro_z_test_colname <- paste("body_gyro_z_", colnames(body_gyro_z_test),sep="")
total_acc_x_test_colname <- paste("total_acc_x_", colnames(total_acc_x_test),sep="")
total_acc_y_test_colname <- paste("total_acc_y_", colnames(total_acc_y_test),sep="")
total_acc_z_test_colname <- paste("total_acc_z_", colnames(total_acc_z_test),sep="")

testdata3 <- cbind(testdata2, 
				    body_acc_x_test, body_acc_y_test, body_acc_z_test,   
				    body_gyro_x_test, body_gyro_y_test, body_gyro_z_test, 
					total_acc_x_test, total_acc_y_test, total_acc_z_test)
names(testdata3) <- c(names(testdata2), 
					  body_acc_x_test_colname, body_acc_y_test_colname, body_acc_z_test_colname, 
					  body_gyro_x_test_colname, body_gyro_y_test_colname, body_gyro_z_test_colname, 
					  total_acc_x_test_colname, total_acc_y_test_colname, total_acc_z_test_colname)

dim(testdata3)
names(testdata3)


# read in train data

traindata<-read.table(file="X_train.txt")
dim(traindata)
class(traindata)

trainactivity<-read.table(file="y_train.txt")
dim(trainactivity)
class(trainactivity)

trainperformer<-read.table(file="subject_train.txt")
dim(trainperformer)

traindata2<-cbind(traindata, trainactivity, trainperformer)
names(traindata2)<-c(as.character(varnames$V2), c("activity","performer"))

class(traindata2)
dim(traindata2)
names(traindata2)

body_acc_x_train <- read.table(file="body_acc_x_train.txt")
body_acc_y_train <- read.table(file="body_acc_y_train.txt")
body_acc_z_train <- read.table(file="body_acc_z_train.txt")
body_gyro_x_train <- read.table(file="body_gyro_x_train.txt")
body_gyro_y_train <- read.table(file="body_gyro_y_train.txt")
body_gyro_z_train <- read.table(file="body_gyro_z_train.txt")
total_acc_x_train <- read.table(file="total_acc_x_train.txt")
total_acc_y_train <- read.table(file="total_acc_y_train.txt")
total_acc_z_train <- read.table(file="total_acc_z_train.txt")
body_acc_x_train_colname <- paste("body_acc_x_", colnames(body_acc_x_train),sep="")
body_acc_y_train_colname <- paste("body_acc_y_", colnames(body_acc_y_train),sep="")
body_acc_z_train_colname <- paste("body_acc_z_", colnames(body_acc_z_train),sep="")
body_gyro_x_train_colname <- paste("body_gyro_x_", colnames(body_gyro_x_train),sep="")
body_gyro_y_train_colname <- paste("body_gyro_y_", colnames(body_gyro_y_train),sep="")
body_gyro_z_train_colname <- paste("body_gyro_z_", colnames(body_gyro_z_train),sep="")
total_acc_x_train_colname <- paste("total_acc_x_", colnames(total_acc_x_train),sep="")
total_acc_y_train_colname <- paste("total_acc_y_", colnames(total_acc_y_train),sep="")
total_acc_z_train_colname <- paste("total_acc_z_", colnames(total_acc_z_train),sep="")

traindata3 <- cbind(traindata2, 
					body_acc_x_train, body_acc_y_train, body_acc_z_train, 
					body_gyro_x_train, body_gyro_y_train, body_gyro_z_train,
					total_acc_x_train, total_acc_y_train, total_acc_z_train)

names(traindata3) <- c(names(traindata2),
						body_acc_x_train_colname, body_acc_y_train_colname, body_acc_z_train_colname,
 						body_gyro_x_train_colname, body_gyro_y_train_colname, body_gyro_z_train_colname,
 						total_acc_x_train_colname, total_acc_y_train_colname, total_acc_z_train_colname)

dim(traindata3)
names(traindata3)

# Merge the training and the test sets create one data set
all_data <- rbind(traindata3, testdata3)
dim(all_data)

# Extracts only the measurements on the mean and standard deviation for each measurement.
all_colname<- names(all_data)
measurement_colname <- grep("mean()|std()", all_colname,value=T)
measurement_col_index <- grep("mean()|std()", all_colname)
measurement_data <- all_data[, measurement_col_index]
dim(measurement_data)

step2_data <- cbind(measurement_data, all_data$performer, all_data$activity)
names(step2_data)[80] <- "performer"
names(step2_data)[81] <- "activity"

dim(step2_data)
names(step2_data)

# step 5
mean_subgroup <- aggregate(step2_data[, 1:79], list(step2_data$performer, step2_data$activity), mean)
names(mean_subgroup)[1] <- "performer"
names(mean_subgroup)[2] <- "activity"

names(activitylabel)
names(activitylabel)[2] <- "activity-description"
final_data <- merge(mean_subgroup, activitylabel, by.x="activity", by.y="V1")
dim(final_data)
names(final_data)
final_data
write.table(final_data, file="tidy_data_step_5.txt", row.name=F)
