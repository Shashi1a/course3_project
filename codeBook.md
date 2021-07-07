The Data - 

The data is also known as Human activity recognition using smartphones dataset.
The data was obtained by experiment on volunteer who wore a smartphone on their
waist and carried out various activities. The accelerometer and gyroscope 
sensor on the smartphone captured measurements of linear acceleration in three 
different axis(x,y,z),  angular velocity in three different axis(x,y,z).
The activities were observed  visually whilst the smart phone was measuring the 
observables. Other observables were also calculated using these primary 
measurements. Data was also tranformed in  frequency domain and result for frequency 
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

For first part we are interested in the following features out of all 561, their 
value lies in the range[-1:1]. column id and column name for the first dataset is
shown below (step 4).
    column id   column name
    1           tBodyAcc-mean()-X           
    2           tBodyAcc-mean()-Y           
    3           tBodyAcc-mean()-Z           
    4           tBodyAcc-std()-X            
    5           tBodyAcc-std()-Y            
    6           tBodyAcc-std()-Z           
    7           tGravityAcc-mean()-X        
    8           tGravityAcc-mean()-Y        
    9           tGravityAcc-mean()-Z        
    10          tGravityAcc-std()-X         
    11          tGravityAcc-std()-Y         
    12          tGravityAcc-std()-Z        
    13          tBodyAccJerk-mean()-X       
    14          tBodyAccJerk-mean()-Y       
    15          tBodyAccJerk-mean()-Z       
    16          tBodyAccJerk-std()-X        
    17          tBodyAccJerk-std()-Y        
    18          tBodyAccJerk-std()-Z       
    19          tBodyGyro-mean()-X         
    20          tBodyGyro-mean()-Y          
    21          tBodyGyro-mean()-Z          
    22          tBodyGyro-std()-X           
    23          tBodyGyro-std()-Y           
    24          tBodyGyro-std()-Z          
    25          tBodyGyroJerk-mean()-X
    26          tBodyGyroJerk-mean()-Y      
    27          tBodyGyroJerk-mean()-Z      
    28          tBodyGyroJerk-std()-X      
    29          tBodyGyroJerk-std()-Y       
    30          tBodyGyroJerk-std()-Z      
    31          tBodyAccMag-mean()       
    32          tBodyAccMag-std()           
    33          tGravityAccMag-mean()          
    34          tGravityAccMag-std()        
    35          tBodyAccJerkMag-mean()      
    36          tBodyAccJerkMag-std()      
    37          tBodyGyroMag-mean()        
    38          tBodyGyroMag-std()          
    39          tBodyGyroJerkMag-mean()     
    40          tBodyGyroJerkMag-std()      
    41          fBodyAcc-mean()-X           
    42          fBodyAcc-mean()-Y          
    43          fBodyAcc-mean()-Z           
    44          fBodyAcc-std()-X            
    45          fBodyAcc-std()-Y            
    46          fBodyAcc-std()-Z            
    47          fBodyAccJerk-mean()-X       
    48          fBodyAccJerk-mean()-Y      
    49          fBodyAccJerk-mean()-Z      
    50          fBodyAccJerk-std()-X       
    51          fBodyAccJerk-std()-Y        
    52          fBodyAccJerk-std()-Z        
    53          fBodyGyro-mean()-X          
    54          fBodyGyro-mean()-Y         
    55          fBodyGyro-mean()-Z         
    56          fBodyGyro-std()-X           
    57          fBodyGyro-std()-Y           
    58          fBodyGyro-std()-Z           
    59          fBodyAccMag-mean()          
    60          fBodyAccMag-std()          
    61          fBodyBodyAccJerkMag-mean()
    62          fBodyBodyAccJerkMag-std()  
    63          fBodyBodyGyroMag-mean()     
    64          fBodyBodyGyroMag-std()      
    65          fBodyBodyGyroJerkMag-mean()
    66          fBodyBodyGyroJerkMag-std() 

Each of the feature is measured along three (X,Y,Z) axis and also has mean and 
standard deviation value. 

Along with feature we have y(Activity_Name).
    67          Activity_Name:
            Possible value and numerical index of Activity_Name
            Numerical value     Activity Name
            1                   WALKING
            2                   WALKING_UPSTAIRS
            3                   WALKING_DOWNSTAIRS
            4                   SITTING
            5                   STANDING
            6                   LAYING
              

There are total 30 subjects so subject id starts from 1 and ends at 30.
    68          Subjects


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
    
8 - For step 5 of the assignment we perform an aggregation  over all the observables
from pervious step for each activity and each subject. Performed using aggregation function
    excluding column for Activity name and Subject.
    datafinal<-aggregate(data[,-c(67,68)],by=list(data1$Activity_Name,data1$Subject),mean)

        
9 - Export this dataframe into another file tidydataset2.txt.
