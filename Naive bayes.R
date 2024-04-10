empdata<-read.csv("Employee_data.csv")
colnames(empdata)

sal<-ifelse(empdata$Emp_Sal==">50K","High","Low")
empdata<-data.frame(empdata,Sal)
View(empdata)
empdata<-empdata[1:1000,-15]

set.seed(2)
id<-sample(2,nrow(empdata),prob=c(0.7,0.3),replace =T)
emptrain<-empdata[id==1,]
emptest<-empdata[id==2,]

library(e1071)
library(caret)

emp_nb<-naiveBayes(Sal~.,data=emptrain)
emp_nb

preee3<-predict(emp_nb,emptest)
confusionMatrix(table(preee3,emptest$Sal))

