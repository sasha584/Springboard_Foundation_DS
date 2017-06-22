dataset_dir <- '/Users/sasha/R_projects/springboard-foundation-ds-tasks/Third task/Source data/UCI HAR Dataset'
test_dir <- paste(dataset_dir, "test", sep="/")
train_dir <- paste(dataset_dir, "train", sep="/")

#1.Merge the training and the test sets to create one data set.

#1.1Create train_table, add column train_data to mark if the data is from train or test part and assign column names from "features" file. 
#The "features"as a factor vector contains doubled values. It troubles simple assigning to the column names of X_train. 
#So I've decided to use make.names. Did I solve the problem correctly? 

X_train <- read.table(paste(train_dir, 'X_train.txt', sep="/"))
X_test <- read.table(paste(test_dir, 'X_test.txt', sep="/"))

features <- read.table(paste(dataset_dir, 'features.txt', sep="/"))
column_names <- make.names(unlist(features[2]), TRUE)
colnames(X_train) <- column_names
colnames(X_test) <- column_names

X_train$train_data <- c(as.logical(x=TRUE))
X_test$train_data <- c(as.logical(x=FALSE))

#1.2Add columns with activity name, subject, innertial signals to x_train 
activity_train <- c(read.table(paste(train_dir, 'y_train.txt', sep='/')))
subject_train <- c(read.table(paste(train_dir, 'subject_train.txt', sep='/')))
y <- list(activity_train, subject_train)

train_inertial_signals_dir <- paste(train_dir, 'Inertial Signals', sep='/')

body_acc_x_train <- read.table(paste(train_inertial_signals_dir, 'body_acc_x_train.txt', sep='/'))
body_acc_y_train <- read.table(paste(train_inertial_signals_dir, 'body_acc_y_train.txt', sep='/'))
body_acc_z_train <- read.table(paste(train_inertial_signals_dir, 'body_acc_z_train.txt', sep='/'))
body_gyro_x_train <- read.table(paste(train_inertial_signals_dir, 'body_gyro_x_train.txt', sep='/'))
body_gyro_y_train <- read.table(paste(train_inertial_signals_dir, 'body_gyro_y_train.txt', sep='/'))
body_gyro_z_train <- read.table(paste(train_inertial_signals_dir, 'body_gyro_z_train.txt', sep='/'))
total_acc_x_train <- read.table(paste(train_inertial_signals_dir, 'total_acc_x_train.txt', sep='/'))
total_acc_y_train <- read.table(paste(train_inertial_signals_dir, 'total_acc_y_train.txt', sep='/'))
total_acc_z_train <- read.table(paste(train_inertial_signals_dir, 'total_acc_z_train.txt', sep='/'))

innertial_signals_train <- data.frame(body_acc_x_train, body_acc_y_train, body_acc_z_train, body_gyro_x_train, body_gyro_y_train, body_gyro_z_train, total_acc_x_train, total_acc_y_train, total_acc_z_train)

train_dataset <- data.frame(y, innertial_signals_train, X_train)

#1.3 Repeat for test_dataset

activity_test <- c(read.table(paste(test_dir, 'y_test.txt', sep='/')))
subject_test <- c(read.table(paste(test_dir, 'subject_test.txt', sep='/')))

h <- list(activity_test, subject_test)

test_inertial_signals_dir <- paste(test_dir, 'Inertial Signals', sep='/')

body_acc_x_test <- read.table(paste(test_inertial_signals_dir, 'body_acc_x_test.txt', sep='/'))
body_acc_y_test <- read.table(paste(test_inertial_signals_dir, 'body_acc_y_test.txt', sep='/'))
body_acc_z_test <- read.table(paste(test_inertial_signals_dir, 'body_acc_z_test.txt', sep='/'))
body_gyro_x_test <- read.table(paste(test_inertial_signals_dir, 'body_gyro_x_test.txt', sep='/'))
body_gyro_y_test <- read.table(paste(test_inertial_signals_dir, 'body_gyro_y_test.txt', sep='/'))
body_gyro_z_test <- read.table(paste(test_inertial_signals_dir, 'body_gyro_z_test.txt', sep='/'))
total_acc_x_test <- read.table(paste(test_inertial_signals_dir, 'total_acc_x_test.txt', sep='/'))
total_acc_y_test <- read.table(paste(test_inertial_signals_dir, 'total_acc_y_test.txt', sep='/'))
total_acc_z_test <- read.table(paste(test_inertial_signals_dir, 'total_acc_z_test.txt', sep='/'))

innertial_signals_test <- data.frame(body_acc_x_test, body_acc_y_test, body_acc_z_test, body_gyro_x_test, body_gyro_y_test, body_gyro_z_test, total_acc_x_test, total_acc_y_test, total_acc_z_test)

test_dataset <- data.frame(h, innertial_signals_test, X_test)

#1.4 Merge test and train data parts into one dataset
x_var <- rbind(train_dataset, test_dataset)

#2:"Create two new columns, containing the mean and standard deviation for each measurement respectively" 
#- didn't get if data for this columns should be calculetaed by me? If yes, how can I calculate? 
#First idea - estimate average meaning, but wouldn't it be harmful for the data? 

#3: Create variables called ActivityLabel and ActivityName that label 
#all observations with the corresponding activity labels and names respectively

#4: From the data set in step 3, creates a second, independent tidy data set with the average of each variable for each activity and each subject.













