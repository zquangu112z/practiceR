load("./5R.RData")
fit=glm(y~.,data = Xy)
summary(fit)
matplot(Xy,type="l")
?matplot
