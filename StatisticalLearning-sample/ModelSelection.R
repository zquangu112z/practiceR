library(ISLR)
fix(Hitters)
names(Hitters)
# count number of row missing data in field "salary"
sum(is.na(Hitters$Salary))
# remove missing data row
Hitters <- na.omit(Hitters)

library(leaps)
# BEST SUBSET SELECTION 
# regfit.full <- regsubsets(Salary~., Hitters) # by default, nvmax = 8
regfit.full=regsubsets(Salary~., Hitters, nvmax =19) 
reg.summary <- summary(regfit.full)
names(reg.summary)

# Which.max function can be used to indentify the location of the maximum point of a vector
which.max(reg.summary$adjr2)
which.min(reg.summary$cp)
plot(reg.summary$cp,xlab="Number of Variables",ylab="Cp")
points(10,reg.summary$cp[10],pch=20,col="red")

# STEPWISE FORWARD
regfit.fwd <- regsubsets(Salary~., Hitters, nvmax =19, method ="forward")
summary(regfit.fwd)
plot(regfit.fwd,scale="Cp")

# VALIDATION
set.seed(1)
train=sample(seq(263),180,replace=FALSE)
regfit.fwd=regsubsets(Salary~.,data=Hitters[train,],nvmax=19,method="forward")

predict.regsubsets=function(object,newdata,id,...){
  form=as.formula(object$call[[2]])
  mat=model.matrix(form,newdata)
  coefi=coef(object,id=id)
  mat[,names(coefi)]%*%coefi
}

x.test=model.matrix(Salary~.,data=Hitters[-train,])
val.errors <- predict.regsubsets(regfit.fwd, x.test)
