diabet<-read.csv("Diabetes.csv")
View(diabet)
set.seed(2)
id<-sample(2,nrow(Diabetes),prob=c(0.7,0.3),replace=TRUE)
train<-Diabetes[id==1,]
test<-Diabetes[id==2,]
library(randomForest)
Diabetes$is_diabetic<-as.factor(Diabetes$is_diabetic)
train$is_diabetic<-as.factor(train$is_diabetic)
bestmtry<-tuneRF(train,train$is_diabetic,stepFactor=1.2improve=0.1,trace=T,plot=T)
diabet_model<-randomForest(is_diabetic~.,data=train)
importance(diabet_model)
varImpPlot(diabet_model)
predic<-predict(diabet_model,data=test,type="class")
predic