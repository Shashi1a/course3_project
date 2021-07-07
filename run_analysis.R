#### This function will load  data files from folders train, test and combine  
###  them in one file.
### All the features are stored in files X_train.txt and X_test.txt for the 
### training ans test data respectively.
### ALl the label/activities are stored in files y_train.txt , y_test.txt for
### the training as well as test data respectively.
### Subject ids are stored in files subject_train.txt and subject_test.txt for the 
### training as well as test data respectively.
### Only features corresponding to mean and standard deviation of the observables
### are extracted also activity name and subject ids are also extracted.
### Output of the code are two tidy dataset one has mean, standard deviation for 
### each activity and each subject.
### Other file contain second tidy dataset that has only mean of observable for 
### each activity and for each subject.

combineData<-function()
    {
    
        # get the working directory need it to load the file
        xi<-getwd()
    
        # location of file containing feature names 
        fin<-paste(xi,"/UCI HAR Dataset","/features.txt",sep="")
        
        # all the feature names are stored in feature
        features<-read.csv(fin,sep="",header=FALSE)
        # now we will extract the feature we are interested in 
        
        # feature that stored mean of the observable
        mean_col<-grep("mean\\(\\)",features[,2])

        # feature that stored standard deviation of the observable
        std_col<-grep("std\\(\\)",features[,2])
        
        
        # combining and ordering such that we have index of all the columns that 
        # we need for the datafile
        combined_indx<-append(mean_col,std_col)
        sorted_list<-combined_indx[order(combined_indx)]
        
        # file name of the features for the training data and test data
        ftrain<-paste(xi,"/UCI HAR Dataset","/train/","X_train.txt",sep="") 
        ftest<-paste(xi,"/UCI HAR Dataset","/test/","X_test.txt",sep="") 
        
        # file name for the train and test subjects
        subtrain<-paste(xi,"/UCI HAR Dataset","/train/","subject_train.txt",sep="") 
        subtest<-paste(xi,"/UCI HAR Dataset","/test/","subject_test.txt",sep="") 

        # file name for the training as well as test label        
        labeltrain<-paste(xi,"/UCI HAR Dataset","/train/","y_train.txt",sep="") 
        labeltest<-paste(xi,"/UCI HAR Dataset","/test/","y_test.txt",sep="") 
        
        # loading the training data and test data 
        dtrain <- read.csv(ftrain,sep = '',header = FALSE)
        dtest <- read.csv(ftest,sep = '',header = FALSE)
        
        # loading the label for training and test data
        dlabeltrain<-read.csv(labeltrain,sep='',header=FALSE)
        dlabeltest<-read.csv(labeltest,sep='',header = FALSE)
        
        
        # loading the subject file for training and test data
        dsubtrain<-read.csv(subtrain,sep='',header=FALSE)
        dsubtest<-read.csv(subtest,sep='',header=FALSE)
        dsubject<-rbind(dsubtrain,dsubtest)
        
        # combining both the data frame for data as well as label
        labelcomplete<-rbind(dlabeltrain,dlabeltest)
        activities<-c('WALKING','WALKING_UPSTAIRS','WALKING_DOWNSTAIRS','SITTING','STANDING','LAYING')
        for(i in seq(1,length(activities))){print(i)
            labelcomplete[labelcomplete==as.character(i)]<-activities[i]}
        
        # combining data 
        datacomplete <- rbind(dtrain,dtest)
        
        # array to store names of all the features and activity
        cname<-array(dim=length(sorted_list)+2)

        # setting feature names as array entries
        # the last entry is the Activity_Name column
        for(i in seq(1,length(sorted_list))){cname[i]=as.character(features[sorted_list[i],2])}
        cname[length(sorted_list)+1]='Activity_Name'
        cname[length(sorted_list)+2]='Subject'

        # combining features of mean and standard deviation of observable and label 
        dataset1<-cbind(datacomplete[,sorted_list],labelcomplete,dsubject)

        # setting column names of the dataframe
        colnames(dataset1)<-cname
  
        # array containing names of averaged measurement
        datafinal<-aggregate(data1[,-c(67,68)],by=list(data1$Activity_Name,data1$Subject),mean)
    
        # saving the dataset in a txt file
        write.table(datafinal,"./tidydataset2.txt",row.names = FALSE)
    }