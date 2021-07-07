This README.md contains only few additional details apart from the one that is 
supplied with the data.


Following files/folders are present in the directory:

    - README.md: Read me file
    - UCI HAR Dataset: Folder with all the data
    - codeBook.md : Explains all the steps taken to prepare two new tidy datasets 
        tidydataset1.csv and tidydataset2.csv
    - dataset1.csv: The data set that has mean and standard deviation of all the 
        subjects as well as the labelled activities. 
    - dataset2.csv: The dataset that has only mean value of all the observables and 
        activity  for all the subjects.
    - run_analysis.R: The r script that does all the preprocessing required to 
        prepare two tidy datasets from the raw data stored in train and test folder. 


Script run_analysis.R performs the task of cleaning the data.

It searches for the data folder UCI HAR Dataset  in your working 
directory. You can download the entire folder and move it to your working directory.

To compile the script:

1- first source it into the console using source("run_analysis.R").
2- call the function datacollect() (without any argument).