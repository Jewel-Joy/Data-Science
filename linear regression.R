library(dplyr)
library(caTools)
View(mtcars)
sample.split(mtcars$mpg,SplitRatio = 0.65)->mysplit
train<-subset(mtcars,mysplit==T)
test<-subset(mtcars,mysplit==F)
nrow(train)
nrow(test)
lm(mpg ~ ., data = train) -> mod1
predict(mod1,test)->res
View(res)
cbind(actual=test$mpg,predicted=res)->final
View(final)
as.data.frame(final)->final
cbind(final,err=final$actual-final$predicted)->final
View(final)
rmen=sqrt(mean((final$err)^2))
rmen