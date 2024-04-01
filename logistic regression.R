data("mtcars")
library(caTools)
split <- sample.split(mtcars, SplitRatio = 0.7)

training <- subset(mtcars, split == TRUE)
test <- subset(mtcars, split == FALSE)
View(training)
model<-glm(vs~disp+wt,training,family="binomial")
data<-data.frame(wt=3.170,disp=351)
answer<-predict(model,data,type="response")
data<-data.frame(wt=2.465,disp=120.1)
answer<-predict(model,data,type="response")
answer
