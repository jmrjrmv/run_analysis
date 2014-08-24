library(reshape2)
#  read the list of all features and put them in a data frame
df_features = read.table("./dataset/UCI HAR Dataset/features.txt")

#  read the class labels with their activity name , put them in a data frame
# and add column names "activity number" and "activity name" to the data frame
df_activity = read.table("./dataset/UCI HAR Dataset/activity_labels.txt")
colnames(df_activity) <- c("activityNumber","activityName")

#  read the subject who performed the activity, put it in a data frame
# and add column name "subject" to the data frame
subtrain = read.table("./dataset/UCI HAR Dataset/train/subject_train.txt")
colnames(subtrain) <- c("subject")

#  read the training set and put in a data frame
# and add column names using the vector of features 
# then  extract only mean and std values
xtrain = read.table("./dataset/UCI HAR Dataset/train/X_train.txt")
colnames(xtrain) <- df_features[,2]
xtrainmeanstd <- cbind(xtrain[,grep("mean()",names(xtrain),fixed=TRUE)],xtrain[,grep("std()",names(xtrain),fixed=TRUE)])

#  read the training labels and put them a data frame
# and add column names column name "activity number" 
ytrain = read.table("./dataset/UCI HAR Dataset/train/y_train.txt")
colnames(ytrain) <- c("activityNumber")


# begin repeat same instructions than train files for test files 
subtest = read.table("./dataset/UCI HAR Dataset/test/subject_test.txt")
colnames(subtest) <- c("subject")

xtest = read.table("./dataset/UCI HAR Dataset/test/X_test.txt")
colnames(xtest) <- df_features[,2]
xtestmeanstd <- cbind(xtest[,grep("mean()",names(xtest),fixed=TRUE)],xtest[,grep("std()",names(xtest),fixed=TRUE)])

ytest = read.table("./dataset/UCI HAR Dataset/test/y_test.txt")
colnames(ytest) <- c("activityNumber")
# end repeat same instructions than train files for test files


# merge train elements adding columns
alldatatrain <- cbind(ytrain,subtrain,xtrainmeanstd)

# merge test elements  adding columns
alldatatest <- cbind(ytest,subtest,xtestmeanstd)

# merge train and test elements  adding rows
alldata <- rbind(alldatatrain,alldatatest)

#extract measurement variables mean() and std()
measure_meanstd_vars <- as.vector(names(xtrainmeanstd))

#mean of each measurement variable by activity and subject
alldataMelt <- melt(alldata,id=c("activityNumber","subject"),measure.vars=measure_meanstd_vars)
alldataMelt_mean <- dcast(alldataMelt,activityNumber+subject~variable,mean)

#add activity Names
tidydata <- merge(df_activity,alldataMelt_mean,by.x="activityNumber",by.y="activityNumber")

#create tidydataset.txt file
write.table(tidydata,file="./tidydataset.txt",row.names=FALSE)

