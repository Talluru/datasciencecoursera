#Reading train data and merging
X_train <- read.table("D:/Coursera/Data Science/Cleaning Data/Data/UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
y_train <- read.table("D:/Coursera/Data Science/Cleaning Data/Data/UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")
features <- read.table("D:/Coursera/Data Science/Cleaning Data/Data/UCI HAR Dataset/features.txt", quote="\"", comment.char="")
subject_train <- read.table("D:/Coursera/Data Science/Cleaning Data/Data/UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")
names(subject_train)<-"Subject"

names(y_train)<-"Index"
colnames(X_train)<-features[,2]
X_y_train<-cbind(y_train,subject_train,X_train)



#Reading test data and merging
X_test <- read.table("D:/Coursera/Data Science/Cleaning Data/Data/UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")
y_test <- read.table("D:/Coursera/Data Science/Cleaning Data/Data/UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")
subject_test <- read.table("D:/Coursera/Data Science/Cleaning Data/Data/UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")
names(subject_test)<-"Subject"


names(y_test)<-"Index"
colnames(X_test)<-features[,2]
X_y_test<-cbind(y_test,subject_test,X_test)     #Merging both index and test data


X_y_total<-rbind(X_y_train,X_y_test)    #Combining bothe test and train data

X_y_extract<-X_y_total[,1:8]     #Extracting only mean and standard deviation data

X_y_discriptive<-merge(activity_labels,X_y_extract,by.x="V1",by.y = "Index",all.y = TRUE)  #Changing the Activity index to Activity names


Variables<-c("Index","Activity","Subject","Mean_Time_body_accel-X","Mean_Time_Body_accel-Y","Mean_Time_Body_accel-Z","Sd_Time_Body_accel-X","Sd_Time_Body_accel-Y","Sd_Time_Body_accel-Z")
names(X_y_discriptive)<-Variables



#Average of each variable for each subject and activity
tapply(X_y_discriptive$`Mean_Time_body_accel-X`,list(X_y_discriptive$Activity,X_y_discriptive$Subject),mean)
tapply(X_y_discriptive$`Mean_Time_Body_accel-Y`,list(X_y_discriptive$Activity,X_y_discriptive$Subject),mean)
tapply(X_y_discriptive$`Mean_Time_Body_accel-Z`,list(X_y_discriptive$Activity,X_y_discriptive$Subject),mean)


tapply(X_y_discriptive$`Sd_Time_Body_accel-X`,list(X_y_discriptive$Activity,X_y_discriptive$Subject),mean)
tapply(X_y_discriptive$`Sd_Time_Body_accel-Y`,list(X_y_discriptive$Activity,X_y_discriptive$Subject),mean)
tapply(X_y_discriptive$`Sd_Time_Body_accel-Z`,list(X_y_discriptive$Activity,X_y_discriptive$Subject),mean)







