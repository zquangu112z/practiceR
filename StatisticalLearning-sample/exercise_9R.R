library(e1071)
# set.seed(1001)
counts = 100
errate = rep(0, counts)
for(i in 1:counts){
  x = matrix(rnorm(100 * 10), ncol = 10)
  y = c(rep(0, 50), rep(1, 50))
  x[y == 1, 1:5] = x[y == 1, 1:5] + 1
  dat = data.frame(x = x, y = as.factor(y))
  
  # svm
  # svm.fit  <-  svm(y~., data = dat, kernel = "linear", cost = 1)
  # logistic
  logistic.fit <- glm(y~., data = dat, family = binomial)
  
  xtest  <-  matrix(rnorm(100 * 10), ncol = 10)
  ytest  <-  sample(c(0, 1), 100, rep = TRUE)
  xtest[ytest == 1, 1:5] = xtest[ytest == 1, 1:5] + 1
  testdat  <-  data.frame(x = xtest, y = as.factor(ytest))
  
  # svm
  # ypred  <-  predict(svm.fit, testdat)
  # logistic
  ypred  <-  predict(logistic.fit, newdata=testdat, type = 'response')
  ypred  <-  ifelse(ypred<0.5,0,1)
  
  result  <-  table(predict = ypred, truth = testdat$y)
  errate[i]  <-  1 - (result[1] + result[4]) / 100
}
mean(errate)
