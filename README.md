run_analysis
============

Generate a tidy data set from data collected from the accelerometers from the Samsung Galaxy S smartphone

1 - INTRODUCTION
=================

This repo contains R script run_analysis.R. 
This script creates a tidy data set with data collected from the accelerometers from the Samsung Galaxy S smartphone. This data concerns Human Activity Recognition Using Smartphones Dataset.
The experiments have been carried out with a group of 30 subjects volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 


The script of this repo generates a tidy data set with the average of each measurement for each activity and each person.

2 - BEFORE RUNNING THE SCRIPT
=============================

a) Download the data set "dataset.zip" from the Url https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

b) decompress the file in your working directory

c) A "dataset" directory is created in your working directory with this following tree (tree described here with the main files and directories) :

	-dataset/
	
		-UCI HAR Dataset/
		
				-activity_labels.txt
				-features.txt
				-features_info.txt
				-README.txt
				
				-train/
						-subject_train.txt
						-X_train.txt
						-y_train.txt
						
				-test/
						-subject_test.txt
						-X_test.txt
						-y_test.txt
  
        
        

File README.txt explains the meaning of all the files of the dataset directory.

3 - RUN THE SCRIPT
=============================

a) run R console

b) change to the working directory

c) install package reshape2  :  install.packages("reshape2")

d) run script run_analysis.R  : source("run_analysis.R")


4 - RESULT
=============================

The result is the text file "tidydataset.txt" generated in your working directory. 
This file is a tidy data set containing the average of each measurement for each activity and each person.
You can find its description in codeBook.md and some explanations about how it is created.

Regards.

