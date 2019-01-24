library(kernlab)
library(caret)
misuse<-read.csv('/home/vagisha/Desktop/Classes/College/Semester 5/Web Security/Project /Network-Intrusion-Detection-System/data/Dataset_Misuse.csv', na.strings=c(".", "NA", "", "?"), strip.white=TRUE, encoding="UTF-8")
mRow<-nrow(misuse)
mCol<-ncol(misuse)

sub<-sample(1:mRow,floor(0.66*mRow))
misuseTrainingSet<- misuse[sub,]
misuseTestSet<- misuse[-sub,]
misuseClassifier<- ksvm(AttackType~.,data=misuseTrainingSet,type = 'C-svc', kernel = 'rbfdot')
misusePrediction<-predict(misuseClassifier, misuseTestSet[,-mCol])
confusionMatrix(misusePrediction,misuseTestSet[,mCol] )
