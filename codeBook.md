The Data - 

The data is also known as Human activity recognition using smartphones dataset.
The data was obtained by experiment on volunteer who wore a smartphone on their
waist and carried out various activities. The accelerometer and gyroscope 
sensor on the smartphone  captured measurements of linear acceleration in three 
different axis(x,y,z),  angular velocity in three different axis(x,y,z).
The activities were observed  visually whilst the smart phone was measuring the 
observables. Other observables were also calculated using these primary 
measurements. Data was also measured in  frequency domain and result for frequency 
domain are also presented.

The data required to prepare the tidy data set is in two different folders train 
and test. Inside each of these two folder there is a file one for the feature 
vectors(X), one for the label/target(y) and one containing subject id for which 
the data is presented. The folder structure is shown below.

    - UCI HAR Dataset/activity_labels.txt
    - UCI HAR Dataset/features_info.txt
    - UCI HAR Dataset/features.txt
    - UCI HAR Dataset/README.txt
    - UCI HAR Dataset/train/X_train.txt
    - UCI HAR Dataset/train/y_train.txt
    - UCI HAR Dataset/train/subject_train.txt
    - UCI HAR Dataset/Inertial Signals/ 
    - UCI HAR Dataset/test/X_test.txt
    - UCI HAR Dataset/test/y_test.txt
    - UCI HAR Dataset/test/subject_train.txt
    - UCI HAR Dataset/Inertial Signals/ 


1. activity_labels.txt: Contains the numerical value along with the activity 
that the numerical value represent.  This will come in handy when we want to use 
proper labels for the activity rather than a numerical value.

2. features_info.txt: Has all the information about the calculation and details 
of the observables used as features.

3. feature.txt: This file has all the observable name along with the numerical 
value that  used to represent those features/observable in the data files. 
This file will come in handy when we want to extract subset of observables
based on the aggregation performed on them. For Ex. Using this file we can get 
the numerical index of tBodyAcc-mean()-x or tBodyAccMag-mean() etc. 

4. README.txt: This file has some more information about the original dataset. 

5. train/X_train.txt: Contains all the feature values for the training data for 
each subject. Each column represents one measurement of one observable.

6. train/y_train.txt: Has activities for each subject represented as a numerical 
value. Using activity_label.txt one can extract the activity name.

7. train/subject_train.txt: This file contains Subject ids for the training data.

8. train/Inertial Signals: This folder contain individual observation corresponding 
to training data for each subject. We won't use it for our work.


9. test/X_test.txt: Contains the feature values for the test data for 
each subject.

10. test/y_test.txt: Activity/label corresponding to X_test.txt.

11. test/subject_test.txt: This file contains Subject ids for the test data.

12. test/Inertial Signals: Folder with individual observation for each subject.

We are interested in the following features out of all 561:
    tBodyAcc-mean()-X           
    tBodyAcc-mean()-Y           
    tBodyAcc-mean()-Z           
    tBodyAcc-std()-X            
    tBodyAcc-std()-Y            
    tBodyAcc-std()-Z           
    tGravityAcc-mean()-X        
    tGravityAcc-mean()-Y        
    tGravityAcc-mean()-Z        
    tGravityAcc-std()-X         
    tGravityAcc-std()-Y         
    tGravityAcc-std()-Z        
    tBodyAccJerk-mean()-X       
    tBodyAccJerk-mean()-Y       
    tBodyAccJerk-mean()-Z       
    tBodyAccJerk-std()-X        
    tBodyAccJerk-std()-Y        
    tBodyAccJerk-std()-Z       
    tBodyGyro-mean()-X         
    tBodyGyro-mean()-Y          
    tBodyGyro-mean()-Z          
    tBodyGyro-std()-X           
    tBodyGyro-std()-Y           
    tBodyGyro-std()-Z          
    tBodyGyroJerk-mean()-X
    tBodyGyroJerk-mean()-Y      
    tBodyGyroJerk-mean()-Z      
    tBodyGyroJerk-std()-X      
    tBodyGyroJerk-std()-Y       
    tBodyGyroJerk-std()-Z      
    tBodyAccMag-mean()       
    tBodyAccMag-std()           
    tGravityAccMag-mean()          
    tGravityAccMag-std()        
    tBodyAccJerkMag-mean()      
    tBodyAccJerkMag-std()      
    tBodyGyroMag-mean()        
    tBodyGyroMag-std()          
    tBodyGyroJerkMag-mean()     
    tBodyGyroJerkMag-std()      
    fBodyAcc-mean()-X           
    fBodyAcc-mean()-Y          
    fBodyAcc-mean()-Z           
    fBodyAcc-std()-X            
    fBodyAcc-std()-Y            
    fBodyAcc-std()-Z            
    fBodyAccJerk-mean()-X       
    fBodyAccJerk-mean()-Y      
    fBodyAccJerk-mean()-Z      
    fBodyAccJerk-std()-X       
    fBodyAccJerk-std()-Y        
    fBodyAccJerk-std()-Z        
    fBodyGyro-mean()-X          
    fBodyGyro-mean()-Y         
    fBodyGyro-mean()-Z         
    fBodyGyro-std()-X           
    fBodyGyro-std()-Y           
    fBodyGyro-std()-Z           
    fBodyAccMag-mean()          
    fBodyAccMag-std()          
    fBodyBodyAccJerkMag-mean()
    fBodyBodyAccJerkMag-std()  
    fBodyBodyGyroMag-mean()     
    fBodyBodyGyroMag-std()      
    fBodyBodyGyroJerkMag-mean()
    fBodyBodyGyroJerkMag-std() 

Each of the feature is measured along three (X,Y,Z) axis and also has mean and 
standard deviation value. 

Along with feature we have label(Activity_Name) and subject id.
    Activity_Name               
    Subject          




The task we want to achieve is combine features, label and subject ids for each
subject. So, we know the feature value and the activity those feature values
describes.


This has to be done in both train and test folder so we have two complete dataset. 
Then we combine both these dataset and select only columns we are interested in.

We follow these steps.
    
1 - Using grep to search on the contents of features.txt we obtain the numerical 
values that represents the averaged observable(stored in one array) as well as 
the numerical value that represents the standard deviation of the observables 
(stored in another array). Both these arrays are combined and sorted according
to the values they contain.


2 - Combine X_training.txt, X_test.txt using rbind.

3 - Combine y_training.txt, y_test.txt using rbind

4 - Combine subject_training.txt, subject_text.txt using rbind
    
5 - Combine(X,y,sub) using cbind into a dataframe 

    
6 - Generate a header for dataframe using the observables names, activity and 
subject id.

7 - Names the columns of the dataframe using the header. 

8 - Export the dataframe to a file "tidydataset1.csv".    

9 - For step 5 of the assignment we extract the column corresponding to average 
value of observables, activity name and subject ids.

10 - Export this dataframe into another file tidydataset2.csv




